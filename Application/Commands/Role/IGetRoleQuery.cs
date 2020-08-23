using Application.CommandHandler;
using Application.Dto;
using Application.DTO.Pagination;
using Application.Searches;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands.Role
{
    public interface IGetRoleQuery : IQuery<RoleSearch,PagedResponse<RoleDTO>>
    {
    }
}
