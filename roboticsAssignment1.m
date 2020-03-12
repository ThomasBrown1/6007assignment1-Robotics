%% ignore varaible names
%%Code for gui
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
box1 = uicontrol('style','edit', 'position',[100 300 100 10]);
box2 = uicontrol('style','edit', 'position',[100 280 100 10]);
box3 = uicontrol('style','edit', 'position',[100 260 100 10]);
box4 = uicontrol('style','edit', 'position',[100 240 100 10]);
box5 = uicontrol('style','edit', 'position',[100 220 100 10]);
box6 = uicontrol('style','edit', 'position',[100 200 100 10]);

Box7 = uicontrol('style','pushbutton','string','Calculate x,y,z coordinates','position', [25 160 180 20]);
Box7.Callback = @pushButtonPressed;

Box8 = uicontrol('style','text','string','Enter angle 1','position', [10 300 100 10]);
Box9 = uicontrol('style','text','string','Enter angle 2','position', [10 280 100 10]);
Box10 = uicontrol('style','text','string','Enter angle 3','position',[10 260 100 10]);
Box11 = uicontrol('style','text','string','Enter angle 4','position',[10 240 100 10]);
Box12 = uicontrol('style','text','string','Enter angle 5','position',[10 220 100 10]);
Box13 = uicontrol('style','text','string','Enter angle 6','position',[10 200 100 10]);
Box14 = uicontrol('style','text','string','Denavit Hartenburg Calculator','position',[10 340 100 10]);
Box15 = uicontrol('style','text','string','Enter in your values to calculate the end position of your robot','position',[10 320 100 10]);
Box16 = uicontrol('style','text','string','X coordiante','position',[5 50 100 30],'BackgroundColor','Red');
Box17 = uicontrol('style','text','string','Y Coordinate','position',[105 50 100 30],'BackgroundColor','green');
Box18 = uicontrol('style','text','string','Z coordinate','position',[205 50 100 30],'BackgroundColor','blue');

function pushButtonPressed (src,event)
    
    global box1
    global box2
    global box3
    global box4
    global box5
    global box6
   
    box1=get(box1,'string');
    box2=get(box2,'string');
    box3=get(box3,'string');
    box4=get(box4,'string');
    box5=get(box5,'string');
    box6=get(box6,'string');
    
    Theta1=str2num(box1); 
    Theta2=str2num(box2);
    Theta3=str2num(box3);
    Theta4=str2num(box4);
    Theta5=str2num(box5);
    Theta6=str2num(box6);
  
    
    D1 = 330;
    D2 = 0;
    D3 = 0;
    D4 = -340;
    D5 = 0;
    D6 = -180;
    
    A1 = 40;
    A2 = 345;
    A3 = 40;
    A4 = 0;
    A5 = 0;
    A6 = 0;
    
    NotAlpha1 = -90;
    NotAlpha2 = 180;
    NotAlpha3 = -90;
    NotAlpha4 = 90;
    NotAlpha5 = -90;
    NotAlpha6 = 180;
    
    jointSzrotation = [cosd(Theta1) -sind(Theta1) 0 0;sind(Theta1) cosd(Theta1) 0 0;0 0 1 0;0 0 0 1];
    jointSztranslation = [1 0 0 0;0 1 0 0;0 0 1 D1;0 0 0 1];
    jointSxrotation = [ 1 0 0 A1; 0 1 0 0;0 0 1 0;0 0 0 1];
    jointSxtranslation = [1 0 0 0;0 cosd(NotAlpha1) -sind(NotAlpha1) 0;0 sind(NotAlpha1) cosd(NotAlpha1) 0;0 0 0 1];
    jointSresultant = jointSzrotation*jointSztranslation*jointSxrotation*jointSxtranslation;
    
    jointLzrotation = [cosd(Theta2) -sind(Theta2) 0 0;sind(Theta2) cosd(Theta2) 0 0;0 0 1 0;0 0 0 1];
    jointLztranslation = [1 0 0 0;0 1 0 0;0 0 1 D2;0 0 0 1];
    jointLxrotation = [ 1 0 0 A2; 0 1 0 0;0 0 1 0;0 0 0 1];
    jointLxtranslation = [1 0 0 0;0 cosd(NotAlpha2) -sind(NotAlpha2) 0;0 sind(NotAlpha2) cosd(NotAlpha2) 0;0 0 0 1];
    jointLresultant = jointLzrotation*jointLztranslation*jointLxrotation*jointLxtranslation;
    
    jointUzrotation = [cosd(Theta3) -sind(Theta3) 0 0;sind(Theta3) cosd(Theta3) 0 0;0 0 1 0;0 0 0 1];
    jointUztranslation = [1 0 0 0;0 1 0 0;0 0 1 D3;0 0 0 1];
    jointUxrotation = [ 1 0 0 A3; 0 1 0 0;0 0 1 0;0 0 0 1];
    jointUxtranslation = [1 0 0 0;0 cosd(NotAlpha3) -sind(NotAlpha3) 0;0 sind(NotAlpha3) cosd(NotAlpha3) 0;0 0 0 1];
    jointUresultant = jointUzrotation*jointUztranslation*jointUxrotation*jointUxtranslation;
    
    jointRzrotation = [cosd(Theta4) -sind(Theta4) 0 0;sind(Theta4) cosd(Theta4) 0 0;0 0 1 0;0 0 0 1];
    jointRztranslation = [1 0 0 0;0 1 0 0;0 0 1 D1;0 0 0 1];
    jointRxrotation = [ 1 0 0 A4; 0 1 0 0;0 0 1 0;0 0 0 1];
    jointRxtranslation = [1 0 0 0;0 cosd(NotAlpha4) -sind(NotAlpha4) 0;0 sind(NotAlpha4) cosd(NotAlpha4) 0;0 0 0 1];
    jointRresultant = jointRzrotation*jointRztranslation*jointRxrotation*jointRxtranslation;
    
    jointBzrotation = [cosd(Theta5) -sind(Theta5) 0 0;sind(Theta5) cosd(Theta5) 0 0;0 0 1 0;0 0 0 1];
    jointBztranslation = [1 0 0 0;0 1 0 0;0 0 1 D5;0 0 0 1];
    jointBxrotation = [ 1 0 0 A5; 0 1 0 0;0 0 1 0;0 0 0 1];
    jointBxtranslation = [1 0 0 0;0 cosd(NotAlpha5) -sind(NotAlpha5) 0;0 sind(NotAlpha5) cosd(NotAlpha5) 0;0 0 0 1];
    jointBresultant = jointBzrotation*jointBztranslation*jointBxrotation*jointBxtranslation;
    
    jointTzrotation = [cosd(Theta6) -sind(Theta6) 0 0;sind(Theta6) cosd(Theta6) 0 0;0 0 1 0;0 0 0 1];
    jointTztranslation = [1 0 0 0;0 1 0 0;0 0 1 D6;0 0 0 1];
    jointTxrotation = [ 1 0 0 A6; 0 1 0 0;0 0 1 0;0 0 0 1];
    jointTxtranslation = [1 0 0 0;0 cosd(NotAlpha6) -sind(NotAlpha6) 0;0 sind(NotAlpha6) cosd(NotAlpha6) 0;0 0 0 1];
    jointTresultant = jointTzrotation*jointTztranslation*jointTxrotation*jointTxtranslation;
    
    finalResultant = jointSresultant*jointBresultant*jointUresultant*jointRresultant*jointLresultant*jointTresultant
end