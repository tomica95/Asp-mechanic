using Application.Commands.Brand;
using Application.DTO;
using AutoMapper;
using DataAccess;
using Domain.Entities;
using FluentValidation;
using Implementation.Validations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.BrandCommands
{
    public class EfCreateBrandCommand : BaseCommand, ICreateBrandCommand
    {
        private readonly CreateBrandValidation validation;

        public EfCreateBrandCommand(Context context, IMapper mapper, CreateBrandValidation validation) : base(context, mapper)
        {
            this.validation = validation;
        }

        public int Id => 21;

        public string Name => "Create brand";

        public void Execute(BrandDto request)
        {
            validation.ValidateAndThrow(request);

            var brand = Mapper.Map<Brand>(request);

            Context.Brands.Add(brand);
            Context.SaveChanges();
        }
    }
}
