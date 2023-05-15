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

To utilize the AnIMAGE GUI, it is crucial to download the CST_App folder from the repository, which includes necessary files that enable proper software functionality. These files include the Application Programming Interface (API) files that establish the connection between CST STUDIO Suite and MATLAB (extracted from https://github.com/hgiddenss/CST_App), as well as other files that enable users to access the AnIMAGE GUI from MATLAB

Lastly, to conduct electromagnetic analyses on structures designed with AnIMAGE, it is necessary to install CST Studio software beforehand. Failure to install this software will result in the improper functioning of the MATLAB script “CST MicrowaveStudio.m. 

**Instructions**

To use AnIMAGE software for generating microstrip antennas with complex structures, follow the instructions below:

**Step 1:** Ensure that your computer has MATLAB R2022b and CST STUDIO Suite software installed. Open MATLAB and navigate to the folder containing the CST_MicrowaveStudio.m file. Run the file by selecting the "Run" button. This file facilitates the integration of CST STUDIO with MATLAB R2022b, enabling you to use all the features of the CST STUDIO software in MATLAB.

<div align="center"><img src="User'guide_images/Fig1.PNG"></div>
<p align="center">Fig 1. The display of the CST_MicrowaveStudio.m file.</p>

**Step 2:** Open the AnIMAGE.m file, which contains the code describing the elements of the GUI, such as buttons, menus, text boxes, and axes. The code determines the software's functionality, so it is recommended not to make abrupt changes to the source code unless you have a good understanding of the implications. To execute the AnIMAGE.m file, click on the "run" button in the MATLAB environment. Note that AnIMAGE is configured by default to operate with .PNG images, but other image formats such as .JPG and .TIFF are also supported.

**Warning:** The proposed software was configured by default to operate with .PNG images. However, additional image formats such as .JPG, .TIFF among others are supported, if they are not encrypted. As depicted in Figure 2, it could be selected at line 100 of the source code.

<div align="center"><img src="User'guide_images/Fig2.PNG"></div>
<p align="center">Fig 2. The display of the AnIMAGE.m file.</p>

**Step 3:** After running the code in the AnIMAGE.m file, the AnIMAGE GUI will appear. All elements of the GUI will be disabled until the desired image is loaded. To import an image, select the "load image" button in the upper-left corner of the interface and navigate to the folder containing the image. AnIMAGE supports .png, .jpg, .tiff, and other unencrypted image formats. It is recommended to use a previously binarized or grayscale image for better results.

The user can import the image by selecting the "load image" button in the upper-left corner of the user interface, as shown in Figure 3.

**Step 4:** Once the desired image is selected, the user can use the software to process and analyze the image. AnIMAGE provides an option to automatically binarize an image if the user does not have one. This converts the image into a two-tone format for correct processing. The user interface supports two distinct forms of image reconstruction. Examples of these forms are illustrated in the following examples:

<div align="center"><img src="User'guide_images/Fig3.PNG"></div>
<p align="center">Fig 3. User interface of AnIMAGE. The red box highlights the position of the load image button.</p>

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

- **d.** After entering the parameters, pick the **Graph** button.

- **e.** In the box to the right, the image will appear as shown, with the blue area representing the copper, the white portion representing the substrate, and the axis showing the dimensions of the substrate (in this case, 30mm x 30 mm).

<div align="center"><img src="User'guide_images/Fig7.PNG"></div>
<p align="center">Fig 7. Input of substrate parameters and showing of the reconstructed image based on the entered parameters.</p>

Figure 8 illustrates how the reconstruction alters when the image scale is increased to 5, while all other parameters remain unchanged. The butterfly image now exceeds the size of the defined substrate, as shown in Figure 8. It is essential to clarify that this could be exported to the CST STUDIO software in the same manner without issue.

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

**Step 6:** Once the image is complete, the pixels will be automatically joined to reconstruct the figure. The following components are identifiable in Figure 12.

- **a. Substrate.** The system is constructed with a FR-4 substrate by default; however, this can be changed in CST STUDIO. The white color indicates the presence of the substrate,
and its thickness is 1.6 mm by default also.
- **b. Radiant patch (Copper).** The yellow color indicates the presence of the cooper layer.
The thickness is 35 µm by default.
- **c. Aggregated Coaxial feed.** (optional).
- **d. Ground (Copper).** The yellow color indicates the presence of the cooper layer. The
thickness is 35 µm by default.

<div align="center"><img src="User'guide_images/Fig12.PNG"></div>
<p align="center">Fig 12. Antenna built in CST. The different components of the designed antenna are shown here. </p>

**Step 7:** Finally, the user can simulate the electromagnetic behavior of the designed antenna using CST STUDIO.

<div align="center"><img src="User'guide_images/Fig13.PNG"></div>
<p align="center">Fig 13. The antenna is ready to be simulated in CST STUDIO, to know its electrical characteristics. </p>

# LICENSE 
This code is licensed under GNU (GPL)
