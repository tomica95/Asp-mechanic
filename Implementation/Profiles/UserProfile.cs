using Application.DTO;
using AutoMapper;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Implementation.Profiles
{
    public class UserProfile : Profile
    {
        public UserProfile()
        {
            CreateMap<UserDTO, User>();

            CreateMap<User, UserDTO>()
                .ForMember(dto => dto.Cars,
                    opt => opt.MapFrom(user => user.UserCars.Select(uc => new CarDTO
                    {
                        Id = uc.Car.Id,
                        Name = uc.Car.Name,
                        Description = uc.Car.Description,
                        RegPlate = uc.Car.RegPlate
                    })));
        }
    }
}
