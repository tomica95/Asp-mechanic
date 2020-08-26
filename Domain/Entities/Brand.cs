using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Entities
{
    public class Brand : BaseEntity
    {
        public string BrandName { get; set; }

        public ICollection<Car> Cars { get; set; }
    }
}
