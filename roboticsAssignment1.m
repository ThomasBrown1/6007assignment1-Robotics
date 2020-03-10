clc
clear
close all

global box1 
global box2
global box3
global box4
global box5
global box6
global box7



f = figure;
box1 = uicontrol('style','edit', 'position',[100 300 100 10])
box2 = uicontrol('style','edit', 'position',[100 280 100 10])
box3 = uicontrol('style','edit', 'position',[100 260 100 10])
box4 = uicontrol('style','edit', 'position',[100 240 100 10])
box5 = uicontrol('style','edit', 'position',[100 220 100 10])
box6 = uicontrol('style','edit', 'position',[100 200 100 10])

Box7 = uicontrol('style','pushbutton','string','Calculate x,y,z coordinates','position', [25 160 180 20])
Box7.Callback = @pushButtonPressed;

Box8 = uicontrol('style','text','string','Enter angle 1','position', [10 300 100 10])
Box9 = uicontrol('style','text','string','Enter angle 2','position', [10 280 100 10])
Box10 = uicontrol('style','text','string','Enter angle 3','position',[10 260 100 10])
Box11 = uicontrol('style','text','string','Enter angle 4','position',[10 240 100 10])
Box12 = uicontrol('style','text','string','Enter angle 5','position',[10 220 100 10])
Box13 = uicontrol('style','text','string','Enter angle 6','position',[10 200 100 10])

Box14 = uicontrol('style','text','string','X coordiante','position',[5 50 100 30],'BackgroundColor','Red')
Box15 = uicontrol('style','text','string','Y Coordinate','position',[105 50 100 30],'BackgroundColor','green')
Box16 = uicontrol('style','text','string','Z coordinate','position',[205 50 100 30],'BackgroundColor','blue')

function pushButtonPressed