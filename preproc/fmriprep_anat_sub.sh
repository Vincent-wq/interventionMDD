#!/bin/bash
if [ "$#" -ne 3 ]; then
DATA_NAME=(${@:1:1})
RUN_LIST='Y'
else
DATA_NAME=(${@:1:1})
SUB_ID=(${@:2:1})
SES_ID=(${@:3:1})
RUN_LIST='N'
fi
echo ${DATA_NAME}

WD_DIR=${HOME}/scratch
CODE_DIR=${WD_DIR}/interventionMDD/preproc
CODE_SLURM=${CODE_DIR}/fmriprep_anat_sub.slurm
RERUN_LIST=${CODE_DIR}/runningMDD_rerun.csv

FMRIPREP_VER=20.2.7
LOG_DIR=${WD_DIR}/${DATA_NAME}_fmriprep_anat.log

chmod +x ${CODE_SLURM}
echo "Starting fmriprep-subject level rerun!"

if [ ${RUN_LIST} == 'Y' ];then
#RERUN_LIST="runningMDD_rerun.csv"
while read line; do
    # Do what you want to $name
    SUB_ID="$(cut -d',' -f1 <<<${line})"
    SES_ID="$(cut -d',' -f2 <<<${line})"
    echo 'rerunning subj: ' ${SUB_ID} ', ses' ${SES_ID}
    sbatch ${CODE_SLURM} ${DATA_NAME} ${FMRIPREP_VER} ${SUB_ID} ${SES_ID} >> ${LOG_DIR}
done < ${RERUN_LIST}

else
echo 'rerunning subj: ' ${SUB_ID} ', ses' ${SES_ID}
sbatch ${CODE_SLURM} ${DATA_NAME} ${FMRIPREP_VER} ${SUB_ID} ${SES_ID} >> ${LOG_DIR}
fi
echo "Submission finished!"
