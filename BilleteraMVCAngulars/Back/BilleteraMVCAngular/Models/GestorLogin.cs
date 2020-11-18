using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using BilleteraMVCAngular.Controllers;


namespace BilleteraMVCAngular.Models
{
    public class GestorLogin
    {

        public bool validarLogin(LoginRequest login)
        {
            billeteraClipEntities db = new billeteraClipEntities();


           var lst = from d in db.Usuario
                     where d.Email == login.Username && d.Contrasena == login.Password 
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