using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;



namespace SimpleAddressBook
{
    public partial class AddContact : System.Web.UI.Page
    {
        //Create AddressBook Entity DbContext to access and manipulate database
        Models.AddressBookEntities dbContext = new Models.AddressBookEntities();

        protected void Page_Load(object sender, EventArgs e)
        {
            //disable unobtrusive validation
            UnobtrusiveValidationMode = System.Web.UI.UnobtrusiveValidationMode.None;
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {
            //validate server controls 
            Validate();

            //if page is valid create new Address object and assign text values from text boxes to Address object properites
            if (IsValid)
            {
                //create new Address object
                Models.Address address = new Models.Address();

                address.FirstName = firstNameTextBox.Text;
                address.LastName = lastNameTextBox.Text;
                address.Phone = phoneTextBox.Text;
                address.Email = emailTextBox.Text;

                dbContext.Addresses.Add(address); //add new row to database
                dbContext.SaveChanges();//save changeds to database

                Response.Redirect("AddressBook.aspx"); //redirect to AddressBook page
            }
        }

        //clear all text boxes
        protected void clearButton_Click(object sender, EventArgs e)
        {
            firstNameTextBox.Text = string.Empty;
            lastNameTextBox.Text = string.Empty;
            phoneTextBox.Text = string.Empty;
            emailTextBox.Text = string.Empty;
        }
    }
}