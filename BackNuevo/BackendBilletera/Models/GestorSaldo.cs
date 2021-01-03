using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace BackendBilletera.Models
{
    public class GestorSaldo
    {
        private const string StrConn = "Server=DESKTOP-EL5NUAH\\SQLEXPRESS;Database=DBbilletera;Trusted_Connection=True;";

        public static string us = "emanuel";

        public void guardar(string a)
        {
            us = a;
        }
        public string dar()
        {
            return us;
        }



        public int ValidarSaldo(int usuario)
        {
            //Persona p = null;
            int result = 0;
            SqlConnection conn = new SqlConnection(StrConn);
            conn.Open();
            SqlCommand comm = conn.CreateCommand();
            comm.CommandText = "SELECT monto FROM Saldo WHERE usuario=@Usuario";
            comm.Parameters.Add(new SqlParameter("@Usuario", usuario));
            SqlDataReader dr = comm.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    result = dr.GetInt32(0);
                }
                //string nombre = dr.GetString(1);
                //string apellido = dr.GetString(2);
                //p = new Persona(id, nombre, apellido);
                
            }
            dr.Close();
            conn.Close();
            return result;
        }

        public int ObtenerId(string usuario)
        {
            //Persona p = null;
            //usuario = "emanuel";
            int result = 0;
            SqlConnection conn = new SqlConnection(StrConn);
            conn.Open();
            SqlCommand comm = conn.CreateCommand();
            comm.CommandText = "SELECT id FROM Login WHERE username = @caballo";
            comm.Parameters.Add(new SqlParameter("@caballo", usuario));
            SqlDataReader dr = comm.ExecuteReader();
            if (dr.HasRows)
            {
                while (dr.Read())
                {
                    result = dr.GetInt32(0);
                }
                //string nombre = dr.GetString(1);
                //string apellido = dr.GetString(2);
                //p = new Persona(id, nombre, apellido);

            }
            dr.Close();
            conn.Close();
            return result;
        }
    }
}