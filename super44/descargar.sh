#!/bin/bash
echo iniciando descarga
fecha=$(date +"%Y%m%d")
hora=$(date +%H)
echo $fecha
echo $fecha
echo $hora
rm wind.grib2
if [ "$hora" -lt 06 ]; then
wget http://www.ftp.ncep.noaa.gov/data/nccf/com/gfs/prod/"gfs."$fecha"00"/gfs.t00z.wafs_grb45f06.grib2
mv gfs.t00z.wafs_grb45f06.grib2 wind.grib2
elif [ "$hora" -lt 12 ]; then
wget http://www.ftp.ncep.noaa.gov/data/nccf/com/gfs/prod/"gfs."$fecha"06"/gfs.t06z.wafs_grb45f06.grib2
mv gfs.t06z.wafs_grb45f06.grib2 wind.grib2
elif [ "$hora" -lt 18 ]; then
wget http://www.ftp.ncep.noaa.gov/data/nccf/com/gfs/prod/"gfs."$fecha"12"/gfs.t12z.wafs_grb45f06.grib2
mv gfs.t12z.wafs_grb45f06.grib2 wind.grib2
elif [ "$hora" -ge 18 ]; then
wget http://www.ftp.ncep.noaa.gov/data/nccf/com/gfs/prod/"gfs."$fecha"18"/gfs.t18z.wafs_grb45f06.grib2
mv gfs.t18z.wafs_grb45f06.grib2 wind.grib2
fi
ncl convert.ncl
rm coordenadas_lat_lon.js
ncdump -v lat_0,lon_0  salida.nc > coordenadas_lat_lon.js
rm valores_u_v.js
ncdump -v UGRD_P0_L6_GLL0,VGRD_P0_L6_GLL0  salida.nc > valores_u_v.js
sed -i "1,170d" coordenadas_lat_lon.js
sed -i "1,170d" valores_u_v.js
perl -pi -e "s/;/];/g" valores_u_v.js
perl -pi -e "s/UGRD_P0_L6_GLL0 =/U=[/g" valores_u_v.js
perl -pi -e "s/VGRD_P0_L6_GLL0 =/V=[/g" valores_u_v.js
perl -pi -e "s/;/];/g" coordenadas_lat_lon.js
perl -pi -e "s/lat_0 =/lat=[/g" coordenadas_lat_lon.js
perl -pi -e "s/lon_0 =/lon=[/g" coordenadas_lat_lon.js
perl -pi -e "s/}/ /g" valores_u_v.js
perl -pi -e "s/}/ /g" coordenadas_lat_lon.js
exit
