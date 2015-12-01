<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SimpleAddressBook.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        h1 {
            background-color: #3399FF;
            font-size: 60px;
            text-align: center;
        }

        .login{
            border: 1px solid black;
            width: 40%;
            margin-right: 15px;
            padding: 5px;
            float: left;
        }
        body {
            width: 80%;
            margin-right: auto;
            margin-left: auto;
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
        <h1>The Address Book</h1>
        <div class="login">
            <h3 style="text-align: center">Login</h3>
               <asp:PlaceHolder runat="server" ID="LoginStatus" Visible="false">
            <p>
               <asp:Literal runat="server" ID="StatusText" />
            </p>
         </asp:PlaceHolder>
            <div style="margin-bottom: 10px">
                <asp:Label AssociatedControlID="Username" runat="server">Username</asp:Label>
                <div>
                    <asp:TextBox ID="Username" runat="server" Width="171px" />
                </div>
            </div>
            <div style="margin-bottom: 10px">
                <asp:Label AssociatedControlID="Password" runat="server">Password</asp:Label>           
                <div>
                <asp:TextBox ID="Password" runat="server" TextMode="Password" Width="171px"></asp:TextBox>
                </div>
            </div>
            <div style="margin-bottom: 10px">
                <asp:Button runat="server" OnClick="SignIn" Text="Login" />
            &nbsp;
                <asp:Button ID="Button1" runat="server" Text="Register New User" OnClick="Button1_Click" />
            </div>
        </div>
    
        <asp:Image ID="addressbookpic" runat="server" Height="258px" ImageUrl="~/Images/addressbook.jpg" Width="284px"/>
    
    </div>
    </form>
</body>
</html>
