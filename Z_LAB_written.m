function varargout = Z_LAB_written(varargin)

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Z_LAB_written_OpeningFcn, ...
                   'gui_OutputFcn',  @Z_LAB_written_OutputFcn, ...
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


% --- Executes just before Z_LAB_written is made visible.
function Z_LAB_written_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Z_LAB_written (see VARARGIN)

% Choose default command line output for Z_LAB_written
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

set(handles.slider1, 'value',0.5);
set(handles.slider2, 'value',0.5);
set(handles.slider3, 'value',0.5);
set(handles.slider4, 'value',0.5);

axes(handles.axes1);
plot([-0.7 0.7],[0.6 0.6],'ok')
hold on
x = -0.9:0.1:0.9;
y = -x.^2/3-1;
plot(x,y,'k');
rectangle('Position',[-2 -2, 4 4],'Curvature',[1 1])
axis off

axes(handles.axes2);
plot([-0.7 0.7],[0.6 0.6],'ok')
hold on
x = -0.9:0.1:0.9;
y = x.^2/3-1;
plot(x,y,'k');
rectangle('Position',[-2 -2, 4 4],'Curvature',[1 1])
axis off

% UIWAIT makes Z_LAB_written wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Z_LAB_written_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on slider movement.
function slider1_Callback(hObject, eventdata, handles)
function slider1_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function slider2_Callback(hObject, eventdata, handles)
function slider2_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function slider3_Callback(hObject, eventdata, handles)
function slider3_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end
function slider4_Callback(hObject, eventdata, handles)
function slider4_CreateFcn(hObject, eventdata, handles)
if isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor',[.9 .9 .9]);
end

function nextButton_Callback(hObject, eventdata, handles)
% hObject    handle to nextButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

savePath = get(handles.savePath,'string');
saveName = get(handles.fileName,'string');
m = dlmread(fullfile(savePath,[saveName '.txt']));
num = str2double(get(handles.passageNum, 'String'));

values(1) = num;
values(2) = m(1,num);
values(3) = get(handles.slider1, 'value');
values(4) = get(handles.slider2, 'value');
values(5) = get(handles.slider3, 'value');
values(6) = get(handles.slider4, 'value');

dlmwrite(fullfile(savePath,[saveName '.txt']),values,'-append','precision','%.3f')

num = num + 1;
set(handles.passageNum, 'String', num);
set(handles.slider1, 'value',0.5);
set(handles.slider2, 'value',0.5);
set(handles.slider3, 'value',0.5);
set(handles.slider4, 'value',0.5);

set(handles.nextButton,'Visible','off')
if num > str2num(get(handles.passageTotal, 'String'))
    warndlg('thank you');
else
    textPath = get(handles.textPath,'string');
    f = fopen(fullfile(textPath,[num2str(m(1,num)) '.txt']));
    t = textscan(f,'%s');
    t = t{1};
    fclose(f);
    textLine = [];
    for i = 1:length(t)
        textLine = [textLine t{i} ' '];
    end
    set(handles.passageText1,'string',textLine);
    pause(4)
    set(handles.nextButton,'Visible','on')
end

function passageNum_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function passageNum_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function textPath_Callback(hObject, eventdata, handles)
function textPath_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function savePath_Callback(hObject, eventdata, handles)
function savePath_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in startButton.
function startButton_Callback(hObject, eventdata, handles)

savePath = get(handles.savePath,'string');
saveName = get(handles.fileName,'string');
textPath = get(handles.textPath,'string');

if ~exist(fullfile(savePath,[saveName '.txt']))
    
    p = dir(fullfile(textPath,'*.txt'));
    
    for i = length(p):-1:1
        m(i) = str2num(p(i).name(1:end-4));
    end
    c = clock;
    s = RandStream('mt19937ar','seed',c(3)*24*60*30+c(4)*24*60+c(5)*60+c(6));
    m2 = randperm(s,length(p));
    m = m(m2);
    dlmwrite(fullfile(savePath,[saveName '.txt']),m)
    dlmwrite(fullfile(savePath,[saveName '.txt']),0,'-append')
    set(handles.passageNum, 'String', 1);
    set(handles.passageTotal, 'String', length(p));
    num = 1;
else
    m = dlmread(fullfile(savePath,[saveName '.txt']));
    num = m(end,1)+1;
    set(handles.passageNum, 'String', num);
    set(handles.passageTotal, 'String', size(m,2));
end

textPath = get(handles.textPath,'string');
f = fopen(fullfile(textPath,[num2str(m(1,num)) '.txt']));
t = textscan(f,'%s');
t = t{1};
fclose(f);
textLine = [];
for i = 1:length(t)
    textLine = [textLine t{i} ' '];
end
set(handles.passageText1,'string',textLine);
pause(4)
set(handles.nextButton,'Visible','on')


function fileName_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function fileName_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

% --- Executes on button press in browseTextButton.
function browseTextButton_Callback(hObject, eventdata, handles)
p = uigetdir;
set(handles.textPath,'string',p);

% --- Executes on button press in browseDataButton.
function browseDataButton_Callback(hObject, eventdata, handles)
p = uigetdir;
set(handles.savePath,'string',p);

function passageTotal_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function passageTotal_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function passageText2_Callback(hObject, eventdata, handles)
% hObject    handle to passageText2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of passageText2 as text
%        str2double(get(hObject,'String')) returns contents of passageText2 as a double


% --- Executes during object creation, after setting all properties.
function passageText2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to passageText2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
