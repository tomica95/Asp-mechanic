using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Configs
{
    public class UserConfig : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {

            builder.HasIndex(u => u.Username).IsUnique();

            builder.Property(u => u.Username)
                .IsRequired()
                .HasMaxLength(30);

            builder.Property(u => u.FullName)
                .IsRequired()
                .HasMaxLength(60);

            builder.Property(u => u.Password)
                .IsRequired()
                .HasMaxLength(70);

            builder.Property(u => u.Email)
                .IsRequired();

            // User - Role 
            builder.HasOne(r => r.Role)
                .WithMany(u => u.Users)
                .HasForeignKey(u => u.RoleId)
                .OnDelete(DeleteBehavior.Restrict);
            //user has many cars, car has many users
            builder.HasMany(uc => uc.UserCars)
                .WithOne(u => u.User)
                .HasForeignKey(uc => uc.UserId)
                .OnDelete(DeleteBehavior.Restrict);
            builder.HasMany(r => r.Repairs)
                .WithOne(u => u.User)
                .HasForeignKey(r => r.UserId)
                .OnDelete(DeleteBehavior.Cascade);

        }

    }
}
