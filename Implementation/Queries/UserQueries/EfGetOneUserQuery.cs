using Application.DTO;
using Application.Exceptions;
using Application.Queries;
using AutoMapper;
using DataAccess;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries.UserQueries
{
    public class EfGetOneUserQuery : IGetOneUserQuery
    {
        private readonly Context _context;
        private readonly IMapper _mapper;

        public EfGetOneUserQuery(Context context, IMapper mapper)
        {
            _context = context;
            _mapper = mapper;
        }

        public int Id => 20;

        public string Name => "Get one User";

        public UserDTO Execute(int id)
        {
            var user = _context.Users.Where(u => u.Id == id)
                .Include(u => u.UserCars)
                    .ThenInclude(uc => uc.Car)
                .Include(u => u.Role).FirstOrDefault();

            if (user == null)
            {
                throw new EntityNotFoundException(id);
            }

            return _mapper.Map<UserDTO>(user);
        }
    }
}
