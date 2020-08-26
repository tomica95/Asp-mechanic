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
    public class EfUpdateBrandCommand : BaseCommand, IUpdateBrandCommand
    {
        private readonly UpdateBrandValidation validation;

        public EfUpdateBrandCommand(Context context, IMapper mapper, UpdateBrandValidation validation) : base(context, mapper)
        {
            this.validation = validation;
        }

        public int Id => 22;

        public string Name => "Update brand";

        public void Execute(BrandDto request)
        {
            validation.ValidateAndThrow(request);

            var brand = Context.Brands.Find(request.Id);

            Mapper.Map(request, brand);

            Context.SaveChanges();
        }
    }
}
