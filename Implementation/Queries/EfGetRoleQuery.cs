using Application.Commands.Role;
using Application.Dto;
using Application.Searches;
using AutoMapper;
using DataAccess;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mime;
using System.Security.Cryptography.X509Certificates;
using System.Text;

namespace Implementation.Queries
{
    public class EfGetRoleQuery : IGetRoleQuery
    {
        private readonly Context context;
        private readonly IMapper mapper;
        public EfGetRoleQuery(Context context,IMapper mapper)
        {
            this.context = context;
            this.mapper = mapper;
        }

        public int Id => 1;

        public string Name => "Role Sreach";

        public IEnumerable<RoleDTO> Execute(RoleSearch search)
        {
            var query = context.Roles.AsQueryable();

            if (!string.IsNullOrEmpty(search.Name) || !string.IsNullOrWhiteSpace(search.Name))
            {
                query = query.Where(role => role.Name.ToLower().Contains(search.Name.ToLower()));
            }

            return query.Select(x=>new RoleDTO
            {
                Id = x.Id,
                Name = x.Name
                
            }).ToList();

            
        }
    }
}
