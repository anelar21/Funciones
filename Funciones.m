function varargout = Funciones(varargin)
% FUNCIONES MATLAB code for Funciones.fig
%      FUNCIONES, by itself, creates a new FUNCIONES or raises the existing
%      singleton*.
%
%      H = FUNCIONES returns the handle to a new FUNCIONES or the handle to
%      the existing singleton*.
%
%      FUNCIONES('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FUNCIONES.M with the given input arguments.
%
%      FUNCIONES('Property','Value',...) creates a new FUNCIONES or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Funciones_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Funciones_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Funciones

% Last Modified by GUIDE v2.5 08-May-2014 20:21:06

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Funciones_OpeningFcn, ...
                   'gui_OutputFcn',  @Funciones_OutputFcn, ...
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


% --- Executes just before Funciones is made visible.
function Funciones_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Funciones (see VARARGIN)

% Choose default command line output for Funciones
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Funciones wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Funciones_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;



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


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'Value') returns position of slider
%        get(hObject,'Min') and get(hObject,'Max') to determine range of slider


% --- Executes during object creation, after setting all properties.
function slider1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to slider1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: slider controls usually have a light gray background.
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end


% --- Executes on button press in logsig.
function logsig_Callback(hObject, eventdata, handles)
% hObject    handle to logsig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in tansig.
function tansig_Callback(hObject, eventdata, handles)
% hObject    handle to tansig (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes on button press in clasificar.
function clasificar_Callback(hObject, eventdata, handles)


%handlens es un manejador de datos
%a= get(handlens.entrada, 'String');
%set(handlens.salida,'String',a);
% hObject    handle to clasificar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
funcion=(get(handles.funcion,'Value'));
entranamiento=(get(handles.entrenamiento1,'Value'));

switch funcion
    case 1
        handles.fun='logsig';
        guidata(hObject,handles);
    case 2
        handles.fun='tansig';
        guidata(hObject,handles);
end

ncapas=[];
fact={};
numCapa=str2num(get(handles.ncapas,'String'))
for c=1:1:numCapa
    entrada=inputdlg('N° de neuronas','N° neuronas',1,{'0'});
    ncapas=[ncapas str2num(entrada{1,1})];
    fact(c)={handles.fun};
end 

ncapas;
handles.nunC=ncapas;
guidata(hObject,handles);
fact;
handles.funAct=fact;
guidata(hObject,handles);
%actualizar la información de los objetos y controles de un GUIDE

% Actualiza la estructura de control "handles"
entrad = str2num(get(handles.entrada1,'String'));
disp(entrad);
disp(handles.nunC);
disp(handles.funAct);
disp(handles.current_dat);

% Codigo para crear  y entrenar la red
% net.trainParam.epochs Máximo número de iteraciones para obtener convergencia
net = newff(minmax(entrad),handles.nunC,handles.funAct,handles.current_dat);

%Intervalo de visualización de los resultados
net.trainParam.show = 50; 
%Rata de aprendizaje
net.trainParam.lr = 0.04;
%Máximo número de iteraciones para obtener convergencia
net.trainParam.epochs = 400; 
%Error máximo permitido
net.trainParam.goal = 1e-5; 
a = sim(net,entrad); 
view(net); 
plot(entrad);

function entrada1_Callback(hObject, eventdata, handles)
% hObject    handle to entrada1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of entrada1 as text
%        str2double(get(hObject,'String')) returns contents of entrada1 as a double


% --- Executes during object creation, after setting all properties.
function entrada1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to entrada1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function salida1_Callback(hObject, eventdata, handles)
% hObject    handle to salida1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of salida1 as text
%        str2double(get(hObject,'String')) returns contents of salida1 as a double


% --- Executes during object creation, after setting all properties.
function salida1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to salida1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in neuronas1.
function neuronas1_Callback(hObject, eventdata, handles)
% hObject    handle to neuronas1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns neuronas1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from neuronas1


% --- Executes during object creation, after setting all properties.
function neuronas1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to neuronas1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in capas1.
function capas1_Callback(hObject, eventdata, handles)
% hObject    handle to capas1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns capas1 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from capas1


% --- Executes during object creation, after setting all properties.
function capas1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to capas1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in listbox2.
function listbox2_Callback(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns listbox2 contents as cell array
%        contents{get(hObject,'Value')} returns selected item from listbox2


% --- Executes during object creation, after setting all properties.
function listbox2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to listbox2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: listbox controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in entrenamiento1.
function entrenamiento1_Callback(hObject, eventdata, handles)

val = get(hObject,'Value');
str = get(hObject,'String'); 
switch str{val} case 'traingdx' 
    % User selects peaks 
    handles.current_dat = 'traingdx'; 
    guidata(hObject,handles); 
    case 'traingdm'
        handles.current_dat = 'traingdm'; 
        guidata(hObject,handles); 
    case 'trainlm' 
        handles.current_dat = 'trainlm'; 
        guidata(hObject,handles); 
end
guidata(hObject,handles);

% --- Executes during object creation, after setting all properties.
function entrenamiento1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to entrenamiento1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on selection change in funcion.
function funcion_Callback(hObject, eventdata, handles)
% hObject    handle to funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: contents = cellstr(get(hObject,'String')) returns funcion contents as cell array
%        contents{get(hObject,'Value')} returns selected item from funcion


% --- Executes during object creation, after setting all properties.
function funcion_CreateFcn(hObject, eventdata, handles)
% hObject    handle to funcion (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- If Enable == 'on', executes on mouse press in 5 pixel border.
% --- Otherwise, executes on mouse press in 5 pixel border or over text2.
function text2_ButtonDownFcn(hObject, eventdata, handles)
% hObject    handle to text2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)



function ncapas_Callback(hObject, eventdata, handles)
% hObject    handle to ncapas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of ncapas as text
%        str2double(get(hObject,'String')) returns contents of ncapas as a double


% --- Executes during object creation, after setting all properties.
function ncapas_CreateFcn(hObject, eventdata, handles)
% hObject    handle to ncapas (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
