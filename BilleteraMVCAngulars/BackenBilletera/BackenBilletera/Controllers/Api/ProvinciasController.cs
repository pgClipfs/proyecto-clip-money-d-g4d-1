﻿using System;
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
    public class ProvinciasController : ApiController
    {
        private DBbilleteraEntities db = new DBbilleteraEntities();

        // GET: api/Provincias
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IQueryable<Provincia> GetProvincia()
        {
            return db.Provincia;
        }
        [ResponseType(typeof(Provincia))]
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IHttpActionResult GetProvincia(int id)
        {
            var provincias = db.Provincia.Where(x => x.idPais == id).ToList();
            return Ok(provincias);
        }
        

        // PUT: api/Provincias/5
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        [ResponseType(typeof(void))]
        public IHttpActionResult PutProvincia(int id, Provincia provincia)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != provincia.idProvincia)
            {
                return BadRequest();
            }

            db.Entry(provincia).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ProvinciaExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Provincias
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        [ResponseType(typeof(Provincia))]
        public IHttpActionResult PostProvincia(Provincia provincia)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Provincia.Add(provincia);
            db.SaveChanges();

            return CreatedAtRoute("DefaultApi", new { id = provincia.idProvincia }, provincia);
        }

        // DELETE: api/Provincias/5
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        [ResponseType(typeof(Provincia))]
        public IHttpActionResult DeleteProvincia(int id)
        {
            Provincia provincia = db.Provincia.Find(id);
            if (provincia == null)
            {
                return NotFound();
            }

            db.Provincia.Remove(provincia);
            db.SaveChanges();

            return Ok(provincia);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool ProvinciaExists(int id)
        {
            return db.Provincia.Count(e => e.idProvincia == id) > 0;
        }
    }
}