﻿using Donation.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using SE = System.Web.Security;

namespace Donation.Roles
{
    public partial class UsersAndRoles : System.Web.UI.Page
    {
        ApplicationDbContext context = new ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                // Bind the users and roles
                BindUsersToUserList();
                BindRolesToList();

                // Check the selected user's roles
                CheckRolesForSelectedUser();

                // Display those users belonging to the currently selected role
                DisplayUsersBelongingToRole();
            }
        }

        private void BindRolesToList()
        {
            // Get all of the roles
            var list = context.Roles.OrderBy(r => r.Name).ToList().Select(rr =>
                new SelectListItem { Value = rr.Name.ToString(), Text = rr.Name }).ToList();

            string[] roles = { "S1", "S2" };//context.Roles;
            UsersRoleList.DataSource = list;
            UsersRoleList.DataBind();

            RoleList.DataSource = list;
            RoleList.DataBind();
        }

        #region 'By User' Interface-Specific Methods
        private void BindUsersToUserList()
        {
            // Get all of the user accounts
            //MembershipUserCollection users = Membership.GetAllUsers();
            // Get all of the roles
            var list = context.Roles.OrderBy(r => r.Name).ToList().Select(rr =>
                new SelectListItem { Value = rr.Name.ToString(), Text = rr.Name }).ToList();

            //DataSet ds = ToDataSet(context.Roles.ToList());

            string[] roles = { "S1", "S2" };//context.Roles;
            UserList.DataSource = list;
            UserList.DataBind();
        }


        //public DataSet ToDataSet<T>(this IList<T> list)
        //{

        //    Type elementType = typeof(T);
        //    DataSet ds = new DataSet();
        //    DataTable t = new DataTable();
        //    ds.Tables.Add(t);

        //    //add a column to table for each public property on T
        //    foreach (var propInfo in elementType.GetProperties())
        //    {
        //        t.Columns.Add(propInfo.Name, propInfo.PropertyType);
        //    }

        //    //go through each property on T and add each value to the table
        //    foreach (T item in list)
        //    {
        //        DataRow row = t.NewRow();
        //        foreach (var propInfo in elementType.GetProperties())
        //        {
        //            row[propInfo.Name] = propInfo.GetValue(item, null);
        //        }

        //        //This line was missing:
        //        t.Rows.Add(row);
        //    }


        //    return ds;
        //}

            protected void UserList_SelectedIndexChanged(object sender, EventArgs e)
        {
            CheckRolesForSelectedUser();
        }

        private void CheckRolesForSelectedUser()
        {
            // Determine what roles the selected user belongs to
            string selectedUserName = UserList.SelectedValue;
            string[] selectedUsersRoles = SE.Roles.GetRolesForUser(selectedUserName);

            // Loop through the Repeater's Items and check or uncheck the checkbox as needed
            foreach (RepeaterItem ri in UsersRoleList.Items)
            {
                // Programmatically reference the CheckBox
                CheckBox RoleCheckBox = ri.FindControl("RoleCheckBox") as CheckBox;

                // See if RoleCheckBox.Text is in selectedUsersRoles
                if (selectedUsersRoles.Contains<string>(RoleCheckBox.Text))
                    RoleCheckBox.Checked = true;
                else
                    RoleCheckBox.Checked = false;
            }
        }

        protected void RoleCheckBox_CheckChanged(object sender, EventArgs e)
        {
            // Reference the CheckBox that raised this event
            CheckBox RoleCheckBox = sender as CheckBox;

            // Get the currently selected user and role
            string selectedUserName = UserList.SelectedValue;
            string roleName = RoleCheckBox.Text;

            // Determine if we need to add or remove the user from this role
            if (RoleCheckBox.Checked)
            {
                // Add the user to the role
                SE.Roles.AddUserToRole(selectedUserName, roleName);

                // Display a status message
                ActionStatus.Text = string.Format("User {0} was added to role {1}.", selectedUserName, roleName);
            }
            else
            {
                // Remove the user from the role
                SE.Roles.RemoveUserFromRole(selectedUserName, roleName);

                // Display a status message
                ActionStatus.Text = string.Format("User {0} was removed from role {1}.", selectedUserName, roleName);
            }

            // Refresh the "by role" interface
            DisplayUsersBelongingToRole();
        }
        #endregion

        #region 'By Role' Interface-Specific Methods
        protected void RoleList_SelectedIndexChanged(object sender, EventArgs e)
        {
            DisplayUsersBelongingToRole();
        }

        private void DisplayUsersBelongingToRole()
        {
            // Get the selected role
            string selectedRoleName = RoleList.SelectedValue;

            // Get the list of usernames that belong to the role
            //string[] usersBelongingToRole = SE.Roles.GetUsersInRole(selectedRoleName);

            // Bind the list of users to the GridView
            //RolesUserList.DataSource = usersBelongingToRole;
            //RolesUserList.DataBind();
        }

        protected void RolesUserList_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            // Get the selected role
            string selectedRoleName = RoleList.SelectedValue;

            // Reference the UserNameLabel
            Label UserNameLabel = RolesUserList.Rows[e.RowIndex].FindControl("UserNameLabel") as Label;

            // Remove the user from the role
            SE.Roles.RemoveUserFromRole(UserNameLabel.Text, selectedRoleName);

            // Refresh the GridView
            DisplayUsersBelongingToRole();

            // Display a status message
            ActionStatus.Text = string.Format("User {0} was removed from role {1}.", UserNameLabel.Text, selectedRoleName);

            // Refresh the "by user" interface
            CheckRolesForSelectedUser();
        }

        protected void AddUserToRoleButton_Click(object sender, EventArgs e)
        {
            // Get the selected role and username
            string selectedRoleName = RoleList.SelectedValue;
            string userNameToAddToRole = UserNameToAddToRole.Text;

            // Make sure that a value was entered
            if (userNameToAddToRole.Trim().Length == 0)
            {
                ActionStatus.Text = "You must enter a username in the textbox.";
                return;
            }

            // Make sure that the user exists in the system
            MembershipUser userInfo = Membership.GetUser(userNameToAddToRole);
            if (userInfo == null)
            {
                ActionStatus.Text = string.Format("The user {0} does not exist in the system.", userNameToAddToRole);
                return;
            }

            // Make sure that the user doesn't already belong to this role
            if (SE.Roles.IsUserInRole(userNameToAddToRole, selectedRoleName))
            {
                ActionStatus.Text = string.Format("User {0} already is a member of role {1}.", userNameToAddToRole, selectedRoleName);
                return;
            }

            // If we reach here, we need to add the user to the role
            SE.Roles.AddUserToRole(userNameToAddToRole, selectedRoleName);

            // Clear out the TextBox
            UserNameToAddToRole.Text = string.Empty;

            // Refresh the GridView
            DisplayUsersBelongingToRole();

            // Display a status message
            ActionStatus.Text = string.Format("User {0} was added to role {1}.", userNameToAddToRole, selectedRoleName);

            // Refresh the "by user" interface
            CheckRolesForSelectedUser();
        }
        #endregion
    }
}