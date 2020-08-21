using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;

namespace DataAccess
{
    public class Context : DbContext
    {

        public DbSet<Role> Roles { get; set; }
    }
}
