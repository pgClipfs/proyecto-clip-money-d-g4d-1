using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace BilleteraMVCAngular.Models
{
    public class LoginRequest
    {
        public string username { get; set; }
        public string password { get; set; }

        public string Username { get => username; set => username = value; }
        public string Password { get => password; set => password = value; }

    } 
}