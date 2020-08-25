using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.DTO
{
    public class RepairDTO
    {
        public int Id { get; set; }

        public string Name { get; set; }

        public string Description { get; set; }

        public Status Status { get; set; }

        public Priority Priority { get; set; }

        public UserDTO User { get; set; }

        public CarDTO Car { get; set; }

    }
}
