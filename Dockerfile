# syntax=docker/dockerfile:1
FROM mcr.microsoft.com/dotnet/sdk:5.0 AS build-env
ADD /Album.Api/bin/Debug/net5.0/ App/
WORKDIR /App1

# Copy everything else and publish
COPY . ./
# RUN dotnet restore
RUN dotnet publish -c Release -o out

# Build runtime image
FROM mcr.microsoft.com/dotnet/aspnet:5.0
WORKDIR /App1
COPY --from=build-env /App1/out .

EXPOSE 80

ENTRYPOINT ["dotnet", "Album.Api.dll"]