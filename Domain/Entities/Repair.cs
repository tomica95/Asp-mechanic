using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Entities
{
    public class Repair : BaseEntity
    {
        public string Name { get; set; }
        public string Description { get; set; }
        public Status Status { get; set; }
        public Priority Priority { get; set; }

        //repair has one User-mechanic
        public int UserId { get; set; }
        public virtual User User { get; set; }

        //one rapair can only one car
        public int CarId { get; set; }
        public virtual Car Car { get; set; }

    }

    public enum Priority
    {
        Low,
        Medium,
        High
    }

    public enum Status
    {
        ToDo,
        InProgress,
        Done
    }
}
