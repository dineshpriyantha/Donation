using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using SE = System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using Donation.Models;

namespace Donation.Roles
{
    public partial class ManageRoles : System.Web.UI.Page
    {
        ApplicationDbContext context = new ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
                DisplayRolesInGrid();
        }

        private void DisplayRolesInGrid()
        {
            RoleList.DataSource = context.Roles.ToList(); //SE.Roles.GetAllRoles();
            RoleList.DataBind();
        }

        protected void CreateRoleButton_Click(object sender, EventArgs e)
        {
            string newRoleName = RoleName.Text.Trim();

            try
            {
                context.Roles.Add(new Microsoft.AspNet.Identity.EntityFramework.IdentityRole()
                {
                    Name = newRoleName
                });
                context.SaveChanges();
                DisplayRolesInGrid();
            }
            catch(Exception ex)
            {

            }

            //if (!SE.Roles.RoleExists(newRoleName))
            //{
            //    //Create the role
            //    SE.Roles.CreateRole(newRoleName);

            //    // Refresh the RoleList Grid
            //    DisplayRolesInGrid();
            //}

            RoleName.Text = string.Empty;
        }


        protected void RoleList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Get the RoleNameLable
            Label RoleNameLabel = RoleList.Rows[e.RowIndex].FindControl("RoleNameLabel") as Label;

            var thisrole = context.Roles.Where(r => r.Name.Equals(RoleNameLabel.Text, StringComparison.CurrentCultureIgnoreCase)).FirstOrDefault();
            
            // Delete the role
            context.Roles.Remove(thisrole);
            context.SaveChanges();            

            // Rebind the data to the RoleListgrid
            DisplayRolesInGrid();
        }
    }
}