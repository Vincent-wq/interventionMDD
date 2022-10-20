# The preprocessing pipeline for interventionMDD project

## 1. Download the bids dataset.

## 2. Preprocessing with fMRIPrep and freesurfer_6.0.0 for hippocampus segmentation

   1. fMRIPrep_v20.2.7;
       
       ```command```

   2. freesurfer_6.0.1 (fmriprep_docker with full freesurfer installation)

       ```chmod +x seg_Hipp.sh```
       
      ```./seg_Hipp.sh /scratch/runningMDD_ses-1_fmriprep_anat_20.2.7/freesurfer-6.0.1 runningMDD1_fmriprep.list /scratch/interventionMDD/data/runningMDD-hippVol_ses-1.txt```

      ```./seg_Hipp.sh /scratch/runningMDD_ses-2_fmriprep_anat_20.2.7/freesurfer-6.0.1 runningMDD2_fmriprep.list /scratch/interventionMDD/data/runningMDD-hippVol_ses-2.txt```

      ```./seg_Hipp.sh /scratch/runningMDD_ses-3_fmriprep_anat_20.2.7/freesurfer-6.0.1 runningMDD3_fmriprep.list /scratch/interventionMDD/data/runningMDD-hippVol_ses-3.txt```

## 3. 