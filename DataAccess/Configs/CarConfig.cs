using System;
using System.Collections.Generic;
using System.Text;
using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace DataAccess.Configs
{
    public class CarConfig : IEntityTypeConfiguration<Car>
    {
        public void Configure(EntityTypeBuilder<Car> builder)
        {
            builder.HasIndex(c =>c.Name)
               .IsUnique();
            builder.Property(c => c.Name)
                .IsRequired()
                .HasMaxLength(40);

            builder.Property(c => c.Description)
                .IsRequired();

            builder.HasIndex(c => c.RegPlate)
                .IsUnique();
            builder.Property(c => c.RegPlate)
                .IsRequired()
                .HasMaxLength(60);

            builder.HasMany(caruser => caruser.CarUsers)
                .WithOne(caruser => caruser.Car)
                .HasForeignKey(caruser => caruser.CarId)
                .OnDelete(DeleteBehavior.Restrict);

            builder.HasOne(c => c.Leader)
                .WithMany(c => c.Cars)
                .HasForeignKey(c => c.UserId)
                .OnDelete(DeleteBehavior.Restrict);
        }
    }
}
