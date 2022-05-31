using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

namespace Album.Api.Controllers
{
    public class HealthController : Controller
    {
        [HttpGet("/health")]
        public IActionResult Index()
        {
            return Ok(100);
        }
    }
}
