using Application.CommandHandler;
using Application.Dto;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands.Role
{
    public interface IGetOneRoleQuery : IQuery<int,RoleDTO>
    {
    }
}
