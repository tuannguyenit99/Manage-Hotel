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
   
    public partial class WebForm1 : System.Web.UI.Page
    {
        
     
        public static List<string> ds = new List<string>();
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=DATN_QUANLYKHACHSAN;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            Button2.Visible = false;
            chuanhien.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            Session["Dat"] = ngayden.Value.ToString();
            Session["Dat1"] = ngaydi.Value.ToString();
            string ngay = Session["Dat"].ToString();
            string ngay1 = Session["Dat1"].ToString();


            Button2.Visible = true;
            chuanhien.Visible = true;
        }

     

        protected void Button2_Click(object sender, EventArgs e)
        {
            foreach (GridViewRow gvrow in GridView1.Rows)
            {
                var checkbox = gvrow.FindControl("CheckBox1") as CheckBox;
                if (checkbox.Checked)
                {
                   
                    var lblID = gvrow.FindControl("Label1") as Label;
                    
                    ds.Add(lblID.Text);

                    Session["kt"] = ds;



                }
              
            }
            Response.Redirect("ThongTinKhachHang.aspx");
         

        }
    }
}