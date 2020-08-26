using Application.DTO;
using Application.DTO.Pagination;
using Application.Queries;
using Application.Searches;
using AutoMapper;
using DataAccess;
using Implementation.Commands;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Queries.BrandQueries
{
    public class EfGetAllBrands : BaseCommand, IGetAllBrands
    {
        public EfGetAllBrands(Context context, IMapper mapper) : base(context, mapper)
        {
        }

        public int Id => 24;

        public string Name => "Get all brands";

        public PagedResponse<BrandDto> Execute(SearchBrandDto dto)
        {
            var brandQuery = Context.Brands.AsQueryable();

            if (!string.IsNullOrEmpty(dto.BrandName) || !string.IsNullOrWhiteSpace(dto.BrandName))
            {
                brandQuery = brandQuery.Where(b => b.BrandName.ToLower().Contains(dto.BrandName.ToLower()));
            }

            var skipCount = dto.PerPage * (dto.Page - 1);

            var brands = Mapper.Map<List<BrandDto>>(brandQuery.Skip(skipCount).Take(dto.PerPage).ToList());

            var reponse = new PagedResponse<BrandDto>
            {
                CurrentPage = dto.Page,
                ItemsPerPage = dto.PerPage,
                TotalCount = brandQuery.Count(),
                Items = brands
            };

            return reponse;
        }
    }
}
