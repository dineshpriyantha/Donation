<%@ Page Title="Donate" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Donate.aspx.cs" Inherits="Donation.Donate" %>


<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">        
        <div class="col-md-offset-2 col-md-8">
            <h2><%: Title %></h2>
            <h3>Please enter your donation:</h3>
            <hr />
            <form>
                <script>
                    function toUSD(objctrl) {
                        //Get the Entered Value
                        var number = objctrl.value.toString(),
                            //Split the number between dollars and cents
                            dollars = number.split('.')[0], cents = (number.split('.')[1] || '') + '00';
                        dollars = dollars.split('').reverse().join('').replace(/(\d{3}(?!$))/g, '$1,').split('').reverse().join('');
                        //Concatenate the number with currecny symbol
                        objctrl.value = '$' + dollars + '.' + cents.slice(0, 2);
                    }
                </script>

                <div class="form-group row">
                  <asp:Label runat="server" AssociatedControlID="dg_Date" CssClass="col-sm-3 col-form-label">
                    Date:                    
                    </asp:Label>
                <div class="col-sm-9">
                     <asp:TextBox runat="server" ID="dg_Date" CssClass="form-control" TextMode="Date" /> 
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="dg_Date"
                        CssClass="text-danger" ErrorMessage="Date is required" />
                </div>
              </div>
              <div class="form-group row">
                  <asp:Label runat="server" AssociatedControlID="dg_Amount" CssClass="col-sm-3 col-form-label">
                    Donation Amount:                    
                    </asp:Label>
                <div class="col-sm-9">
                     <asp:TextBox runat="server" ID="dg_Amount" CssClass="form-control" TextMode="singleline" onblur="toUSD(this)"/> 
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="dg_Amount"
                        CssClass="text-danger" ErrorMessage="Donation Amount is required" /> <br />
                </div>
              </div>
              <div class="form-group row">
                <asp:Label runat="server" AssociatedControlID="dg_emailAddress" CssClass="col-sm-3 col-form-label">
                    Email Address:                    
                    </asp:Label>
                <div class="col-sm-9">
                   <asp:TextBox runat="server" ID="dg_emailAddress" CssClass="form-control" TextMode="Email" /> 
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="dg_emailAddress"
                        CssClass="text-danger" ErrorMessage="Email address is required" />
                </div>
              </div>
               <div class="form-group row">
                <asp:Label runat="server" AssociatedControlID="dg_emailReEntry" CssClass="col-sm-3 col-form-label">
                    Email Re-entry:                    
                    </asp:Label>
                <div class="col-sm-9">
                   <asp:TextBox runat="server" ID="dg_emailReEntry" CssClass="form-control" TextMode="Email" /> 
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="dg_emailReEntry"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="Email Re-entry is required" />
                    <asp:CompareValidator runat="server" ControlToCompare="dg_emailAddress" ControlToValidate="dg_emailReEntry"
                        CssClass="text-danger" Display="Dynamic" ErrorMessage="The email and re-entry email do not match." />
                </div>
              </div>

                <div class="form-group row">
                  <asp:Label runat="server" AssociatedControlID="dg_firstName" CssClass="col-sm-3 col-form-label">
                    First Name:                    
                    </asp:Label>
                <div class="col-sm-9">
                     <asp:TextBox runat="server" ID="dg_firstName" CssClass="form-control" TextMode="SingleLine" /> 
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="dg_firstName"
                        CssClass="text-danger" ErrorMessage="First Name is required" /> <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorfirstName" runat="server" ControlToValidate="dg_firstName" CssClass="text-danger" 
                        ValidationExpression="[a-zA-Z]*$" ErrorMessage="*Valid characters: Alphabets only." />
                </div>
              </div>

                <div class="form-group row">
                  <asp:Label runat="server" AssociatedControlID="dg_lastName" CssClass="col-sm-3 col-form-label">
                    Last Name:                    
                    </asp:Label>
                <div class="col-sm-9">
                     <asp:TextBox runat="server" ID="dg_lastName" CssClass="form-control" TextMode="SingleLine" /> 
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="dg_lastName"
                        CssClass="text-danger" ErrorMessage="Last Name is required" /> <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorlastName" runat="server" ControlToValidate="dg_lastName" CssClass="text-danger" 
                        ValidationExpression="[a-zA-Z]*$" ErrorMessage="*Valid characters: Alphabets only." />
                </div>
              </div>
            <div class="form-group row">
                <asp:Label runat="server" AssociatedControlID="dg_priorPhone" CssClass="col-sm-3 col-form-label">Use Prior Phone Number and Address:</asp:Label> 
                    <div class="col-sm-9">
                <asp:CheckBox runat="server" ID="dg_priorPhone" />                   
                </div>                
            </div>

                <div class="form-group row">
                  <asp:Label runat="server" AssociatedControlID="dg_phone" CssClass="col-sm-3 col-form-label">
                    Phone Number:                    
                    </asp:Label>
                <div class="col-sm-9">
                     <asp:TextBox runat="server" ID="dg_phone"  CssClass="form-control" TextMode="SingleLine" /> 
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="dg_phone"
                        CssClass="text-danger" ErrorMessage="Phone number is required" /><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server"  
                        ControlToValidate="dg_phone"  CssClass="text-danger" ErrorMessage=" phone number to be in XXX-XXX-XXXX form"  
                        ValidationExpression="[0-9]{3}-[0-9]{3}-[0-9]{4}"></asp:RegularExpressionValidator> 
                </div>
              </div>

             <h2>Billing Address</h2>
                <hr />

                <div class="form-group row">
                  <asp:Label runat="server" AssociatedControlID="dg_address" CssClass="col-sm-3 col-form-label">
                    Address:                    
                    </asp:Label>
                <div class="col-sm-9">
                     <asp:TextBox runat="server" ID="dg_address" CssClass="form-control" TextMode="SingleLine" /> 
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="dg_address"
                        CssClass="text-danger" ErrorMessage="Address is required" />
                </div>
              </div>

                <div class="form-group row">
                  <asp:Label runat="server" AssociatedControlID="dg_city" CssClass="col-sm-3 col-form-label">
                    City:                    
                    </asp:Label>
                <div class="col-sm-9">
                     <asp:TextBox runat="server" ID="dg_city" CssClass="form-control" TextMode="SingleLine" /> 
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="dg_city"
                        CssClass="text-danger" ErrorMessage="City is required" /><br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidatorcity" runat="server" ControlToValidate="dg_city" CssClass="text-danger" 
                        ValidationExpression="[a-zA-Z]*$" ErrorMessage="*Valid characters: Alphabets only." />
                </div>
              </div>

                <div class="form-group row">
                  <asp:Label runat="server" AssociatedControlID="dg_state" CssClass="col-sm-3 col-form-label">
                    state:                    
                    </asp:Label>
                <div class="col-sm-9">
                    <asp:DropDownList id="dg_state"
                        CssClass="form-control"
                        runat="server">
                      <asp:ListItem Selected="True" Value="-1"> - Select State -  </asp:ListItem>
                      <asp:ListItem Value="1"> Alaska </asp:ListItem>
                      <asp:ListItem Value="2"> California </asp:ListItem>
                      <asp:ListItem Value="3"> Florida </asp:ListItem>
                      <asp:ListItem Value="4"> Hawaii </asp:ListItem>
                   </asp:DropDownList>
                     <asp:RequiredFieldValidator runat="server" ControlToValidate="dg_state"
                        CssClass="text-danger" ErrorMessage="State is required" />  
                </div>
              </div>

                 <div class="form-group row">
                  <asp:Label runat="server" AssociatedControlID="dg_zipcode" CssClass="col-sm-3 col-form-label">
                    Zip Code:                    
                    </asp:Label>
                <div class="col-sm-9">
                     <asp:TextBox runat="server" MaxLength="5" ID="dg_zipcode" CssClass="form-control" TextMode="number" /> 
                    <asp:RequiredFieldValidator runat="server" ControlToValidate="dg_zipcode"
                        CssClass="text-danger" ErrorMessage="Max length is 5" />                    
                </div>
              </div>
               <div class="form-group row">
                <div class="col-md-10">
                    <asp:Button runat="server" ID="CreateDonate" Text="Submit" CssClass="btn btn-primary" OnClick="CreateDonate_Click"/>
                    <asp:Button runat="server" Text="Clear" CssClass="btn btn-primary" />
                </div>
            </div>
            </form>

             <div class="form-group row">
                <div class="col-md-10">
                    <asp:Label runat="server" ForeColor="Green" ID="dg_message" CssClass="col-form-label">                  
                    </asp:Label>
                </div>
            </div>
           
           
        </div>
    </div>
</asp:Content>


