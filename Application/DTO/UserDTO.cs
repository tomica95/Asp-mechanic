using Application.Dto;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DTO
{
    public class UserDTO
    {
        public int Id { get; set; }
        public string FullName { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }

        public RoleDTO Role { get; set; }

        public BrandDto Brand { get; set; }

        public IEnumerable<CarDTO> Cars { get; set; } = new List<CarDTO>();
    }
}
