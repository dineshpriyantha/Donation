<%@ Page Title="Sign Up" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="Donation.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">    

    <div class="form-horizontal row">
        <div class="col-md-offset-4 col-md-4 col-sm-offset-3 col-sm-6 col-xs-offset-2 col-xs-8">
            <h2 style="text-align:center"><%: Title %></h2>
            <p class="text-danger">
                <asp:Literal runat="server" ID="ErrorMessage" />
            </p>
            <hr />
           <%-- <asp:ValidationSummary runat="server" CssClass="text-danger" />--%>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="FirstName" CssClass="col-md-12">
                    FirstName
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="FirstName"
                        CssClass="text-danger" ErrorMessage="minimum length is 2" />
                </asp:Label>
                <div class="col-md-12">
                    <asp:TextBox runat="server" ID="FirstName" CssClass="form-control" TextMode="SingleLine" />                    
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="LastName" CssClass="col-md-12">
                    LastName
                </asp:Label>
                <div class="col-md-12">
                    <asp:TextBox runat="server" ID="LastName" CssClass="form-control" TextMode="SingleLine" />                    
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-12">
                    Email
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                        CssClass="text-danger" ErrorMessage=" is required." />
                </asp:Label>
                <div class="col-md-12">
                    <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />                    
                </div>
            </div>
            <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-12">
                    Password
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                        CssClass="text-danger" ErrorMessage="minimum length is 6" />
                </asp:Label>
                <div class="col-md-12">
                    <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />                    
                </div>
            </div>
         <%--   <div class="form-group">
                <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-12">Confirm password</asp:Label>
                <div class="col-md-12">
                    <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                    <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
                </div>
            </div>--%>
            <div class="form-group">
                <div class="col-md-12">                    
                    <asp:CheckBox runat="server" ID="IsAgree" />
                    <asp:Label runat="server" >I agree to terms of service and privacy policy</asp:Label> 

                   <%-- AutoPostBack="true"--%>
                </div>
            </div>
            <div class="form-group">
                <div class="col-md-10">
                    <asp:Button runat="server" OnClick="CreateUser_Click" Text="Sign Up" CssClass="btn btn-primary" />
                </div>
            </div>
        </div>        
    </div>
</asp:Content>
