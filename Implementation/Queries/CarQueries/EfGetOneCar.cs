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

namespace Implementation.Queries.CarQueries
{
    public class EfGetOneCar : BaseCommand, IGetOneCarQuery
    {
        public EfGetOneCar(Context context, IMapper mapper) : base(context, mapper)
        {
        }

        public int Id => 15;

        public string Name => "Get one car";

        public CarDTO Execute(int id)
        {
            var car = Context.Cars
                .Where(c => c.Id == id)
                .Include(c => c.CarUsers)
                    .ThenInclude(cu => cu.User)
                        .ThenInclude(cu => cu.Role)
                .FirstOrDefault();

            if (car == null)
            {
                throw new EntityNotFoundException(id);
            }

            return Mapper.Map<CarDTO>(car);
        }
    }
}
