function varargout = AnIMAGE(varargin)
% ANIMAGE MATLAB code for AnIMAGE.fig
%      ANIMAGE, by itself, creates a new ANIMAGE or raises the existing
%      singleton*.
%
%      H = ANIMAGE returns the handle to a new ANIMAGE or the handle to
%      the existing singleton*.
%
%      ANIMAGE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ANIMAGE.M with the given input arguments.
%
%      ANIMAGE('Property','Value',...) creates a new ANIMAGE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before AnIMAGE_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to AnIMAGE_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help AnIMAGE

% Last Modified by GUIDE v2.5 08-Jun-2023 09:14:13

% Begin initialization code - DO NOT EDIT

gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @AnIMAGE_OpeningFcn, ...
                   'gui_OutputFcn',  @AnIMAGE_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT


% --- Executes just before AnIMAGE is made visible.
function AnIMAGE_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to AnIMAGE (see VARARGIN)

% Choose default command line output for AnIMAGE
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);
set(handles.radiobutton3, 'enable','off');
set(handles.radiobutton4, 'enable','off');
set(handles.pushbutton2, 'enable','off');
set(handles.pushbutton3, 'enable','off');
set(handles.edit1, 'enable','off');
set(handles.edit2, 'enable','off');

set(handles.edit5, 'enable','off');
set(handles.pushbutton4, 'enable','off');
set(handles.edit6, 'enable','off');
set(handles.edit7, 'enable','off');
set(handles.edit9, 'enable','off');
set(handles.edit10, 'enable','off');
set(handles.edit11, 'enable','off');

set(handles.radiobutton3, 'enable','off');
set(handles.radiobutton4, 'enable','off');
set(handles.radiobutton7, 'enable','off');
set(handles.radiobutton8, 'enable','off');
set(handles.radiobutton3, 'Value', 0);
set(handles.radiobutton4, 'Value', 0);



% UIWAIT makes AnIMAGE wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = AnIMAGE_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



% Get default command line output from handles structure
varargout{1} = handles.output;
% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
[baseFileName, folder] = uigetfile('*.png', 'Select a file');
if baseFileName == 0
  % User clicked the Cancel button.
  return;
end
fullFileName = fullfile(folder, baseFileName)
I = imread(fullFileName);


sz = size(I,3);
if sz>1
    Ig =rgb2gray(I);
else
    Ig =I;
end
BW = imbinarize(Ig);

dim = size(BW);
axes(handles.axes1);
imshow(BW)
handles.dim=dim;
handles.BW=BW;

set(handles.radiobutton4, 'Value', 1);
set(handles.radiobutton3, 'enable','on');
set(handles.radiobutton4, 'enable','on');
set(handles.pushbutton3, 'enable','on');
set(handles.edit1, 'enable','on');
set(handles.edit2, 'enable','on');
set(handles.edit9, 'enable','on');
set(handles.edit10, 'enable','on');
set(handles.edit11, 'enable','on');

set(handles.edit5, 'enable','on');
handles.I=I;
guidata(hObject, handles)


% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
w=handles.w;
er=handles.er;
z=handles.z;
z1=handles.z1;
cc=handles.cc;
cc2=handles.cc2;
calidad=handles.calidad;
escala=handles.escala;
xx=handles.xx;
yy=handles.yy;
xx2=handles.xx2;
yy2=handles.yy2;
pixels=handles.pixels;
pixels2=handles.pixels2;
dim2=handles.dim2;


CST=CST_MicrowaveStudio('C:\Users\sebastianmontoya\Desktop\abc','Simulation.cst');
CST.setSolver('frequency');
Z = [z z+z1];
CST.addParameter('Er',er);
CST.addParameter('Mue',1);
CST.addParameter('W',w);
CST.addParameter('z',z);


%nombre del bloque, permitividad, permeabilidad y color del material
CST.addNormalMaterial('Material_2','Er','Mue',[1 1 1]);
CST.addNormalMaterial('Substrate',er,1,[1 0.8 0.6]);
CST.addNormalMaterial('PTFE',2.1,1,[1 0.5 0.5]);

Z2=[0 -3*z];
Z3=[z -3*z];
CST.addBrick([-w/2 w/2]+(w/2+cc)*escala,[-w/2 w/2]+(w/2+cc)*escala,[0 z],'Brick1','Component1','Substrate');
CST.addBrick([-w/2 w/2]+(w/2+cc)*escala,[-w/2 w/2]+(w/2+cc)*escala,[0 -z1],'Tierra','Component1','Copper (annealed)');

ii=0;
%CST.setUpdateStatus(false)
tic
for i = 1:dim2(1)
    
    for j = 1:dim2(2)
        
        if pixels2(i,j)            
            ii = ii+1;
            Xblock= [xx2(i,j)*escala xx2(i,j+1)*escala];
            Yblock = [yy2(i,j)*escala yy2(i+1,j)*escala];
            name = ['Brick',num2str(ii)];
            CST.addBrick(Xblock,Yblock,Z,name,'Component2','Copper (annealed)');            
        end    
    end   
end

CST.mergeCommonSolids('Component2')
%CST.addToHistory;
%CST.setUpdateStatus(true)
toc
val1=get(handles.radiobutton7, 'Value');

if val1 == 1
    posx=handles.posx;
    posy=handles.posy;
    CST.addCylinder(4.7/2+0.1,4.7/2,'z',posx,posy,Z2,"11","component3",'Copper (annealed)')
    CST.addCylinder(4.7/2,1.4/2,'z',posx,posy,Z2,"12","component3",'PTFE')
    CST.addCylinder(1.4/2,0,'z',posx,posy,Z3,"13","component3",'Copper (annealed)')
    CST.insertObject("Component1:Tierra", "component3:12" )
    CST.insertObject("Component1:Tierra", "component3:11" )
    CST.insertObject("Component1:Tierra", "component3:13" )
    CST.insertObject("Component1:Brick1", "component3:13" )
    CST.addWaveguidePort('zmin',[-4.7/2 4.7/2]+posx,[-4.7/2 4.7/2]+posy, -3*z)
    
end


set(handles.pushbutton2, 'enable','off');
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double


% --- Executes during object creation, after setting all properties.
function edit1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double


% --- Executes during object creation, after setting all properties.
function edit2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function axes1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes1


% --- Executes during object creation, after setting all properties.
function axes2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes2


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
dim=handles.dim;
BW=handles.BW;
w=str2num(char(get(handles.edit5, 'String')));

z=str2num(char(get(handles.edit9, 'String')));
er=str2num(char(get(handles.edit10, 'String')));
z1=str2num(char(get(handles.edit11, 'String')));
n=w;
cc=w/(dim(1));
cc2=w/(dim(2));
calidad=str2num(char(get(handles.edit1, 'String')));
escala=str2num(char(get(handles.edit2, 'String')));
[xx,yy] = meshgrid(0:cc2:w,0:cc:w);
[xx2,yy2]=meshgrid(0:cc2*calidad:w,0:cc*calidad:w);

% sqx=[-w/2+(w/2+cc)*escala -w/2+(w/2+cc)*escala w/2+(w/2+cc)*escala w/2+(w/2+cc)*escala -w/2+(w/2+cc)*escala];
% sqy=[-w/2+(w/2+cc)*escala w/2+(w/2+cc)*escala w/2+(w/2+cc)*escala -w/2+(w/2+cc)*escala -w/2+(w/2+cc)*escala];
sqx2=[-w/2+(w/2+cc) -w/2+(w/2+cc) w/2+(w/2+cc) w/2+(w/2+cc) -w/2+(w/2+cc)];
sqy2=[-w/2+(w/2+cc) w/2+(w/2+cc) w/2+(w/2+cc) -w/2+(w/2+cc) -w/2+(w/2+cc)];
% axes(handles.axes2);
% plot(sqx,sqy)
% 
pixels = logical(handles.BW);
pixels2=pixels(1:calidad:dim(1),1:calidad:dim(2));
pixels2=flip(pixels2);
dim2=size(handles.BW)/calidad;

k=0;
for i = 1:dim2(1)
    for j = 1:dim2(2)
        if pixels2(i,j)
            k=k+1;
            Xblock= [xx2(i,j)*escala+w/2-(w/2)*escala];
            Yblock =[yy2(i,j)*escala+w/2-(w/2)*escala];
%             Xblock= [xx2(i,j)*escala];
%             Yblock =[yy2(i,j)*escala];
            points2(:,k)=[Xblock,Yblock];
        end
    end
end

handles.w=w;
handles.z=z;
handles.z1=z1;
handles.cc=cc;
handles.cc2=cc2;
handles.calidad=calidad;
handles.escala=escala;
handles.er=er;
handles.xx=xx;
handles.yy=yy;
handles.xx2=xx2;
handles.yy2=yy2;
handles.pixels = pixels;
handles.pixels2=pixels2;
handles.dim2=dim2;


axes(handles.axes2);
scatter(points2(1,:),points2(2,:));
hold on
plot(sqx2,sqy2)
hold off

axis tight  
set(handles.pushbutton2, 'enable','on');
set(handles.radiobutton3, 'enable','on');
set(handles.radiobutton4, 'enable','on');
set(handles.radiobutton7, 'enable','on');
set(handles.radiobutton8, 'enable','on');
set(handles.radiobutton8, 'Value', 1);
set(handles.radiobutton7, 'Value', 0);
guidata(hObject, handles)



function edit4_Callback(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit4 as text
%        str2double(get(hObject,'String')) returns contents of edit4 as a double


% --- Executes during object creation, after setting all properties.
function edit4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit5_Callback(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit5 as text
%        str2double(get(hObject,'String')) returns contents of edit5 as a double


% --- Executes during object creation, after setting all properties.
function edit5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton4.
function radiobutton4_Callback(hObject, eventdata, handles)
I=handles.I;
sz = size(I,3);
if sz>1
    Ig =rgb2gray(I);
else
    Ig =I;
end
BW = imbinarize(Ig);

dim = size(BW);

axes(handles.axes1);
imshow(BW)
handles.dim=dim;
handles.BW=BW;

set(handles.pushbutton3, 'enable','on');
set(handles.edit1, 'enable','on');
set(handles.edit2, 'enable','on');
set(handles.edit9, 'enable','on');
set(handles.edit10, 'enable','on');
set(handles.edit11, 'enable','on');
set(handles.edit5, 'enable','on');
set(handles.pushbutton4, 'enable','off');
set(handles.edit6, 'enable','off');
set(handles.edit7, 'enable','off');

guidata(hObject, handles)
% hObject    handle to radiobutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton4


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
I=handles.I;
sz = size(I,3);
if sz>1
    Ig =rgb2gray(I);
else
    Ig =I;
end
BW = imbinarize(Ig);
BW = logical(1 - BW);
dim = size(BW);
axes(handles.axes1);
imshow(BW)
handles.dim=dim;
handles.BW=BW;

set(handles.pushbutton3, 'enable','on');
set(handles.edit1, 'enable','on');
set(handles.edit2, 'enable','on');
set(handles.edit9, 'enable','on');
set(handles.edit10, 'enable','on');
set(handles.edit11, 'enable','on');

set(handles.edit5, 'enable','on');
set(handles.pushbutton4, 'enable','off');
set(handles.edit6, 'enable','off');
set(handles.edit7, 'enable','off');
guidata(hObject, handles)



% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
axes(handles.axes2);

cc=handles.cc;
cc2=handles.cc2;
n=handles.w;

posx=str2num(char(get(handles.edit6, 'String')));
posy=str2num(char(get(handles.edit7, 'String')));

rectangle('Position',[posx posy cc2*10 cc2*10], 'FaceColor',[0 0 0]);

set(handles.pushbutton4, 'enable','off');
set(handles.edit6, 'enable','off');
set(handles.edit7, 'enable','off');
set(handles.pushbutton2, 'enable','on');

set(handles.radiobutton7, 'enable','off');
set(handles.radiobutton8, 'enable','off');

handles.posx=posx;
handles.posy=posy;




guidata(hObject, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit6_Callback(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit6 as text
%        str2double(get(hObject,'String')) returns contents of edit6 as a double


% --- Executes during object creation, after setting all properties.
function edit6_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit6 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit7_Callback(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit7 as text
%        str2double(get(hObject,'String')) returns contents of edit7 as a double


% --- Executes during object creation, after setting all properties.
function edit7_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in radiobutton7.
function radiobutton7_Callback(hObject, eventdata, handles)
set(handles.radiobutton7, 'Value', 1);
set(handles.radiobutton8, 'Value', 0);
set(handles.edit6, 'enable','on');
set(handles.edit7, 'enable','on');
set(handles.pushbutton4, 'enable','on');
set(handles.pushbutton2, 'enable','on');




guidata(hObject, handles)
% hObject    handle to radiobutton7 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton7


% --- Executes on button press in radiobutton8.
function radiobutton8_Callback(hObject, eventdata, handles)
set(handles.radiobutton7, 'Value', 0);
set(handles.radiobutton8, 'Value', 1);
set(handles.edit6, 'enable','off');
set(handles.edit7, 'enable','off');
set(handles.pushbutton4, 'enable','off');
set(handles.pushbutton2, 'enable','on');


% hObject    handle to radiobutton8 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
guidata(hObject, handles)
% Hint: get(hObject,'Value') returns toggle state of radiobutton8


% --- Executes during object creation, after setting all properties.
function axes4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to axes4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: place code in OpeningFcn to populate axes4


% --- Executes when uibuttongroup3 is resized.
function uibuttongroup3_SizeChangedFcn(hObject, eventdata, handles)
% hObject    handle to uibuttongroup3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function edit9_Callback(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit9 as text
%        str2double(get(hObject,'String')) returns contents of edit9 as a double


% --- Executes during object creation, after setting all properties.
function edit9_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit9 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit10_Callback(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit10 as text
%        str2double(get(hObject,'String')) returns contents of edit10 as a double


% --- Executes during object creation, after setting all properties.
function edit10_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit10 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function edit11_Callback(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit11 as text
%        str2double(get(hObject,'String')) returns contents of edit11 as a double


% --- Executes during object creation, after setting all properties.
function edit11_CreateFcn(hObject, eventdata, handles)
% hObject    handle to edit11 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
