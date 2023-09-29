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
    public partial class orderhere : System.Web.UI.Page
    {

        string strcon = ConfigurationManager.ConnectionStrings["con"].ConnectionString;
        static string global_filepath;
        static int global_actual_stock, global_current_stock, global_issued_books;


        protected void Page_Load(object sender, EventArgs e)
        {
            member_id_text.Text = Session["username"].ToString().Trim();
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {

        }

        protected void TextBox9_TextChanged(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            SubmitOrder();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            getBookByID();
        }


        void SubmitOrder()
        {
            try
            {
                SqlConnection con = new SqlConnection(strcon);
                if (con.State == ConnectionState.Closed)
                {
                    con.Open();
                }
                SqlCommand cmd = new SqlCommand("SELECT * from order_table;", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();
                da.Fill(dt);
                int o_id = dt.Rows.Count;
                o_id = o_id + 2;
                cmd = new SqlCommand("INSERT INTO order_table(book_id,phone,Address,order_id,member_id,status,payment,t_id) values(@book_id,@phone,@Address,@order_id,@member_id,@status,@payment,@t_id)", con);
              
                cmd.Parameters.AddWithValue("@book_id", book_id_text.Text.Trim());
                cmd.Parameters.AddWithValue("@phone", phone_id_text.Text.Trim());
                cmd.Parameters.AddWithValue("@Address", Address_text.Text.Trim());
                cmd.Parameters.AddWithValue("@order_id", o_id);
                cmd.Parameters.AddWithValue("@member_id", member_id_text.Text.Trim());
                cmd.Parameters.AddWithValue("@status", "Pending");
                cmd.Parameters.AddWithValue("@payment", pay_text.Text.Trim());
                cmd.Parameters.AddWithValue("@t_id", t_id_text.Text.Trim());
                cmd.ExecuteNonQuery();
                
                cmd = new SqlCommand("SELECT * from book_master_tbl WHERE book_id='" + TextBox1.Text.Trim() + "';", con);
                da = new SqlDataAdapter(cmd);
                dt = new DataTable();
                da.Fill(dt);
                float x=0;
                if (dt.Rows.Count >= 1)
                {
                    x = float.Parse(dt.Rows[0]["current_stock"].ToString().Trim());
                    x = x - 1;

                }
                else
                {
                    Response.Write("<script>alert('Invalid Book ID');</script>");
                }
                Response.Write("<script>alert('Order placed successfully.');</script>");
                
                cmd = new SqlCommand("UPDATE book_master_tbl set current_stock=@cs where book_id='" + book_id_text.Text.Trim() + "'", con);
                cmd.Parameters.AddWithValue("@cs", x);
                cmd.ExecuteNonQuery();

                con.Close();

            }
            catch(Exception ex)
            {
                Response.Write("<script>alert('" + ex.Message + "');</script>");
            }


            
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
                if (dt.Rows.Count >= 1)
                {
                    book_id_text.Text = dt.Rows[0]["book_id"].ToString();
                    TextBox2.Text = dt.Rows[0]["book_name"].ToString();
                    TextBox3.Text = dt.Rows[0]["publish_date"].ToString();
                    TextBox9.Text = dt.Rows[0]["edition"].ToString();
                    TextBox10.Text = dt.Rows[0]["book_cost"].ToString().Trim();
                    TextBox11.Text = dt.Rows[0]["no_of_pages"].ToString().Trim();
                    string st = dt.Rows[0]["rating_sum"].ToString().Trim();
                    st = st + ".0";
                    TextBox4.Text = st.Substring(0, 3);
                    TextBox5.Text = dt.Rows[0]["rating_cnt"].ToString().Trim();
                    TextBox6.Text = dt.Rows[0]["book_description"].ToString();
                    TextBox7.Text = "" + (Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString()) - Convert.ToInt32(dt.Rows[0]["current_stock"].ToString()));

                    DropDownList1.SelectedValue = dt.Rows[0]["language"].ToString().Trim();
                    TextBox8.Text = dt.Rows[0]["publisher_name"].ToString().Trim();
                    TextBox12.Text = dt.Rows[0]["author_name"].ToString().Trim();

                    imgview.ImageUrl = dt.Rows[0]["book_img_link"].ToString().Trim();

                    ListBox1.ClearSelection(); 
                    string[] gener = dt.Rows[0]["gener"].ToString().Trim().Split(',');
                    for (int i = 0; i < gener.Length; i++)
                    {
                        for (int j = 0; j < ListBox1.Items.Count; j++)
                        {
                            if (ListBox1.Items[j].ToString() == gener[i])
                            {
                                ListBox1.Items[j].Selected = true;

                            }
                        }
                    }

                    global_actual_stock = Convert.ToInt32(dt.Rows[0]["actual_stock"].ToString().Trim());
                    global_current_stock = Convert.ToInt32(dt.Rows[0]["current_stock"].ToString().Trim());
                    global_issued_books = global_actual_stock - global_current_stock;
                    global_filepath = dt.Rows[0]["book_img_link"].ToString();

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