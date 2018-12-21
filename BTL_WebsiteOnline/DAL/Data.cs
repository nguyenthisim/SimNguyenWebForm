using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using DTO;

namespace DAL
{
   public class Data
    {
        public SqlConnection getConnect()
        {
            return new SqlConnection(@"Data Source=DESKTOP-MJTCEOJ\SQLEXPRESS;Initial Catalog=DB_TikiNow;Integrated Security=True");
        }
        public DataTable GetTable(string sql)
        {
            SqlConnection conn = getConnect();
            conn.Open();
            SqlDataAdapter ad = new SqlDataAdapter(sql, conn);
            DataTable dt = new DataTable();
            ad.Fill(dt);
            return dt;
        }
        public void ExcuteNonQuery(string sql)
        {
            SqlConnection conn = getConnect();
            conn.Open();
            SqlCommand cmd = new SqlCommand(sql, conn);
            cmd.ExecuteNonQuery();
            cmd.Dispose();
            cmd.Clone();
        }
        public bool checkAdmin(string name, string password)
        {
            SqlConnection conn = getConnect();
            try
            {
                conn.Open();
                Admin_DTO adDTO = null;
                string sql = "select * from QTAdmin where AdminName=N'" + name + "' and Password=N'" + password + "'";
                SqlCommand cmd = new SqlCommand(sql, conn);
                cmd.Parameters.AddWithValue("name", name);
                cmd.Parameters.AddWithValue("password", password);
                SqlDataReader dr = cmd.ExecuteReader();
                while (dr.Read())
                {
                    adDTO = new Admin_DTO(
                        int.Parse(dr["AdminID"].ToString()),
                        dr["AdminName"].ToString(),
                        dr["Password"].ToString(),
                        dr["Email"].ToString());
                }
                conn.Close();
                if (adDTO == null)
                    return false;
                else
                    return true;

            }
            catch (Exception)
            {

                conn.Close();
                return false;
            }
        }
    }
}
