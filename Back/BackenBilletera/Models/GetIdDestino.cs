using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BackenBilletera.Models
{
    public class GetIdDestino
    {
        public int ObtenerId(string alias)
        {
            DBbilleteraEntities db = new DBbilleteraEntities();
            var lst = from d in db.Usuario
                      where d.nomUsuario == alias
                      select d.idUsuario;
            return lst.First();
        }

    }
}