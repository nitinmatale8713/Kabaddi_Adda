using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using log4net;
using System.Reflection;
using System.Data.SqlClient;
using System.IO;
using System.Drawing.Imaging;
using System.Globalization;


namespace PROJECT_KHELKABADDI
{
    public partial class frm_Login : System.Web.UI.Page
    {
        protected static readonly ILog log = LogManager.GetLogger(typeof(frm_Login));
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {

            }
        }

        protected void LoginButton_Click(object sender, EventArgs e)
        {
            DataSet ods = new System.Data.DataSet(); lblError.Visible = false;
            try
            {
                string str = System.Configuration.ConfigurationManager.AppSettings["strCon"];
                SqlConnection cn = new SqlConnection(str);
                using (SqlConnection con = new SqlConnection(str))
                {
                    con.Open();
                    SqlCommand cmd = new SqlCommand("Sp_GetLoginDtl", con);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@username", txtUserName.Text.Trim().ToUpper());
                    cmd.Parameters.AddWithValue("@password", txtPassword.Text.Trim());

                    SqlDataAdapter da = new SqlDataAdapter(cmd);
                    da.Fill(ods);
                    con.Close();
                    if (ods != null)
                    {
                        if (ods.Tables.Count > 0)
                        {
                            if (ods.Tables[0].Rows.Count > 0)
                            {
                                string strRole = ods.Tables[0].Rows[0]["USERTYPE"].ToString();
                                string strUserId = ods.Tables[0].Rows[0]["ID"].ToString();
                                Session["USERNAME"] = txtUserName.Text.Trim().ToUpper();
                                Session["USERROLE"] = strRole.ToUpper();
                                if (strRole.ToUpper() == "ADMIN")
                                {
                                    Response.Redirect("Admin/CreateTournament.aspx");
                                }
                                if (strRole.ToUpper() == "SUPERADMIN")
                                {
                                    Response.Redirect("Admin/CreateTournament.aspx");
                                }
                                if (strRole.ToUpper() == "USER")
                                {
                                    string strMessage = CheckPlayerActive();
                                    Session["USERID"] = strUserId.Trim();
                                    if (strMessage.ToUpper().Trim() == "EXISTS1")
                                    {
                                        Response.Redirect("Admin/PlayerMapping.aspx");
                                    }
                                    if (strMessage.ToUpper().Trim() == "TOSS")
                                    {

                                        Response.Redirect("Admin/PlayerMapping.aspx");
                                    }
                                    else
                                    {
                                        Response.Redirect("Admin/Dashboard.aspx");
                                    }

                                }
                            }
                            else
                            {
                                lblError.Visible = true;
                                lblError.Text = "Invalid User Credential";
                            }

                        }
                        else
                        {
                            lblError.Visible = true;
                            lblError.Text = "Invalid User Credential";
                        }

                    }
                    else
                    {
                        lblError.Visible = true;
                        lblError.Text = "Invalid User Credential";
                    }





                }
            }
            catch (Exception ex)
            {
                log.Error("Method Name: " + MethodBase.GetCurrentMethod().Name + " | Description: " + ex.Message + " " + ex.InnerException);
            }
        }

        private string CheckPlayerActive()
        {
            string str = System.Configuration.ConfigurationManager.AppSettings["strCon"];
            SqlConnection con = new SqlConnection(str); string message = string.Empty;
            try
            {
                con.Open(); int i = 0;
                SqlCommand cmd = new SqlCommand("Sp_CheckPlayerActive", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@M_USER_ID", txtUserName.Text.ToUpper().Trim());
                cmd.Parameters.Add("@ERROR", SqlDbType.Char, 7);
                cmd.Parameters["@ERROR"].Direction = ParameterDirection.Output;
                i = cmd.ExecuteNonQuery();
                message = (string)cmd.Parameters["@ERROR"].Value;
            }
            catch (Exception ex)
            {
                log.Error("Method Name: " + MethodBase.GetCurrentMethod().Name + " | Description: " + ex.Message + " " + ex.InnerException);
            }
            return message;
        }
    }
}