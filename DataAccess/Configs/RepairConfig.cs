using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Configs
{
    public class RepairConfig : IEntityTypeConfiguration<Repair>
    {
        public void Configure(EntityTypeBuilder<Repair> builder)
        {
            builder.Property(r => r.Name)
                .IsRequired()
                .HasMaxLength(80);
            builder.Property(r => r.Description)
                .HasMaxLength(200);
            builder.Property(r => r.Status)
                .HasDefaultValue(Status.ToDo);
            builder.Property(r => r.Priority)
                .HasDefaultValue(Priority.Low);

            //Repair has one User
            builder.HasOne(u => u.User)
                .WithMany(r => r.Repairs)
                .HasForeignKey(r => r.UserId)
                .OnDelete(DeleteBehavior.Restrict);

            // Repair has one Car
            builder.HasOne(u => u.Car)
               .WithMany(r => r.Repairs)
               .HasForeignKey(r => r.CarId)
               .OnDelete(DeleteBehavior.Cascade);
        }
    }
}
