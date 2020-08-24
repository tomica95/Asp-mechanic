using Application.Commands.Role;
using Application.Dto;
using Application.DTO.Pagination;
using Application.Exceptions;
using Application.Searches;
using AutoMapper;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Queries
{
    public class EfGetOneRoleQuery : IGetOneRoleQuery
    {

        private readonly Context context;
        private readonly IMapper mapper;

        public EfGetOneRoleQuery(Context context, IMapper mapper)
        {
            this.context = context;
            this.mapper = mapper;
        }
        public int Id => 5;

        public string Name => "Get one ROle";

        public RoleDTO Execute(int id)
        {
            var role = context.Roles.Find(id);

            if (role == null)
            {
                throw new EntityNotFoundException(id);
            }

            return mapper.Map<RoleDTO>(role);
        }
    }
}
