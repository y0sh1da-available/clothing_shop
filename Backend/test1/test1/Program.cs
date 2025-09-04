using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Microsoft.OpenApi.Models;
using System.Security.Claims;
using System.Text;
using System.Text.Json.Serialization;
using test1.Models;
using test1.Service;

var builder = WebApplication.CreateBuilder(args);

var connectionString = builder.Configuration.GetConnectionString("QlbanQuanAoContext");
builder.Services.AddDbContext<QlbanQuanAoContext>(options => options.UseSqlServer(connectionString));
builder.Services.AddScoped<JwtService>();
builder.Services.AddScoped<PayPalService>();
builder.Services.AddSingleton<TwilioService>();
builder.Services.AddSingleton<ContractService>();
builder.Services.AddDistributedMemoryCache();

// ??ng ký session
builder.Services.AddSession();

//// Thêm Swagger cho vi?c ki?m th? API
builder.Services.AddSwaggerGen(options =>
{
	var jwtSecurityScheme = new OpenApiSecurityScheme
	{
		BearerFormat = "JWT",
		Name = "Authorization",
		In = ParameterLocation.Header,
		Type = SecuritySchemeType.Http,
		Scheme = JwtBearerDefaults.AuthenticationScheme,
		Description = "Nh?p token JWT c?a b?n",
		Reference = new OpenApiReference
		{
			Id = JwtBearerDefaults.AuthenticationScheme,
			Type = ReferenceType.SecurityScheme
		}
	};

	var cookieSecurityScheme = new OpenApiSecurityScheme
	{
		Name = "Cookie",
		Type = SecuritySchemeType.ApiKey,
		In = ParameterLocation.Cookie,
		Description = "Xác th?c Cookie"
	};

	// ??ng ký c? hai ph??ng th?c xác th?c JWT và Cookie trong Swagger
	options.AddSecurityDefinition("Bearer", jwtSecurityScheme);
	options.AddSecurityDefinition("Cookie", cookieSecurityScheme);

	options.AddSecurityRequirement(new OpenApiSecurityRequirement
	{
		{ jwtSecurityScheme, Array.Empty<string>() },
		{ cookieSecurityScheme, Array.Empty<string>() }
	});
});

//// C?u hình CORS
//builder.Services.AddCors(options =>
//{
//	options.AddPolicy("AllowAngular",
//		policy => policy.AllowAnyOrigin()
//						.AllowAnyHeader()
//						.AllowAnyMethod());
//});
// Thêm d?ch v? CORS và ??nh ngh?a policy
builder.Services.AddCors(options =>
{
	options.AddPolicy("AllowAngularClient", policy =>
	{
		policy.WithOrigins("https://localhost:4200") // Ch? cho phép Angular client trên ??a ch? này
			  .AllowAnyHeader()
			  .AllowAnyMethod()
			  .AllowCredentials(); // Cho phép g?i credentials (cookie, auth header,...)
	});
});
// C?u hình xác th?c
builder.Services.AddAuthentication(options =>
{
	options.DefaultScheme = CookieAuthenticationDefaults.AuthenticationScheme;
	options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
	options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
.AddCookie(options =>
{
	options.Cookie.Name = "accessToken";
	options.Cookie.HttpOnly = false;
	//options.Cookie.SecurePolicy = CookieSecurePolicy.Always;
	//options.Cookie.SameSite = SameSiteMode.Strict;
	options.LoginPath = "/Account/Login";
})
.AddJwtBearer(options =>
{
	options.RequireHttpsMetadata = false;
	options.SaveToken = true;
	options.TokenValidationParameters = new TokenValidationParameters
	{
		ValidIssuer = builder.Configuration["JwtConfig:Issuer"],
		ValidAudience = builder.Configuration["JwtConfig:Audience"],
		IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(builder.Configuration["JwtConfig:Key"])),
		ValidateIssuer = true,
		ValidateAudience = true,
		ValidateLifetime = false,
		ValidateIssuerSigningKey = true,
		RoleClaimType = ClaimTypes.Role
	};
});

// Thêm controller và c?u hình JSON
//builder.Services.AddControllers().AddJsonOptions(options =>
//{
//	options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.Preserve;
//});
builder.Services.AddControllers();
builder.WebHost.UseWebRoot("wwwroot");

// C?u hình Swagger và Endpoints API Explorer
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddHttpClient();
builder.Services.AddMemoryCache();
var app = builder.Build();

//app.UseCors("AllowAngular");
app.UseCors("AllowAngularClient");
// C?u hình pipeline HTTP request
if (app.Environment.IsDevelopment())
{
	app.UseSwagger();
	app.UseSwaggerUI();
}
app.MapControllerRoute(
	name: "areas",
	pattern: "{area:exists}/{controller=Home}/{action=Index}/{id?}"
);
// S? d?ng session tr??c middleware xác th?c
app.UseSession();
app.UseMiddleware<JwtRefreshTokenMiddleware>();
app.UseStaticFiles();
app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
