using Application.DTO;
using Application.Exceptions;
using Application.Queries;
using AutoMapper;
using DataAccess;
using Implementation.Commands;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Queries.BrandQueries
{
    public class EfGetOneBrandQuery : BaseCommand, IGetOneBrand
    {
        public EfGetOneBrandQuery(Context context, IMapper mapper) : base(context, mapper)
        {
        }

        public int Id => 25;

        public string Name => "Get one brand by ID";

        public BrandDto Execute(int id)
        {
            var brand = Context.Brands.Find(id);

            if (brand == null)
            {
                throw new EntityNotFoundException(id);
            }

            return Mapper.Map<BrandDto>(brand);
        }
    }
}
