using Application.DTO;
using Application.Exceptions;
using Application.Queries;
using AutoMapper;
using DataAccess;
using Implementation.Commands;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries.RepairQueries
{
    public class EfGetOneRepair : BaseCommand, IGetOneRepair
    {
        public EfGetOneRepair(Context context, IMapper mapper) : base(context, mapper)
        {
        }

        public int Id => 20;

        public string Name => "Get one repair";

        public RepairDTO Execute(int id)
        {
            var repair = Context.Repairs.Where(r => r.Id == id)
                .Include(u => u.User)
                .Include(c => c.Car)
                .FirstOrDefault();
            if (repair == null)
            {
                throw new EntityNotFoundException(id);
            }

            return Mapper.Map<RepairDTO>(repair);
        }
    }
}
