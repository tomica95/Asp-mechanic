using Application.Commands.Repair;
using Application.DTO;
using AutoMapper;
using DataAccess;
using Domain.Entities;
using FluentValidation;
using Implementation.Validations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.RepairCommands
{
    public class EfCreateRepair : BaseCommand,ICreateRepair
    {
        private readonly CreateRepairValidation validation;

        public EfCreateRepair(Context context, IMapper mapper, CreateRepairValidation validation) : base(context, mapper)
        {
            this.validation = validation;
        }
        public int Id => 1;

        public string Name => "Create repair";

        public void Execute(RepairDTO request)
        {
            validation.ValidateAndThrow(request);

            var repair = Mapper.Map<Repair>(request);

            repair.User = null;
            repair.UserId = request.User.Id;

            repair.Car = null;
            repair.CarId = request.Car.Id;

            Context.Repairs.Add(repair);
            Context.SaveChanges();
        }
    }
}
