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

namespace Implementation.Queries.RepairQueries
{
    public class EfGetAllRepairs : BaseCommand, IGetAllRepairs
    {
        public EfGetAllRepairs(Context context, IMapper mapper) : base(context, mapper)
        {
        }

        public int Id => 19;

        public string Name => "Get all repairs";

        public PagedResponse<RepairDTO> Execute(SearchRepairDto dto)
        {
            var repairQuery = Context.Repairs.AsQueryable();

            if (!string.IsNullOrEmpty(dto.Name) && !string.IsNullOrWhiteSpace(dto.Name))
            {
                repairQuery = repairQuery.Where(t => t.Name.ToLower().Contains(dto.Name.ToLower()));
            }

           

            if (!string.IsNullOrEmpty(dto.User) && !string.IsNullOrWhiteSpace(dto.User))
            {
                repairQuery = repairQuery.Where(r => r.User.Username.ToLower().Contains(dto.User.ToLower()));
            }

            var skipCount = dto.PerPage * (dto.Page - 1);

            var repairs = Mapper.Map<List<RepairDTO>>(repairQuery.Skip(skipCount).Take(dto.PerPage).ToList());

            var response = new PagedResponse<RepairDTO>
            {
                CurrentPage = dto.Page,
                ItemsPerPage = dto.PerPage,
                TotalCount = repairQuery.Count(),
                Items = repairs
            };

            return response;
        }
    }
}
