﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Mechanic.Core;
using Microsoft.AspNetCore.Mvc;

// For more information on enabling Web API for empty projects, visit https://go.microsoft.com/fwlink/?LinkID=397860

namespace Mechanic.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class TokenController : ControllerBase
    {

        private readonly JwtManager manager;

        public TokenController(JwtManager manager)
        {
            this.manager = manager;
        }

        // POST api/<TokenController>
        [HttpPost]
        public IActionResult Post([FromBody] LoginRequest request)
        {
            var token = manager.MakeToken(request.Username, request.Password);
            if (token == null) 
            {
                return Unauthorized();
            }
            return Ok(new
            {
                token
            });
        }

        public class LoginRequest 
        {
            public string Username { get; set; }

            public string  Password { get; set; }
        }

    }
}
