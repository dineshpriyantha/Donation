using Donation.Models;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Donation
{
    public partial class Donate : System.Web.UI.Page
    {
        ApplicationDbContext context = new ApplicationDbContext();

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Unnamed_Click(object sender, EventArgs e)
        {

        }

        protected void CreateDonate_Click(object sender, EventArgs e)
        {
            SqlConnection con = DBConnect.CreateConnection();

            try
            {                
                SqlCommand cmd = new SqlCommand("dg_AddDonate", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add("@DonateDate", SqlDbType.DateTime).Value = Convert.ToDateTime(dg_Date.Text);
                cmd.Parameters.Add("@Amount", SqlDbType.VarChar, 100).Value = dg_Amount.Text;
                cmd.Parameters.Add("@Email", SqlDbType.VarChar, 50).Value = dg_emailAddress.Text;
                cmd.Parameters.Add("@FirstName", SqlDbType.VarChar, 50).Value = dg_firstName.Text;
                cmd.Parameters.Add("@LastName", SqlDbType.VarChar, 50).Value = dg_lastName.Text;
                cmd.Parameters.Add("@PriorPhone", SqlDbType.Bit).Value = dg_priorPhone.Checked == true ? true : false;
                cmd.Parameters.Add("@Phone", SqlDbType.VarChar, 15).Value = dg_phone.Text;

                // address 
                cmd.Parameters.Add("@Name", SqlDbType.VarChar, -1).Value = dg_address.Text;
                cmd.Parameters.Add("@City", SqlDbType.VarChar, 15).Value = dg_city.Text;
                cmd.Parameters.Add("@Zipcode", SqlDbType.Int).Value = Convert.ToInt32(dg_zipcode.Text);
                cmd.Parameters.Add("@SId", SqlDbType.Int).Value = Convert.ToInt32(dg_state.SelectedValue);

                con.Open();
                int result = cmd.ExecuteNonQuery();
                if (result == 2)
                {
                    Clear();
                    dg_message.Text = "Successfully Inserted...!";
                }
                else
                {
                    dg_message.Text = "Insert Fail...!";
                }
                
            }
            catch(Exception ex)
            {
                dg_message.Text = ex.Message;
            }
            finally
            {
                con.Close();
            }
        }

        private void Clear()
        {
            dg_Date.Text = "";
            dg_Amount.Text = "";
            dg_emailAddress.Text = "";
            dg_emailReEntry.Text = "";
            dg_firstName.Text = "";
            dg_lastName.Text = "";
            dg_priorPhone.Checked = false;
            dg_phone.Text = "";
            dg_address.Text = "";
            dg_city.Text = "";
            dg_zipcode.Text = "";
            dg_state.SelectedValue = null;
        }
    }
}