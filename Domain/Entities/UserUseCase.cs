using System;
using System.Collections.Generic;
using System.Text;

namespace Domain.Entities
{
    public class UserUseCase
    {
        public int Id { get; set; }
        public int UserId { get; set; }
        public int UseCaseId { get; set; }
        public User User { get; set; }
    }
}
