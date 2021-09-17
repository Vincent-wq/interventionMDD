#!/bin/bash
DATA_NAME=(${@:1:1})
echo ${DATA_NAME}
SUB_ID=(${@:2:1})

WD_DIR=${HOME}/scratch
DATA_DIR=${WD_DIR}/${DATA_NAME}
BIDS_DIR=${DATA_DIR}_BIDS
CODE_DIR=${WD_DIR}/interventionMDD/preproc

CODE_SLURM=${CODE_DIR}/fmriprep_anat_sub.slurm

CON_IMG=${WD_DIR}/container_images/fmriprep_v20.2.0.simg
LOG_DIR=${DATA_DIR}_fmriprep_anat.log

chmod +x ${CODE_SLURM}

echo "Step1: starting fmriprep-SP!"

#SUB_ID=037S4028
sbatch ${CODE_SLURM} ${DATA_NAME} ${CON_IMG} ${SUB_ID} >> ${LOG_DIR}
echo "Submission finished!"
