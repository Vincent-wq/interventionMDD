#!/bin/bash
DATA_DIR=(${@:1:1})
SUBJ_LIST=(${@:2:1})
OUT_FILE=(${@:3:1})

echo "Segmenting Hipp for subjects in list -->" ${SUBJ_LIST} 
# Test code: Prepare subject_dir 
#SUBJECTS_DIR=/scratch/0tmp/fake_db/
#SUBJ_LIST=/scratch/interventionMDD/scripts/runningMDD_fmriprep.list
#OUT_FILE=/scratch/0tmp/fake_db/hipp_vols.txt

# Cache env variable
TMP_SUBJECTS_DIR=${SUBJECTS_DIR}
SUBJECTS_DIR=${DATA_DIR}
echo "SUBJECTS_DIR="${SUBJECTS_DIR}
echo "============================================================================="

# Segmenting hippocampus
for SUBJ_ID in $(cat ${SUBJ_LIST} | tr -d '\r')
do
#SUBJ_ID=$(sed 's/\r//' ${SUBJ_ID}})
echo "processing--> "${SUBJ_ID}
cmd="recon-all -s ${SUBJ_ID} -hippocampal-subfields-T1 -itkthreads 8"
echo "Running: ${cmd}"
eval $cmd
done

echo "SUBJECTS_DIR="${SUBJECTS_DIR}
# Collecting results
echo " Collecting data: =========================================================="
echo "SUBJECTS_DIR="${SUBJECTS_DIR}
quantifyHippocampalSubfields.sh T1 ${OUT_FILE} ${SUBJECTS_DIR}

# Finishing and restoring default vairables.

SUBJECTS_DIR=${TMP_SUBJECTS_DIR}