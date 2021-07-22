<%@ Page Title="Donations" Language="C#"  MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Donations.aspx.cs" Inherits="Donation.Donations" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">        
        <div class="col-md-offset-2 col-md-8">
            <h2><%: Title %></h2>
            <h3>Submitted Donations:</h3>
            <table class="table">
              <thead class="thead-dark">
                <tr>
                  <th scope="col">Date</th>
                  <th scope="col">Amount</th>
                  <th scope="col">Email</th>
                  <th scope="col">First Name</th>
                  <th scope="col">Last Name</th>
                  <th scope="col">Phone</th>
                  <th scope="col">Address</th>
                  <th scope="col">City</th>
                  <th scope="col">State</th>
                  <th scope="col">Zip Code</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                  <td>Mark</td>
                </tr>
                <tr>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                  <td>Mark</td>
                </tr>
                <tr>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                  <td>Mark</td>
                  <td>Otto</td>
                  <td>@mdo</td>
                  <td>Mark</td>
                </tr>
              </tbody>
            </table>
        </div>
    </div>
</asp:Content>
