using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BackenBilletera.Models
{
    public class GetIdUsuario
    {
        public int obtenerId(string username)
        {
            DBbilleteraEntities db = new DBbilleteraEntities();
            var lst = from d in db.Usuario
                      where d.nomUsuario == username
                      select d.idUsuario;
            return lst.First();
        }
    }
}