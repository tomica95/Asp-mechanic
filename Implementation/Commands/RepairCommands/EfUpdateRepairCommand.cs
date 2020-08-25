using Application.Commands.Repair;
using Application.DTO;
using Application.Exceptions;
using AutoMapper;
using DataAccess;
using FluentValidation;
using Implementation.Validations;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Commands.RepairCommands
{
    public class EfUpdateRepairCommand : BaseCommand, IUpdateRepairCommand
    {
        private readonly UpdateRepairValidation validation;

        public EfUpdateRepairCommand(Context context, IMapper mapper, UpdateRepairValidation validation) : base(context, mapper)
        {
            this.validation = validation;
        }
        public int Id => 1;

        public string Name => "Update repairs";

        public void Execute(RepairDTO dto)
        {
            validation.ValidateAndThrow(dto);

            var repair = Context.Repairs.Find(dto.Id);

            if (repair == null)
            {
                throw new EntityNotFoundException(dto.Id);
            }

            Mapper.Map(dto, repair);

            repair.User = null;
            repair.Car = null;

            Context.SaveChanges();

        }
    }
}
