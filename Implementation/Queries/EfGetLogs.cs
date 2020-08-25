using Application.CommandHandler;
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

namespace Implementation.Queries
{
    public class EfGetLogs : BaseCommand, IGetLogsQuery
    {
        public EfGetLogs(Context context, IMapper mapper) : base(context, mapper)
        {
        }

        public int Id => 21;

        public string Name => "Get logs";

        public PagedResponse<LogDTO> Execute(SearchLogDto dto)
        {
            var logsQuery = Context.UseCaseLogs.AsQueryable();

            if (!string.IsNullOrEmpty(dto.Actor) && !string.IsNullOrWhiteSpace(dto.Actor))
            {
                logsQuery = logsQuery.Where(l => l.Actor.ToLower().Contains(dto.Actor.ToLower()));
            }

            if (!string.IsNullOrEmpty(dto.UseCase) && !string.IsNullOrWhiteSpace(dto.UseCase))
            {
                logsQuery = logsQuery.Where(l => l.UseCaseName.ToLower().Contains(dto.UseCase.ToLower()));
            }

            if (dto.DateFrom != null)
            {
                logsQuery = logsQuery.Where(l => l.Date >= dto.DateFrom);
            }

            if (dto.DateTo != null)
            {
                logsQuery = logsQuery.Where(l => l.Date <= dto.DateTo);
            }

            if (dto.DateFrom != null && dto.DateTo != null)
            {
                logsQuery = logsQuery.Where(l => l.Date >= dto.DateFrom)
                    .Where(l => l.Date <= dto.DateTo);
            }

            var skipCount = dto.PerPage * (dto.Page - 1);

            var logs = Mapper.Map<List<LogDTO>>(logsQuery.Skip(skipCount).Take(dto.PerPage).ToList());

            var response = new PagedResponse<LogDTO>
            {
                CurrentPage = dto.Page,
                ItemsPerPage = dto.PerPage,
                TotalCount = logsQuery.Count(),
                Items = logs
            };

            return response;
        }
    }
}
