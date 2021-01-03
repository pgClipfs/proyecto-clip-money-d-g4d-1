using System;
using System.Data.SqlClient;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BackendBilletera.Models
{
    public class GestorLogin
    {
        private const string StrConn = "Server=DESKTOP-EL5NUAH\\SQLEXPRESS;Database=DBbilletera;Trusted_Connection=True;";

        public bool ValidarLogin(LoginRequest login)
        {
            //Persona p = null;
            bool result = false;
            SqlConnection conn = new SqlConnection(StrConn);
            conn.Open();
            SqlCommand comm = conn.CreateCommand();
            comm.CommandText = "SELECT * FROM Usuario WHERE Usuario=@Username AND Contrasena=@Password";
            comm.Parameters.Add(new SqlParameter("@Username", login.Username));
            comm.Parameters.Add(new SqlParameter("@Password", login.Password));
            SqlDataReader dr = comm.ExecuteReader();
            if (dr.Read())
            {
                //string nombre = dr.GetString(1);
                //string apellido = dr.GetString(2);
                //p = new Persona(id, nombre, apellido);
                result = true;
            }
            dr.Close();
            conn.Close();
            return result;
        }

        public void ValidarRegistro(LoginRequest login)
        {

            SqlConnection conn = new SqlConnection(StrConn);
            conn.Open();
            SqlCommand comm = conn.CreateCommand();
            comm.CommandText = "INSERT INTO Login(username, password) VALUES(@Username, @Password)";
            comm.Parameters.Add(new SqlParameter("@Username", login.Username));
            comm.Parameters.Add(new SqlParameter("@Password", login.Password));
            comm.ExecuteNonQuery();
            conn.Close();

        }
    }
}