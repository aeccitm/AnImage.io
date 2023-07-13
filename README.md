# <div align="center">User’s Guide</center></div>

<div align="center"><b> AnIMAGE: A MATLAB-based tool for generating microstrip antennas with complex shapes.</b></div>

# Brief Description of AnIMAGE

AnIMAGE is a software tool developed on MATLAB, specifically designed to facilitate the design process of microstrip antennas with complex geometries. This software enables the creation of high-performance antennas with more design options, while its user-friendly interface simplifies the design process and streamlines design calculations, saving designers significant time and effort. Additionally, AnIMAGE allows for the exportation of complex geometries, providing the ability to simulate the electromagnetic behavior of these antennas in CST Studio. This software is particularly useful for designers looking to create antennas with complex geometries such as fractals or other structures derived from images, as it offers them innovative ways to design microstrip antennas.

# System Requeriments

AnIMAGE is developed on MATLAB R2022b, thus its system requirements are identical to those of MATLAB. The following are the minimum system requirements for running AnIMAGE:

- Processor: Any Intel-based Mac with four cores

- RAM: 4 GB minimum, but 8 GB is recommended

- Hard disk space: 20 GB of HDD space for MATLAB only, 30 GB for a typical installation.

- Operating system: macOS 10.15 (Catalina), macOS 10.14 (Mojave), macOS 10.13 (High
Sierra)

- Graphics: A GPU with OpenGL 3.3 or later support is recommended for using the GPU
acceleration feature.

To run the AnImage GUI, it is essential to have the CST_App folder downloaded from the repository, it contains the necessary files that the software use to function properly. Between these, the Application Programming Interface (API) files that connect the CST STUDIO Suite with Matlab extracted via (https://github.com/hgiddenss/CST_App). In addition, as well as other files that enable the users to access in the AnImage GUI from Matlab.

Finally, if you wish to perform an electromagnetic analysis on a structure designed with AnIMAGE, you must have previously installed the CST Studio software on your computer, if it is not installed, the Matlab script “CST MicrowaveStudio.m” will not run correctly **Instructions:** 

Instructions for installing the software and generating microstrip antennas with complex structures are provided below. 

**Step 1:**  Ensure that Matlab and CST STUDIO have been installed on your computer. Then, open Matlab and go to the directory where is contained the downloaded **CST_MicrowaveStudio.m** file. Once you have located the file and opened it, select the “Run” button to execute it. The **CST_MicrowaveStudio.m** file is intended to facilitate the integration of CST STUDIO with Matlab R2022b. By executing this file, you can utilize all the CST STUDIO software's features within Matlab. 

<div align="center"><img src="User'guide_images/Fig1.PNG"></div>
<p align="center">Fig 1. The display of the CST_MicrowaveStudio.m file.</p>

**Step 2:** Open the **AnIMAGE.m** file. The **AnIMAGE.m** file contains the code that describes each element of the GUI, such as buttons, menus, text boxes and axes. This code is responsible for the functionality of the software, so it is important to avoid making abrupt changes to the source code unless you have a good understanding of the implications of those changes.

To execute the **AnIMAGE.m** file, simply click on the "run" button in the Matlab environment. 

Note: The proposed software was configured by default to operate with .PNG images. However,
additional image formats such as .JPG, .TIFF among others are supported, if they are not encrypted.
As depicted in Figure 2, it could be selected at line 100 of the source code. 


<div align="center"><img src="User'guide_images/Fig2.PNG"></div>
<p align="center">Fig 2. The display of the AnIMAGE.m file.</p>

**Step 3:** After executing the code contained in the file, the AnIMAGE GUI will start, which you can then use to analyze and process your images. All elements of the GUI will be disabled by default until the desired image to be used is loaded. 

The user can import the image by selecting the "load image" button in the upper-left corner of the user interface, as shown in Figure 3.

<div align="center"><img src="User'guide_images/Fig3.PNG"></div>
<p align="center">Fig 3. User interface of AnIMAGE. The red box highlights the position of the load image button.</p>

**Step 4:** After navigating to the folder containing the image to be uploaded, the user must select it in .png format. To obtain a better fill in the construction of the figure, it is recommended to use a previously binarized or grayscale image.

AnIMAGE provides the option to automatically binarize an image if the user does not already possess one. This signifies that the software will convert the image into a two-tone format so that it can be processed correctly.

In fact, the user interface supports two distinct forms of image reconstruction, as illustrated in the following examples: 

**Example: Reconstruction using previously binarized image**

**Step 1:** Once Figure A has been loaded, we have two options: Actual B&W or Inverted B&W. The primary distinction between these two options is the area that will be filled with copper. In fact, the white color indicates the cooper region, and the black color the substrate.

<div align="center"><img src="User'guide_images/Fig4.PNG"></div>
<p align="center">Fig 4. Selecting and loading the image. For instance, a butterfly’s image has been selected, due to its complex symmetrical shape.</p>

**Option 1:** Actual B&W

<div align="center"><img src="User'guide_images/Fig5.PNG"></div>
<p align="center">Fig 5. Select Actual B&W option. The black color indicates the cooper region. </p>

**Option 2:** Inverted B&W

<div align="center"><img src="User'guide_images/Fig6.PNG"></div>
<p align="center">Fig 6.Select Inverted B&W option. The black color indicates the cooper region.</p>

**Step 2:** Now, the parameter tab will be enabled. Then, the user can select the optimal parameters for reconstructing the image on a dielectric substrate. Options that can be configured include the following:

- **a. Side length:** The dimension of the substrate in millimeters must be selected here. In this instance, the two dimensions of the substrate (length and width) will be the same to prevent deformation of the previously loaded image. As shown in Figure 7, for instance, we can input 30 mm for this parameter.

- **b. Resolution factor:** This parameter accepts values from 1 to 10. Since it reconstructs pixel by pixel, the optimal resolution for image reconstruction is a factor of 1. However, this significantly increases the reconstruction time. In this example, a factor of 2 is utilized, indicating that a Image reconstruction will be done every 2 pixels.

- **c. Image Scale:** This parameter allows adjusting the size of the image so that it is proportional to the substrate. In this example, we will use a scaling factor of 1.5 as illustrated in Figure 7.

- **d.** **Substrate thickness:** This parameter is a crucial factor that affects the antenna's response. By adjusting the thickness of the substrate, the antenna's performance can be optimized in terms of various parameters such as gain, bandwidth, and radiation pattern. In this example,
a thickness of 1.6 mm was typed into the box

- **e.** Dielectric constant: The dielectric constant is another crucial parameter for antenna simulation. It represents a material's ability to store electric energy and is a dimension lessnumber representing the ratio of the permittivity of a material relative to that of a vacuum. In this example, the dielectric constant of the FR-4 was entered in the box, i.e, a dielectric constant equal to 4.3.

- **f.** **Cooper thickness:** The thickness of the copper layer on the printed circuit board (PCB) affects the antenna's performance in terms of its radiation pattern, transmission efficiency, and attenuation of a transmission line. In this example, we have chosen a copper thickness of 0.035 mm.
  
- **g.** After entering the parameters, pick the **Graph** button.

- **h.** In the box to the right, the image will appear as shown, with the blue area representing the copper, the white portion representing the substrate, and the axis showing the dimensions of the substrate (in this case, 30mm x 30 mm).

<div align="center"><img src="User'guide_images/Fig7.PNG"></div>
<p align="center">Fig 7. Input of substrate parameters and showing of the reconstructed image based on the entered parameters.</p>

Figure 8 shows how the reconstruction changes when the image scale is increased to 5, while all other parameters remain fixed. As illustrated in Figure 8, the butterfly picture now exceeds the size of the defined substrate. It is critical to emphasize that this could be exported to the CST STUDIO program without difficulty.

<div align="center"><img src="User'guide_images/Fig8.PNG"></div>
<p align="center">Fig 8.  Variation of the image scale from 1.5 to 5, while the other parameters remain unchanged.</p>

**Step 3:** Now, the Coaxial feed option is available. Then, the user has the option of adding the coaxial cable. In the proposed example, we choose the option yes, as shown in Figure 9.

**Note:** the impedance of this port depends on the position where it is placed.

<div align="center"><img src="User'guide_images/Fig9.PNG"></div>
<p align="center">Fig 9. The user decides whether to add the coaxial feed to the designed antenna.</p>

**Step 4:** Next, AnIMAGE requests the X and Y coordinates in millimeters where you want to place it. For example, we input X=16 mm and Y=17.5 mm as is depicted in Figure 10. After that, click again on the **Graph** button.

<div align="center"><img src="User'guide_images/Fig10.PNG"></div>
<p align="center">Fig 10.  Input the coaxial feed's coordinates in the GUI.</p>

**Step 5:** Then, press the Export to CST button as is depicted in Figure 11, a new working window will open in CST Studio and start building the figure pixel by pixel according to the chosen Resolution factor and the image scale.

<div align="center"><img src="User'guide_images/Fig11.PNG"></div>
<p align="center">Fig 11. Reconstruction of the figure in CST Studio based on the chosen parameters.</p>

**Step 6:** When the image is finished, the pixels are connected to recreate the figure. Figure 12 identifies the following components

- **a. Substrate.** The white color indicates the presence of the substrate, and its thickness and dielectric permittivity will be the specified in step 2. Here, it is important to remember that the user can modify the dielectric constant and the thickness of the substrate in CST STUDIO also.
- **b. Radiant patch (Copper).** The yellow color indicates the presence of the cooper layer. The thickness will be the specified in step 2. 
- **c. Aggregated Coaxial feed.** (optional).
- **d. Ground (Copper).** The yellow color indicates the presence of the cooper layer. The thickness will be the specified in step 2.

<div align="center"><img src="User'guide_images/Fig12.PNG"></div>
<p align="center">Fig 12. Antenna built in CST. The different components of the designed antenna are shown here. </p>

**Step 7:** Finally, the user can simulate the electromagnetic behavior of the designed antenna using CST STUDIO.

<div align="center"><img src="User'guide_images/Fig13.PNG"></div>
<p align="center">Fig 13. The antenna is ready to be simulated in CST STUDIO, to know its electrical characteristics. </p>

# LICENSE 
This code is licensed under GNU (GPL)
