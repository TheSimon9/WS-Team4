FROM mcr.microsoft.com/dotnet/sdk:7.0 AS build
WORKDIR /src
COPY "examples/dotnet/WebExample/Purchases/*" .
RUN dotnet restore "Purchases.csproj"
RUN dotnet build "Purchases.csproj" -c Release -o /app/build
RUN dotnet publish "Purchases.csproj" -c Release -o /app/publish /p:UseAppHost=false

FROM mcr.microsoft.com/dotnet/aspnet:7.0
WORKDIR /app
COPY --from=build /app/publish .
EXPOSE 80
EXPOSE 443
ENTRYPOINT ["dotnet", "Purchases.dll"]

