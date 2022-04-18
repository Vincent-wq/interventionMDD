#!/bin/bash
FS_RES_DIR=(${@:1:1})
path=`dirname $0`
cd $path
echo "This bash script will create table from ?.stats files"
echo "Written by Vincent"
echo "MNI, McGill University"
echo "Please check the number of output files, it should be 34 in total."
echo "23/10/2020\n"

# run in python 2.7 env
# run in the folder of freesurfer outputs
export FREESURFER_HOME=/usr/local/freesurfer
source $FREESURFER_HOME/SetUpFreeSurfer.sh
export SUBJECTS_DIR=${FS_RES_DIR}

# put subject list here 
list="sub-season101 sub-season102 sub-season103 sub-season104 sub-season105 sub-season106 sub-season107 sub-season108 sub-season109 sub-season110 sub-season111 sub-season112 sub-season114 sub-season116 sub-season117 sub-season119 sub-season120 sub-season121 sub-season122 sub-season123 sub-season124 sub-season125 sub-season126 sub-season127 sub-season128 sub-season129 sub-season130 sub-season131 sub-season132 sub-season133 sub-season134 sub-season135 sub-season136 sub-season137 sub-season138 sub-season139 sub-season202 sub-season204 sub-season206 sub-season207 sub-season208 sub-season211 sub-season212 sub-season213 sub-season214 sub-season215 sub-season216 sub-season217"

asegstats2table --subjects $list --meas volume --skip --statsfile wmparc.stats --all-segs --tablefile wmparc_stats.txt
asegstats2table --subjects $list --meas volume --skip --tablefile aseg_stats.txt
#ind space
aparcstats2table --subjects $list --hemi lh --meas volume --skip --tablefile aparc_volume_lh.txt
aparcstats2table --subjects $list --hemi lh --meas thickness --skip --tablefile aparc_thickness_lh.txt
aparcstats2table --subjects $list --hemi lh --meas area --skip --tablefile aparc_area_lh.txt
aparcstats2table --subjects $list --hemi lh --meas meancurv --skip --tablefile aparc_meancurv_lh.txt
aparcstats2table --subjects $list --hemi rh --meas volume --skip --tablefile aparc_volume_rh.txt
aparcstats2table --subjects $list --hemi rh --meas thickness --skip --tablefile aparc_thickness_rh.txt
aparcstats2table --subjects $list --hemi rh --meas area --skip --tablefile aparc_area_rh.txt
aparcstats2table --subjects $list --hemi rh --meas meancurv --skip --tablefile aparc_meancurv_rh.txt
# parc a2009s
aparcstats2table --hemi lh --subjects $list --parc aparc.a2009s --meas volume --skip -t lh.a2009s.volume.txt
aparcstats2table --hemi lh --subjects $list --parc aparc.a2009s --meas thickness --skip -t lh.a2009s.thickness.txt
aparcstats2table --hemi lh --subjects $list --parc aparc.a2009s --meas area --skip -t lh.a2009s.area.txt
aparcstats2table --hemi lh --subjects $list --parc aparc.a2009s --meas meancurv --skip -t lh.a2009s.meancurv.txt
aparcstats2table --hemi rh --subjects $list --parc aparc.a2009s --meas volume --skip -t rh.a2009s.volume.txt
aparcstats2table --hemi rh --subjects $list --parc aparc.a2009s --meas thickness --skip -t rh.a2009s.thickness.txt
aparcstats2table --hemi rh --subjects $list --parc aparc.a2009s --meas area --skip -t rh.a2009s.area.txt
aparcstats2table --hemi rh --subjects $list --parc aparc.a2009s --meas meancurv --skip -t rh.a2009s.meancurv.txt
# DKTatlas
aparcstats2table --hemi lh --subjects $list --parc aparc.DKTatlas --meas volume --skip -t lh.DKTatlas.volume.txt
aparcstats2table --hemi lh --subjects $list --parc aparc.DKTatlas --meas thickness --skip -t lh.DKTatlas.thickness.txt
aparcstats2table --hemi lh --subjects $list --parc aparc.DKTatlas --meas area --skip -t lh.DKTatlas.area.txt
aparcstats2table --hemi lh --subjects $list --parc aparc.DKTatlas --meas meancurv --skip -t lh.DKTatlas.meancurv.txt
aparcstats2table --hemi rh --subjects $list --parc aparc.DKTatlas --meas volume --skip -t rh.DKTatlas.volume.txt
aparcstats2table --hemi rh --subjects $list --parc aparc.DKTatlas --meas thickness --skip -t rh.DKTatlas.thickness.txt
aparcstats2table --hemi rh --subjects $list --parc aparc.DKTatlas --meas area --skip -t rh.DKTatlas.area.txt
aparcstats2table --hemi rh --subjects $list --parc aparc.DKTatlas --meas meancurv --skip -t rh.DKTatlas.meancurv.txt
# parc BA_exvivo
aparcstats2table --hemi lh --subjects $list --parc BA_exvivo --meas volume --skip -t lh.BA_exvivo.volume.txt
aparcstats2table --hemi lh --subjects $list --parc BA_exvivo --meas thickness --skip -t lh.BA_exvivo.thickness.txt
aparcstats2table --hemi lh --subjects $list --parc BA_exvivo --meas area --skip -t lh.BA_exvivo.area.txt
aparcstats2table --hemi lh --subjects $list --parc BA_exvivo --meas meancurv --skip -t lh.BA_exvivo.meancurv.txt
aparcstats2table --hemi rh --subjects $list --parc BA_exvivo --meas volume --skip -t rh.BA_exvivo.volume.txt
aparcstats2table --hemi rh --subjects $list --parc BA_exvivo --meas thickness --skip -t rh.BA_exvivo.thickness.txt
aparcstats2table --hemi rh --subjects $list --parc BA_exvivo --meas area --skip -t rh.BA_exvivo.area.txt
aparcstats2table --hemi rh --subjects $list --parc BA_exvivo --meas meancurv --skip -t rh.BA_exvivo.meancurv.txt
