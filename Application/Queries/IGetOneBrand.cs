using Application.CommandHandler;
using Application.DTO;
using System;
using System.Collections.Generic;
using System.Text;

namespace Application.Queries
{
    public interface IGetOneBrand : IQuery<int,BrandDto>
    {
    }
}
