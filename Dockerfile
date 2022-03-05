FROM mcr.microsoft.com/dotnet/sdk:6.0 AS build
WORKDIR /src
COPY passometro-teste.csproj .
RUN dotnet restore "passometro-teste.csproj"
COPY . .
RUN dotnet publish "passometro-teste.csproj" -c Release -o /publish

FROM mcr.microsoft.com/dotnet/aspnet:6.0 as final
WORKDIR /app
COPY --from=build /publish .
ENTRYPOINT [ "dotnet", "passometro-teste.csproj" ]