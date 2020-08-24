using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Application.DTO;
using Application.DTO.Pagination;
using Application.Queries;
using Application.Searches;
using AutoMapper;
using DataAccess;

namespace Implementation.Queries.UserQueries
{
    public class EfGetUserQuery : IGetUserQuery
    {
        private readonly Context context;
        private readonly IMapper mapper;

        public EfGetUserQuery(Context context,IMapper mapper)
        {
            this.mapper = mapper;
            this.context = context;
        }

        public int Id => 10;

        public string Name => "Get Users";

        public PagedResponse<UserDTO> Execute(SearchUserDTO search)
        {
            var usersQuery = context.Users
                .AsQueryable();

            if (!string.IsNullOrEmpty(search.FullName) || !string.IsNullOrWhiteSpace(search.FullName))
            {
                usersQuery = usersQuery.Where(u => u.FullName.ToLower().Contains(search.FullName.ToLower()));
            }

            if (!string.IsNullOrEmpty(search.Username) || !string.IsNullOrWhiteSpace(search.Username))
            {
                usersQuery = usersQuery.Where(u => u.Username.ToLower().Contains(search.Username.ToLower()));
            }

            /**
             *  Returns Users with searched Role name
             */
            if (search.Role != null)
            {
                usersQuery = usersQuery.Where(u => u.Role.Name.ToLower().Contains(search.Role.ToLower()));
            }

            /**
             *  Returns Users on specific Project name
             */
            if (search.Car != null)
            {
                usersQuery = usersQuery.Where(u => u.UserCars.Select(up => up.Car.Name.ToLower()).Contains(search.Car.ToLower()));
            }

            var skipCount = search.PerPage * (search.Page - 1);

            var users = mapper.Map<List<UserDTO>>(usersQuery.Skip(skipCount).Take(search.PerPage).ToList());

            return new PagedResponse<UserDTO>
            {
                CurrentPage = search.Page,
                ItemsPerPage = search.PerPage,
                TotalCount = usersQuery.Count(),
                Items = users
            };
        }
    }
}
