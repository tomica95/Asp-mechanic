using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Entities
{
    public class CarUser
    {
        public int CarId { get; set; }
        public int UserId { get; set; }
        public virtual Car Car { get; set; }
        public virtual User User { get; set; }
    }
}
