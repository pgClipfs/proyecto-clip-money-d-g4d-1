using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BackenBilletera.Models
{
    public class GiroDesc
    {
        public int idUsuario { get; set; }
        public string noCubierto { get; set; }
        public int monto { get; set; }
    }
}