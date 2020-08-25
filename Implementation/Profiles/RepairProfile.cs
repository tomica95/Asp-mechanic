using Application.DTO;
using AutoMapper;
using Domain.Entities;
using System;
using System.Collections.Generic;
using System.Text;

namespace Implementation.Profiles
{
    public class RepairProfile : Profile
    {
        public RepairProfile()
        {
            CreateMap<Repair, RepairDTO>()
                .ForMember(dto => dto.Car,
                    opt => opt.MapFrom(repair => new CarDTO 
                    { 
                        Name = repair.Car.Name,
                        Description = repair.Car.Description,
                        RegPlate = repair.Car.RegPlate,
                        Leader = new UserDTO 
                        {
                            FullName = repair.Car.Leader.FullName,
                            Username = repair.Car.Leader.Username,
                            Email = repair.Car.Leader.Email
                        }
                    })
                );
            CreateMap<RepairDTO, Repair>();
        }
    }
}
