using Domain.Entities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System;
using System.Collections.Generic;
using System.Text;

namespace DataAccess.Configs
{
    public class BrandConfig : IEntityTypeConfiguration<Brand>
    {
        public void Configure(EntityTypeBuilder<Brand> builder)
        {
            builder.HasIndex(b => b.BrandName)
                .IsUnique();

            builder.Property(b => b.BrandName)
                .IsRequired()
                .HasMaxLength(50);
        }
    }
}
