﻿using DataAccess.Configs;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using System;

namespace DataAccess
{
    public class Context : DbContext
    {
        public DbSet<Role> Roles { get; set; }
        public DbSet<User> Users { get; set; }
        public DbSet<UserUseCase> UserUseCases { get; set; }
        public DbSet<UseCaseLog> UseCaseLogs { get; set; }
        public DbSet<Car> Cars { get; set; }
        public DbSet<Repair> Repairs { get; set; }

        public DbSet<Brand> Brands { get; set; }
        
        



        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(@"Data Source=Tomica\SQLEXPRESS;Initial Catalog=MechanicsV3;Integrated Security=True");
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.ApplyConfiguration(new RoleConfig());
            modelBuilder.ApplyConfiguration(new UserConfig());
            modelBuilder.ApplyConfiguration(new CarConfig());
            modelBuilder.ApplyConfiguration(new RepairConfig());
            modelBuilder.ApplyConfiguration(new BrandConfig());

            modelBuilder.Entity<CarUser>()
                .HasKey(caruser => new { caruser.CarId, caruser.UserId });

            modelBuilder.Entity<Role>().HasQueryFilter(r => r.DeletedAt == null);
            modelBuilder.Entity<User>().HasQueryFilter(r => r.DeletedAt == null);
            modelBuilder.Entity<Car>().HasQueryFilter(r => r.DeletedAt == null);
            modelBuilder.Entity<Repair>().HasQueryFilter(r => r.DeletedAt == null);
            modelBuilder.Entity<Brand>().HasQueryFilter(r => r.DeletedAt == null);
        }

        public override int SaveChanges()
        {
            foreach (var entry in ChangeTracker.Entries())
            {
                if (entry.Entity is BaseEntity e)
                {
                    switch (entry.State)
                    {
                        case EntityState.Added:
                            e.CreatedAt = DateTime.Now;
                            e.UpdatedAt = null;
                            e.DeletedAt = null;
                            break;
                        case EntityState.Modified:
                            e.UpdatedAt = DateTime.Now;
                            break;
                    }
                }
            }

            return base.SaveChanges();
        }



    }
}
