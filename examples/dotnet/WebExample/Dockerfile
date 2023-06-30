FROM mcr.microsoft.com/dotnet/aspnet:7.0 AS base
WORKDIR /app

FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY ["Purchases/Purchases.csproj", "Purchases/"]
RUN dotnet restore "Purchases/Purchases.csproj"
COPY . .
WORKDIR "/src/Purchases"
RUN dotnet build "Purchases.csproj" -c Release -o /app/build

FROM build AS publish
RUN dotnet publish "Purchases.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM base AS final
WORKDIR /app
COPY --from=publish /app/publish .
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["dotnet", "Purchases.dll"]

