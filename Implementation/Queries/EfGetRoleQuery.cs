using Application.Commands.Role;
using Application.Dto;
using Application.DTO.Pagination;
using Application.Searches;
using AutoMapper;
using DataAccess;
using Domain.Entities;
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

        public string Name => "Role Search";

        public PagedResponse<RoleDTO> Execute(RoleSearch dto)
        {
            var query = context.Roles.AsQueryable();

            if (!string.IsNullOrEmpty(dto.Name) || !string.IsNullOrWhiteSpace(dto.Name))
            {
                query = query.Where(role => role.Name.ToLower().Contains(dto.Name.ToLower()));
            }
            var skipCount = dto.PerPage * (dto.Page - 1);
            var roles = mapper.Map<List<RoleDTO>>(query.Skip(skipCount).Take(dto.PerPage).ToList());

            var reponse = new PagedResponse<RoleDTO>
            {
                CurrentPage = dto.Page,
                ItemsPerPage = dto.PerPage,
                TotalCount = query.Count(),
                items = roles
            };

            return reponse;


        }
    }
}
