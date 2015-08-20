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
echo http://www.ftp.ncep.noaa.gov/data/nccf/com/gfs/prod/"gfs."$fecha"18"/gfs.t00z.wafs_grb45f06.grib2

mv gfs.t00z.wafs_grb45f06.grib2 wind.grib2


elif [ "$hora" -lt 12 ]; then
wget http://www.ftp.ncep.noaa.gov/data/nccf/com/gfs/prod/"gfs."$fecha"06"/gfs.t06z.wafs_grb45f06.grib2
echo http://www.ftp.ncep.noaa.gov/data/nccf/com/gfs/prod/"gfs."$fecha"18"/gfs.t06z.wafs_grb45f06.grib2

mv gfs.t06z.wafs_grb45f06.grib2 wind.grib2


elif [ "$hora" -lt 18 ]; then
wget http://www.ftp.ncep.noaa.gov/data/nccf/com/gfs/prod/"gfs."$fecha"12"/gfs.t12z.wafs_grb45f06.grib2
echo http://www.ftp.ncep.noaa.gov/data/nccf/com/gfs/prod/"gfs."$fecha"18"/gfs.t12z.wafs_grb45f06.grib2

mv gfs.t12z.wafs_grb45f06.grib2 wind.grib2

elif [ "$hora" -ge 18 ]; then
wget http://www.ftp.ncep.noaa.gov/data/nccf/com/gfs/prod/"gfs."$fecha"18"/gfs.t18z.wafs_grb45f06.grib2
echo http://www.ftp.ncep.noaa.gov/data/nccf/com/gfs/prod/"gfs."$fecha"18"/gfs.t18z.wafs_grb45f06.grib2

mv gfs.t18z.wafs_grb45f06.grib2 wind.grib2

fi

exit
