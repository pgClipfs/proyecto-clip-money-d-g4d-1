using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BackenBilletera.Models
{
    public class GestorLogin
    {
        public bool validarLogin(LoginRequest login)
        {
            DBbilleteraEntities db = new DBbilleteraEntities();


            var lst = from d in db.Usuario
                      where d.nomUsuario == login.Username && d.password == login.Password
                      select d;
            if (lst.Count() > 0)
            {

                return true;
            }
            else
            {
                return false;
            }

        }
    }
}