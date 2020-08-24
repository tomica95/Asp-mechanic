using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Entities
{
    public class User : BaseEntity
    {
        public string FullName { get; set; }
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
        public string Image { get; set; }

        // User has one role
        public int RoleId { get; set; }
        public virtual Role Role { get; set; }

        //  User has many UserUseCases
        public virtual ICollection<UserUseCase> UseCases { get; set; }

        // User can work-has many Cars
        public virtual ICollection<CarUser> UserCars { get; set; } = new HashSet<CarUser>();  
        // One user can lead many repairs
        public virtual ICollection<Car> Cars { get; set; }

    }
}
