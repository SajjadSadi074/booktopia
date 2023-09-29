using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace booktopia
{
    public partial class ordermanagement : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            submitorder();
        }
        

        void getorder()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from order_table WHERE order_id='" + order_id_text.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                if (dt.Rows.Count >= 1)
                {
                    book_id_text.Text = dt.Rows[0]["book_id"].ToString().Trim();
                    phone_id_text.Text = dt.Rows[0]["phone"].ToString().Trim();
                    Address_text.Text = dt.Rows[0]["Address"].ToString().Trim();
                    member_id_text.Text = dt.Rows[0]["member_id"].ToString().Trim();
                    DropDownList3.SelectedValue = dt.Rows[0]["status"].ToString().Trim();
                    pay_text.Text = dt.Rows[0]["payment"].ToString().Trim();
                    t_id_text.Text = dt.Rows[0]["t_id"].ToString().Trim();
                }
                else
                {
                    Response.Write("<script>alert('Invalid Order ID');</script>");
                }

            }
            catch (Exception ex)
            {

            }
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            getorder();
        }

        void submitorder()
        {
            SqlConnection con = new SqlConnection(strcon);
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            SqlCommand cmd = new SqlCommand("update order_table set status='" +DropDownList3.Text.Trim() + "' where order_id = "+ order_id_text.Text.Trim()+ ";", con);
            cmd.ExecuteNonQuery();
            con.Close();
            Response.Write("<script>alert('Process successfully.');</script>");
            GridView1.DataBind();
        }
    }
}