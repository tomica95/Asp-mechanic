using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Application;
using Application.Commands.Role;
using Application.Commands.User;
using Application.Queries;
using AutoMapper;
using DataAccess;
using Implementation.Commands.RoleCommands;
using Implementation.Commands.UserCommands;
using Implementation.Logging;
using Implementation.Profiles;
using Implementation.Queries;
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
            services.AddAutoMapper(typeof(RoleProfile),typeof(UserProfile));
            #endregion

            #region Validation
            services.AddTransient<CreateRoleValidation>();
            services.AddTransient<UpdateRoleValidation>();
            services.AddTransient<CommandExecutor>();
            services.AddTransient<IUseCaseLogger,DataBaseUseCaseLogger>();
            services.AddTransient<JwtManager>();
            services.AddTransient<CreateUserValidation>();
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
            #endregion

            #region User queries
            services.AddTransient<IGetUserQuery, EfGetUserQuery>();
            services.AddTransient<IGetOneUserQuery, EfGetOneUserQuery>();
            #endregion

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

            services.AddControllers();
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }

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
