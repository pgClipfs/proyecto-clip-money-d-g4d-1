using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Data.Entity.Validation;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using System.Web.Http.Cors;
using System.Web.Http.Description;
using BackenBilletera.Models;

namespace BackenBilletera.Controllers.Api
{
    public class UsuariosController : ApiController
    {
        private DBbilleteraEntities db = new DBbilleteraEntities();

        // GET: api/Usuarios
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        public IQueryable<Usuario> GetUsuario()
        {
            return db.Usuario;
        }

        // GET: api/Usuarios/5
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        [ResponseType(typeof(Usuario))]
        public IHttpActionResult GetUsuario(string nomUsuario)
        {
            Usuario usuario = db.Usuario.Find(nomUsuario);
            if (usuario == null)
            {
                return NotFound();
            }

            return Ok(usuario);
        }



        // PUT: api/Usuarios/5
        
        [EnableCors(origins: "*", headers: "*", methods: "*")]

        [ResponseType(typeof(void))]
        [HttpPut]
        
        public IHttpActionResult PutUsuario(string id, Usuario usuario)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != usuario.nomUsuario)
            {
                return BadRequest();
            }

            db.Entry(usuario).State = EntityState.Modified;

            try
            {
                db.SaveChanges();
            }
            catch (DbUpdateConcurrencyException)
            {

            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Usuarios
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        [ResponseType(typeof(Usuario))]

        public IHttpActionResult PostUsuario(Usuario usuario)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }
            try
            {
                //var pass = BCrypt.Net.BCrypt.HashPassword(usuario.password);
                var oUsuario = new Usuario();
                oUsuario.nombre = usuario.nombre;
                oUsuario.apellido = usuario.apellido;
                oUsuario.dni = usuario.dni;
                oUsuario.telefono = usuario.telefono;
                oUsuario.email = usuario.email;
                oUsuario.nomUsuario = usuario.nomUsuario;
                oUsuario.password = usuario.password;
                oUsuario.idPais = usuario.idPais;
                oUsuario.idProvincia = usuario.idProvincia;
                oUsuario.idLocalidad = usuario.idLocalidad;
                oUsuario.calle = usuario.calle;
                oUsuario.altura = usuario.altura;


                db.Usuario.Add(oUsuario);
                db.SaveChanges();
            }
            catch (DbEntityValidationException e)
            {
                foreach (var eve in e.EntityValidationErrors)
                {
                    Console.WriteLine("Entity of type \"{0}\" in state \"{1}\" has the following validation errors:",
                        eve.Entry.Entity.GetType().Name, eve.Entry.State);
                    foreach (var ve in eve.ValidationErrors)
                    {
                        Console.WriteLine("- Property: \"{0}\", Error: \"{1}\"",
                            ve.PropertyName, ve.ErrorMessage);
                    }
                }
                throw;
            }

            return CreatedAtRoute("DefaultApi", new { id = usuario.idUsuario }, usuario);
        }

        // DELETE: api/Usuarios/5
        [EnableCors(origins: "*", headers: "*", methods: "*")]
        [ResponseType(typeof(Usuario))]
        public IHttpActionResult DeleteUsuario(int id)
        {
            Usuario usuario = db.Usuario.Find(id);
            if (usuario == null)
            {
                return NotFound();
            }

            db.Usuario.Remove(usuario);
            db.SaveChanges();

            return Ok(usuario);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool UsuarioExists(int id)
        {
            return db.Usuario.Count(e => e.idUsuario == id) > 0;
        }
    }
}