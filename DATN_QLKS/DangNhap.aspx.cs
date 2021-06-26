using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.Sql;
using System.Data;
using System.Data.SqlClient;
namespace DATN_QLKS
{
    public partial class DangNhap : System.Web.UI.Page
    {
        SqlConnection con = new SqlConnection("Data Source=.;Initial Catalog=DATN_QUANLYKHACHSAN;Integrated Security=True");

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["tk"] = Txttaikhoan.Text;

        }

        protected void Check_CheckedChanged(object sender, EventArgs e)
        {

            int tk = Login();
            if (tk == 1)
            {
                Response.Redirect("Demo.aspx");

        }
            if (tk == 2)
            {
                Response.Redirect("NhanPhong.aspx");

            }
            else
            {
                Tb.Text = "Mật khẩu hoặc tài khoản chưa đúng";
            }

        }

        protected void BtDangnhap_Click(EventArgs e)
        {

        }
        public int Login()
        {
            DataTable dt = new DataTable();
            string sql = "select * from NhanVien where Manv=@Manv and MatKhau=@MatKhau";
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.Parameters.AddWithValue("Manv", Txttaikhoan.Text);
            cmd.Parameters.AddWithValue("MatKhau", Txtpass.Text);
            SqlDataAdapter adt = new SqlDataAdapter(cmd);
            adt.Fill(dt);
            if (dt.Rows.Count == 1)
            {
                if (dt.Rows[0][9].ToString() == "Quản Lý")
                {
                    return 1;
                }
                else if (dt.Rows[0][9].ToString() == "Nhân Viên")
                {
                    return 2;
                }
               
            }
            con.Close();
            return 0;
        }
    }
}