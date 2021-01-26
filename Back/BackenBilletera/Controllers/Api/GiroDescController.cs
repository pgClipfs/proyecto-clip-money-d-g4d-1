using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using BackenBilletera.Models;

namespace BackenBilletera.Controllers.Api
{
    [Authorize]
    public class GiroDescController : ApiController
    {
        private DBbilleteraEntities db = new DBbilleteraEntities();

       
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        
        public IHttpActionResult GiroDesc(GiroDesc modelo)
        {
            
            return StatusCode(HttpStatusCode.NoContent);
        }

       
    }
}