using Application.CommandHandler;
using Application.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Commands.Brand
{
    public interface ICreateBrandCommand : ICommand<BrandDto>
    {
    }
}
