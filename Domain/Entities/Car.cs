using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Entities
{
    public class Car : BaseEntity
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public string RegPlate { get; set; }

        // On car can work many users
        public virtual ICollection<CarUser> CarUsers { get; set; } = new HashSet<CarUser>();

        // Car repair can have one RepairLeader
        public int UserId { get; set; }
        public virtual User Leader { get; set; }


    }
}
