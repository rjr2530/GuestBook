using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Entity;
using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;

namespace SimpleAddressBook
{
    public partial class AddressBook : System.Web.UI.Page
    {
        //Create AddressBook Entity DbContext to access and manipulate database
        Models.AddressBookEntities dbContext = new Models.AddressBookEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            //shows welcome message with user's username
            UserLabel.Text = "Welcome " + User.Identity.GetUserName();
            
            //Show all contacts in contactsGridView if this is first time page is loaded
            if(!IsPostBack)
            LoadAllContacts();
        }


        //if there is at lease one result in query hide contactNotFoundLabel
        //and set contactGridview data source to the resulting collection from query
        // clear findTextBox text. if there are no results show contactNotFoundLabel
        //and hide contactGridview
        protected void findButton_Click(object sender, EventArgs e)
        {   
            //use LINQ to filter addresses using text in findTextBox and load into memory
            dbContext.Addresses.Where(address => address.LastName == findTextBox.Text).Load();

            if (dbContext.Addresses.Local.Count() > 0)
            {
                contactNotFoundLabel.Visible = false; //hide contactNotFoundLabel
                contactGridView.DataSource = dbContext.Addresses.Local; //set datasource to filtered query in memory
                contactGridView.DataBind(); //update contactGridview

                findTextBox.Text = String.Empty; //clear text field of findTextBox
            }
            else
            {
                contactNotFoundLabel.Visible = true; //show contactNotFound Label
                contactGridView.Visible = false; //hide contactGridView
          
                findTextBox.Text = String.Empty;
            }
        }


        //Use LINQ to query all records from database and sort by LastName and then by FirstName and then load
        //results into memory and set contactGridview's datasource to the results and the update contactGridView 
        private void LoadAllContacts()
        {
            dbContext.Addresses
                .OrderBy(address => address.LastName)
                .ThenBy(address => address.FirstName
                ).Load(); //query all records and sort by last name then first name and load into memory
            
            contactGridView.DataSource = dbContext.Addresses.Local; //set contactGridView datasoure to queried result in local memory
            contactGridView.DataBind(); //update contactGridView
        }


        //show all contacts in contactGridView and hide contactNotFoundLabel
        protected void browseButton_Click(object sender, EventArgs e)
        {
            LoadAllContacts();
            contactNotFoundLabel.Visible = false;
            contactGridView.Visible = true;
        }

        //redirect to AddContact page
        protected void addContactButton_Click(object sender, EventArgs e)
        {
            Response.Redirect("AddContact.aspx");
        }

        //delete a contact from gridview
        protected void contactGridView_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            //get AddressID for selected row
            int id = (int)contactGridView.DataKeys[e.RowIndex].Value;

            //get Address object from selected from selected row
            Models.Address address = (from a in dbContext.Addresses
                                      where a.AddressID == id
                                      select a).First();
            
            //delete contact from gridview and database
            dbContext.Addresses.Remove(address);
           
            //save changes to database
            dbContext.SaveChanges();


            //set EditIndext to default value
            contactGridView.EditIndex = -1;

            //show updated contactGridView
            LoadAllContacts();
        }

        //get row index to edit
        protected void contactGridView_RowEditing(object sender, GridViewEditEventArgs e)
        {
            contactGridView.EditIndex = e.NewEditIndex; //get edit index of row
            LoadAllContacts();
        }

        //change cells in row to textboxes so user can edit fields and save change to database then update contactsGridview
        protected void contactGridView_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            //get AddressID of selected row
            int id = (int)contactGridView.DataKeys[e.RowIndex].Value;

            //get row object
            GridViewRow editingRow = contactGridView.Rows[e.RowIndex];


            TextBox firstNameTextBox = (TextBox)editingRow.Cells[2].Controls[0]; //convert FirstName cell to textbox object
            TextBox lastNameTextBox = (TextBox)editingRow.Cells[3].Controls[0]; //convert LastName cell to textbox object
            TextBox phoneTextBox = (TextBox)editingRow.Cells[4].Controls[0]; //convert Phone cell to textbox object
            TextBox emailTextBox = (TextBox)editingRow.Cells[5].Controls[0]; //convert Email cell to textbox object

            contactGridView.EditIndex = -1; //set edit index to default value

            //get contact that has the same AddressID of the selected row
            Models.Address updatedAddress = (from contact in dbContext.Addresses
                                             where contact.AddressID == id
                                             select contact).Single();
            
            //if textboxes aren't null assign contact fields to values of textboxes
            if (firstNameTextBox.Text != String.Empty)
                updatedAddress.FirstName = firstNameTextBox.Text;

            if (lastNameTextBox.Text != String.Empty)
                updatedAddress.LastName = lastNameTextBox.Text;

            if (phoneTextBox.Text != String.Empty)
                updatedAddress.Phone = phoneTextBox.Text;

            if (emailTextBox.Text != String.Empty)
                updatedAddress.Email = emailTextBox.Text;

            dbContext.SaveChanges(); //save changes to database

            LoadAllContacts(); //update contactsGridView
        }

        //cancels edit and changes edit index to default value
        protected void contactGridView_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            contactGridView.EditIndex = -1;
            LoadAllContacts();
        }

        //log user out from addressbook page
        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            //gets current user's authenticaiton OWIN context
            var authenticationManager = HttpContext.Current.GetOwinContext().Authentication;
            
            authenticationManager.SignOut(); //signs user out of web app

            Response.Redirect("~/Login.aspx"); //returns user to login page
        }
    }
}