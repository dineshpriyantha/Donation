<%@ Page Title="Manage Roles" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ManageRoles.aspx.cs" Inherits="Donation.Roles.ManageRoles" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">        
        <div class="col-md-offset-2 col-md-8">
            <h2><%: Title %></h2>

            <div class="form-group row">
                <asp:Label runat="server" AssociatedControlID="RoleName" CssClass="col-md-2">
                    Create a New Role:
                </asp:Label>
                <div class="col-md-10">
                    <asp:TextBox runat="server" ID="RoleName" CssClass="form-control" TextMode="SingleLine" />
                    <asp:RequiredFieldValidator ID="RoleNameReqField" runat="server" 
                        ControlToValidate="RoleName" Display="Dynamic" 
                        ErrorMessage="You must enter a role name."></asp:RequiredFieldValidator>
                </div>
            </div>

             <div class="form-group row">
                <div class="col-md-offset-2 col-md-10 ">
                    <asp:Button ID="CreateRoleButton" runat="server" Text="Create Role" 
                        onclick="CreateRoleButton_Click" CssClass="btn btn-primary"/>
                </div>
            </div>

            <div class="form-group row">
                <div class="col-md-offset-2 col-md-10 ">
                    <asp:GridView ID="RoleList" runat="server" AutoGenerateColumns="False" 
                        onrowdeleting="RoleList_RowDeleting" CssClass="table" >
                        <Columns>
                            <asp:CommandField DeleteText="Delete Role" ShowDeleteButton="True" />
                            <asp:TemplateField HeaderText="Role">
                                <ItemTemplate>
                                    <asp:Label runat="server" ID="RoleNameLabel" Text='<%# Bind("Name")  %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
                
        </div>
    </div>
</asp:Content>

