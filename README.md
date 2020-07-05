# ARCH20-FAUST
A repo for the codes used to generate the results from the tool FAUST as reported in the ARCH20 report.


## Installing and Running FAUST^2

FAUST^2 can be downloaded from SourceForge using the following link: http://sourceforge.net/projects/FAUST2. It only requires MATLAB to work. Once FAUST is downloaded and unpacked, follow the installation instruction in the README file in the root directory.

FAUST^2 has a GUI users can use to interact with it.
Open the Matlab file FAUST.m and run it to launch the GUI.


## Replicating the Results reported in ARCH20

Once you have the GUI of FAUST running, you will be using one of the provided **Matlab M-files** to run each reported case study.
The **Matlab M-files** corresponding to the case studies are located in the directory **./-files**

Follow the following steps to run any case study (leave default settings unless modified by the following steps):

1. From the "Program Selection" part, select **PCTL-safety** or **PCTL-Reach-Avoid** based on the required specification of the case study
1. From the "Kernel Distribution" part, select **User-defined** and load the M-file of the case study by clicking on the button "Search for file" under the part "Name of kernel function".
1. Change the settings "Desiered Error", "Domain", "Target Set", "Input Set", and "Number of Time Steps", based on the case study.
1. Click on "Generate the abstraction" and follow the instruction given by FAUST.
1. Once done, in the right side of the GUI, enter an initial set s0 in "Initial conditin s0" and click on "Calculate". This will show you the probability of satisfying the specification starting from s0.
  

