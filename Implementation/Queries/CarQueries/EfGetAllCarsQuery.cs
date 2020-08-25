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

namespace Implementation.Queries.CarQueries
{
    public class EfGetAllCarsQuery : BaseCommand, IGetAllCars
    {
        public EfGetAllCarsQuery(Context context, IMapper mapper) : base(context, mapper)
        {
        }

        public int Id => 14;

        public string Name => "Get all cars";

        public PagedResponse<CarDTO> Execute(SearchCarDto dto)
        {
            var carQuery = this.Context.Cars.AsQueryable();
            if (!string.IsNullOrEmpty(dto.Name) || !string.IsNullOrWhiteSpace(dto.Name))
            {
                carQuery = Context.Cars.Where(p => p.Name.ToLower().Contains(dto.Name.ToLower()));
            }
            if (!string.IsNullOrEmpty(dto.User) || !string.IsNullOrWhiteSpace(dto.User))
            {
                carQuery = Context.Cars.
                    Where(c => c.CarUsers.
                    Select(cu => cu.User.FullName.ToLower())
                    .Contains(dto.User.ToLower()));
            }

            var skipCount = dto.PerPage * (dto.Page - 1);

            var cars = Mapper.Map<List<CarDTO>>(carQuery.Skip(skipCount).Take(dto.PerPage).ToList());

            var response = new PagedResponse<CarDTO>
            {
                CurrentPage = dto.Page,
                ItemsPerPage = dto.PerPage,
                TotalCount = carQuery.Count(),
                Items = cars
            };

            return response;

        }
    }
}
