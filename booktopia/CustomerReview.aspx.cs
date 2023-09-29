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
    public partial class CustomerReview : System.Web.UI.Page
    {
        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            reviewsubmit();
        }

        void reviewsubmit()
        {
            Response.Write("<script>alert('Testing');</script>");
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("INSERT INTO review_table2(member_id,rating,review,book_id) values(@a,@b,@c,@d)", con);
                cmd.Parameters.AddWithValue("@a", Session["username"].ToString().Trim());
                cmd.Parameters.AddWithValue("@b", rating_text.Text.Trim());
                cmd.Parameters.AddWithValue("@c", review_text.Text.Trim());
                cmd.Parameters.AddWithValue("@d", TextBox1.Text.Trim());
                cmd.ExecuteNonQuery();



                cmd = new SqlCommand("SELECT * from book_master_tbl WHERE book_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                float x, y, a;
                x = float.Parse(dt.Rows[0]["rating_sum"].ToString().Trim());
                y = float.Parse(dt.Rows[0]["rating_cnt"].ToString().Trim());
                a = float.Parse(rating_text.Text.Trim());
                x = x*y + a;
                y = y + 1;
                x = x / y;
                cmd = new SqlCommand("UPDATE book_master_tbl set rating_sum=@rs, rating_cnt=@rc where book_id='" + TextBox1.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@rs", x);
                cmd.Parameters.AddWithValue("@rc", y);
                cmd.ExecuteNonQuery();

                con.Close();
                Response.Write("<script>alert('Review sussesfully posted');</script>");
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            getBookByID();
        }

        void getBookByID()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from book_master_tbl WHERE book_id='" + TextBox1.Text.Trim() + "';", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                float x, y,z;
                if (dt.Rows.Count >= 1)
                {
                    TextBox2.Text = dt.Rows[0]["book_name"].ToString();
                    imgview.ImageUrl = dt.Rows[0]["book_img_link"].ToString().Trim();
                    x = float.Parse(dt.Rows[0]["rating_sum"].ToString().Trim());
                    
                    rating_text.Text = x.ToString();

                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID');</script>");
                }

            }
            catch (Exception ex)
            {

            }
        }
    }
}