using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
namespace DATN_QLKS
{
    public partial class NhanPhong : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=DATN_QUANLYKHACHSAN;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {
                Button2.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gvrow in GridView1.Rows)
            {
                
                var checkbox = gvrow.FindControl("CheckBox1") as CheckBox;
                var checkbox1 = gvrow.FindControl("CheckBox2") as CheckBox;
                if (checkbox.Checked)
                {
                    con.Open();
                    var lblID1 = gvrow.FindControl("Label1") as Label;
                    var lblID2 = gvrow.FindControl("Label2") as Label;

                    SqlCommand cmd5 = new SqlCommand("update HDPhong Set TrangThai=2 where MaHD=@MaHD and MaPhong=@MaPhong", con);
                    cmd5.Parameters.AddWithValue("MaHD", lblID2.Text);
                    cmd5.Parameters.AddWithValue("MaPhong", lblID1.Text);
                    cmd5.ExecuteNonQuery();
                    con.Close();


                }

                if (checkbox1.Checked)
                {
                    con.Open();
                    var lblID3 = gvrow.FindControl("Label1") as Label;
                    var lblID4 = gvrow.FindControl("Label2") as Label;

                    SqlCommand cmd6 = new SqlCommand("Delete from HDPhong where MaHD=@MaHD and MaPhong=@MaPhong", con);
                    cmd6.Parameters.AddWithValue("MaHD", lblID4.Text);
                    cmd6.Parameters.AddWithValue("MaPhong", lblID3.Text);
                    cmd6.ExecuteNonQuery();


                    SqlCommand cmd7 = new SqlCommand("update DanhMucPhong Set TinhTrang=NULL where MaPhong=@MaPhong", con);
                    cmd7.Parameters.AddWithValue("MaPhong", lblID3.Text);
                    cmd7.ExecuteNonQuery();


                  
                    con.Close();


                }
               
            }
            Response.Redirect(Request.Url.AbsoluteUri);
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Button2.Visible = true;
        }
    }
}