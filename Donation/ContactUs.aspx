<%@ Page Title="Contact Us" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ContactUs.aspx.cs" Inherits="Donation.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    
    <div class="container">
    <div class="row">
        <div class="col-md-offset-2 col-md-8">
            <div class="dg_contact">
                <h2>Get In Touch</h2>
                <h4>Phone: +2 (02) 27376756</h4>
                <h4>Email: hamdy.mostata@legaliacorp.com</h4>
                <h4>Address: 1B Mahmoud Azmy Street, off 26th July Street, Zamalek, Cairo, Egypt.</h4>
            </div>            
        </div>
        <div class="col-md-offset-1 col-md-10">
            <div class="well well-sm">
                <form>
                <div class="form-horizontal row">
                    <div class="col-md-6">
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="name" CssClass="form-control" TextMode="SingleLine" placeholder="YOUR NAME*"/>                    
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="email" CssClass="form-control" TextMode="Email" placeholder="YOUR EMAIL*" />                    
                            </div>
                        </div>
                        <div class="form-group">
                            <div class="col-md-12">
                                <asp:TextBox runat="server" ID="phone" CssClass="form-control" TextMode="SingleLine" placeholder="YOUR PHONE*"/>                    
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="form-group">
                             <div class="col-md-12">
                                <asp:TextBox runat="server" ID="message" CssClass="form-control" TextMode="MultiLine" Rows="6" placeholder="YOUR MESSAGE*"/>                    
                            </div>
                        </div>
                    </div>
                    <div class="col-md-12">
                        <asp:Button runat="server" Text="SEND MESSAGE" CssClass="btn btn-primary pull-right" />
                    </div>
                </div>
                </form>
            </div>
        </div>
        
    </div>
</div>
</asp:Content>
