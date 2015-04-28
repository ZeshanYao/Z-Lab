function varargout = Z_LAB_audio(varargin)
% Z_LAB_AUDIO MATLAB code for Z_LAB_audio.fig
%      Z_LAB_AUDIO, by itself, creates a new Z_LAB_AUDIO or raises the existing
%      singleton*.
%
%      H = Z_LAB_AUDIO returns the handle to a new Z_LAB_AUDIO or the handle to
%      the existing singleton*.
%
%      Z_LAB_AUDIO('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in Z_LAB_AUDIO.M with the given input arguments.
%
%      Z_LAB_AUDIO('Property','Value',...) creates a new Z_LAB_AUDIO or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Z_LAB_audio_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Z_LAB_audio_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Z_LAB_audio

% Last Modified by GUIDE v2.5 04-Feb-2015 10:27:19

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Z_LAB_audio_OpeningFcn, ...
                   'gui_OutputFcn',  @Z_LAB_audio_OutputFcn, ...
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


% --- Executes just before Z_LAB_audio is made visible.
function Z_LAB_audio_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Z_LAB_audio (see VARARGIN)

% Choose default command line output for Z_LAB_audio
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

% UIWAIT makes Z_LAB_audio wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Z_LAB_audio_OutputFcn(hObject, eventdata, handles) 
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

% --- Executes on button press in listenButton.
function listenButton_Callback(hObject, eventdata, handles)
% hObject    handle to listenButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global hear
global player

soundPath = get(handles.soundPath,'string');
savePath = get(handles.savePath,'string');
saveName = get(handles.fileName,'string');
m = dlmread(fullfile(savePath,[saveName '.txt']));
listenNum = str2double(get(handles.speakerNum, 'String'));
[y,Fs] = audioread(fullfile(soundPath,[num2str(m(1,listenNum)) '.wav']));
player = audioplayer(y,Fs);
play(player)
if ~hear
    set(handles.listenButton,'visible','off')
    pause(ceil(player.TotalSamples/player.SampleRate))
    set(handles.nextButton,'visible','on')
    set(handles.listenButton,'visible','on')
else
    set(handles.listenButton,'visible','off')
    pause(ceil(player.TotalSamples/player.SampleRate))
    set(handles.listenButton,'visible','on')
end

hear = true;

% --- Executes on button press in nextButton.
function nextButton_Callback(hObject, eventdata, handles)
% hObject    handle to nextButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

global hear
hear = false;

global player

pause(player)

savePath = get(handles.savePath,'string');
saveName = get(handles.fileName,'string');
m = dlmread(fullfile(savePath,[saveName '.txt']));
num = str2double(get(handles.speakerNum, 'String'));

values(1) = num;
values(2) = m(1,num);
values(3) = get(handles.slider1, 'value');
values(4) = get(handles.slider2, 'value');
values(5) = get(handles.slider3, 'value');
values(6) = get(handles.slider4, 'value');

dlmwrite(fullfile(savePath,[saveName '.txt']),values,'-append','precision','%.3f')

num = num + 1;

if num > str2num(get(handles.speakerTotal, 'String'))
    warndlg('thank you');
end

set(handles.speakerNum, 'String', num);
set(handles.slider1, 'value',0.5);
set(handles.slider2, 'value',0.5);
set(handles.slider3, 'value',0.5);
set(handles.slider4, 'value',0.5);

set(handles.listenButton,'visible','on')
set(handles.nextButton,'visible','off')


function speakerNum_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function speakerNum_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end

function soundPath_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function soundPath_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function savePath_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function savePath_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in startButton.
function startButton_Callback(hObject, eventdata, handles)

global hear

hear = false;

set(handles.listenButton,'Visible','on')

savePath = get(handles.savePath,'string');
saveName = get(handles.fileName,'string');
soundPath = get(handles.soundPath,'string');

if ~exist(fullfile(savePath,[saveName '.txt']))
    
    p = dir(fullfile(soundPath,'*.wav'));
    
    for i = length(p):-1:1
        m(i) = str2num(p(i).name(1:end-4));
    end
    c = clock;
    s = RandStream('mt19937ar','seed',c(3)*24*60*30+c(4)*24*60+c(5)*60+c(6));
    m2 = randperm(s,length(p));
    set(handles.speakerNum, 'String', 1);
    set(handles.speakerTotal, 'String', length(p));
    dlmwrite(fullfile(savePath,[saveName '.txt']),m(m2))
    dlmwrite(fullfile(savePath,[saveName '.txt']),0,'-append')
else
    m = dlmread(fullfile(savePath,[saveName '.txt']));
    set(handles.speakerNum, 'String', m(end,1)+1);
    set(handles.speakerTotal, 'String', size(m,2));
end

function fileName_Callback(hObject, eventdata, handles)
% --- Executes during object creation, after setting all properties.
function fileName_CreateFcn(hObject, eventdata, handles)
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in browseTextButton.
function browseTextButton_Callback(hObject, eventdata, handles)
p = uigetdir;
set(handles.soundPath,'string',p);


% --- Executes on button press in browseDataButton.
function browseDataButton_Callback(hObject, eventdata, handles)
% hObject    handle to browseDataButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
p = uigetdir;
set(handles.savePath,'string',p);


function speakerTotal_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function speakerTotal_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end
