using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Application;
using Application.Commands.Brand;
using Application.Commands.Car;
using Application.Commands.Repair;
using Application.Commands.Role;
using Application.Commands.User;
using Application.Email;
using Application.Queries;
using AutoMapper;
using DataAccess;
using Implementation.Commands.BrandCommands;
using Implementation.Commands.CarCommands;
using Implementation.Commands.RepairCommands;
using Implementation.Commands.RoleCommands;
using Implementation.Commands.UserCommands;
using Implementation.Email;
using Implementation.Logging;
using Implementation.Profiles;
using Implementation.Queries;
using Implementation.Queries.CarQueries;
using Implementation.Queries.RepairQueries;
using Implementation.Queries.UserQueries;
using Implementation.Validations;
using Mechanic.Core;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.IdentityModel.Tokens;
using Newtonsoft.Json;

namespace Mechanic
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            #region DbContext
            services.AddTransient<Context>();
            #endregion

            #region Automapper
            services.AddAutoMapper(typeof(RoleProfile),typeof(UserProfile),typeof(CarProfile),typeof(RepairProfile),typeof(LogProfile),typeof(BrandProfile));
            #endregion

            #region Validation
            services.AddTransient<CreateRoleValidation>();
            services.AddTransient<UpdateRoleValidation>();
            services.AddTransient<CommandExecutor>();
            services.AddTransient<IUseCaseLogger,DataBaseUseCaseLogger>();
            services.AddTransient<JwtManager>();
            services.AddTransient<CreateUserValidation>();
            services.AddTransient<UpdateUserValidation>();
            services.AddTransient<CreateCarValidation>();
            services.AddTransient<UpdateCarValidation>();
            services.AddTransient<CreateRepairValidation>();
            services.AddTransient<UpdateRepairValidation>();
            services.AddTransient<CreateBrandValidation>();
            services.AddTransient<UpdateBrandValidation>();
            #endregion

            #region Role CRUD
            services.AddTransient<ICreateRoleCommand, EfCreateRoleCommand>();
            services.AddTransient<IDeleteRoleCommand, EfDeleteRoleCommand>();
            services.AddTransient<IUpdateRoleCommand, EfUpdateRoleCommand>();
            #endregion

            #region Role queries
            services.AddTransient<IGetRoleQuery,EfGetRoleQuery>();
            services.AddTransient<IGetOneRoleQuery, EfGetOneRoleQuery>();
            #endregion

            #region User CRUD
            services.AddTransient<ICreateUserCommand, EfCreateUserCommand>();
            services.AddTransient<IDeleteUser, EfDeleteUserCommand>();
            services.AddTransient<IUpdateUserCommand, EfUpdateUserCommand>();
            #endregion

            #region User queries
            services.AddTransient<IGetUserQuery, EfGetUserQuery>();
            services.AddTransient<IGetOneUserQuery, EfGetOneUserQuery>();
            #endregion

            #region Car CRUD
            services.AddTransient<ICreateCarCommand, EfCreateCarCommand>();
            services.AddTransient<IUpdateCarCommand,EfUpdateCarCommand>();
            services.AddTransient<IDeleteCarCommand, EfDeleteCarCommand>();
            #endregion

            #region Car queries
            services.AddTransient<IGetAllCars,EfGetAllCarsQuery>();
            services.AddTransient<IGetOneCarQuery, EfGetOneCar>();
            #endregion

            #region Repair CRUD
            services.AddTransient<ICreateRepair, EfCreateRepair>();
            services.AddTransient<IUpdateRepairCommand, EfUpdateRepairCommand>();
            services.AddTransient<IDeleteRepairCommand, EfDeleteRepairCommand>();
            #endregion

            #region Repair queries
            services.AddTransient<IGetAllRepairs, EfGetAllRepairs>();
            services.AddTransient<IGetOneRepair, EfGetOneRepair>();
            #endregion

            #region Brand CRUD
            services.AddTransient<ICreateBrandCommand, EfCreateBrandCommand>();
            services.AddTransient<IUpdateBrandCommand, EfUpdateBrandCommand>();
            services.AddTransient<IDeleteBrandCommand, EfDeleteBrandCommand>();
            #endregion

            services.AddTransient<IGetLogsQuery, EfGetLogs>();

            #region JWT
            services.AddTransient<JwtManager>();
            services.AddHttpContextAccessor();
            
            services.AddTransient<IApplicationActor>(x =>
            {
                var accessor = x.GetService<IHttpContextAccessor>();

                var user = accessor.HttpContext.User;

                if (user.FindFirst("ActorData") == null)
                {
                    throw new InvalidOperationException("Actor data doesn't exist.");
                }

                var actorString = user.FindFirst("ActorData").Value;

                var actor = JsonConvert.DeserializeObject<JwtActor>(actorString);

                return actor;

            });

            

            services.AddAuthentication(options =>
            {
                options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultSignInScheme = JwtBearerDefaults.AuthenticationScheme;
                options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
            }).AddJwtBearer(cfg =>
            {
                cfg.RequireHttpsMetadata = false;
                cfg.SaveToken = true;
                cfg.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidIssuer = "Asp-mechanic",
                    ValidateIssuer = true,
                    ValidAudience = "Any",
                    ValidateAudience = true,
                    IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes("ThisIsMyVerySecretKey")),
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ClockSkew = TimeSpan.Zero
                };
            });

            #endregion

            services.AddTransient<IEmailSender,SmtpEmailSender>();

            services.AddControllers();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

            app.UseCors(x =>
            {
                x.AllowAnyOrigin();
                x.AllowAnyMethod();
                x.AllowAnyHeader();
            });

            app.UseRouting();

            app.UseMiddleware<GlobalExceptionHandler>();
            app.UseAuthentication();
            app.UseAuthorization();

            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllers();
            });
        }
    }
}
