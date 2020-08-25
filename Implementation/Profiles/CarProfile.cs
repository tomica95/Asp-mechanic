using Application.Dto;
using Application.DTO;
using AutoMapper;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Profiles
{
    public class CarProfile  : Profile
    {
        public CarProfile() 
        {
            CreateMap<CarDTO, Car>();

            CreateMap<Car, CarDTO>()
                .ForMember(dto=>dto.Users,
                opt => opt.MapFrom(car=>car.CarUsers.Select(cu=>new UserDTO {
                    Id=cu.User.Id,
                    FullName = cu.User.FullName,
                    Username = cu.User.Username,
                    Role = new RoleDTO { 
                        Id = cu.User.Role.Id,
                        Name = cu.User.Role.Name
                    }
                })));   
        }
    }
}
