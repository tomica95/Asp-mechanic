using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;

namespace DataAccess
{
    public class Context : DbContext
    {
        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=Tomica\SQLEXPRESS;Initial Catalog=Mechanic;Integrated Security=True");
        }


        public DbSet<Role> Roles { get; set; }
    }
}
