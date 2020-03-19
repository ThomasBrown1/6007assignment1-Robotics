%%Code to construct a Graphical User Inteface(GUI) to allow the user to input the joint angles
%%for a six joint Yakasawa GP8 robot. The code uses those angles and calculates the
%%end effector position through the conventional denavit hartenberg method.
%%The final values for X,Y,Z, Roll, Pitch,and Yaw are displyed to the user
%%in the GUI.

clc %% clears the commant window each time the programme is run to aviod old information displaying on the command line
clear %% clears the variables and functions used throughout the code from memory on each new run
close all %% Closes all figures displayed from previously ran code



global box1 %% Decleares box1 as global so that it can be utalised in a function further on in the code
global box2 %% Decleares box2 as global so that it can be utalised in a function further on in the code
global box3 %% Decleares box3 as global so that it can be utalised in a function further on in the code
global box4 %% Decleares box4 as global so that it can be utalised in a function further on in the code
global box5 %% Decleares box5 as global so that it can be utalised in a function further on in the code
global box6 %% Decleares box6 as global so that it can be utalised in a function further on in the code
global box7 %% Decleares box7 as global so that it can be utalised in a function further on in the code


f = figure; %% creates a new figure using default property values
box1 = uicontrol('style','edit', 'position',[170 300 50 20]); %% Sets up box1 as an edit box to allow the user to input a joint angle, the one by four array specifies the postion of the box on the GUI 
box2 = uicontrol('style','edit', 'position',[170 275 50 20]); %% Sets up box2 as an edit box to allow the user to input a joint angle, the one by four array specifies the postion of the box on the GUI
box3 = uicontrol('style','edit', 'position',[170 250 50 20]); %% Sets up box3 as an edit box to allow the user to input a joint angle, the one by four array specifies the postion of the box on the GUI
box4 = uicontrol('style','edit', 'position',[170 225 50 20]); %% Sets up box4 as an edit box to allow the user to input a joint angle, the one by four array specifies the postion of the box on the GUI
box5 = uicontrol('style','edit', 'position',[170 200 50 20]); %% Sets up box5 as an edit box to allow the user to input a joint angle, the one by four array specifies the postion of the box on the GUI
box6 = uicontrol('style','edit', 'position',[170 175 50 20]); %% Sets up box6 as an edit box to allow the user to input a joint angle, the one by four array specifies the postion of the box on the GUI

Box7 = uicontrol('style','pushbutton','string','Press to calculate the end effector position','position', [1 150 250 20]); %% Sets up box7 as a pushbutton in the GUI
Box7.Callback = @pushButtonPressed; %% Causes an event to occur when the user interacts with the pushbutton, the function is known as pushButtonPressed

Box8 = uicontrol('style','text','string','Enter joint angle S','position', [1 300 150 20]); %% Displays a box with text inside to aid with operation of the GUI
Box9 = uicontrol('style','text','string','Enter joint angle L','position', [1 275 150 20]); %% Displays a box with text inside to aid with operation of the GUI
Box10 = uicontrol('style','text','string','Enter joint angle U','position',[1 250 150 20]); %% Displays a box with text inside to aid with operation of the GUI
Box11 = uicontrol('style','text','string','Enter joint angle R','position',[1 225 150 20]); %% Displays a box with text inside to aid with operation of the GUI
Box12 = uicontrol('style','text','string','Enter joint angle B','position',[1 200 150 20]); %% Displays a box with text inside to aid with operation of the GUI
Box13 = uicontrol('style','text','string','Enter joint angle T','position',[1 175 150 20]); %% Displays a box with text inside to aid with operation of the GUI
Box14 = uicontrol('style','text','string','Denavit Hartenburg Calculator','position',[1 380 180 30]); %% Displays a box with text inside to aid with operation of the GUI
Box15 = uicontrol('style','text','string','Enter your joint angles into the boxes below to calculate the end effector position of your robot','position',[1 325 500 30]); %% Displays a box with text inside to aid with operation of the GUI
Box16 = uicontrol('style','text','string','X coordinate =','position',[1 100 100 20],'BackgroundColor','Red'); %% Displays a box with text inside to aid with operation of the GUI. Added BackgroundColor function at the end to alter the colour of the textbox
Box17 = uicontrol('style','text','string','Y Coordinate =','position',[1 75 100 20],'BackgroundColor','green'); %% Displays a box with text inside to aid with operation of the GUI. Added BackgroundColor function at the end to alter the colour of the textbox
Box18 = uicontrol('style','text','string','Z coordinate =','position',[1 50 100 20],'BackgroundColor','blue'); %% Displays a box with text inside to aid with operation of the GUI. Added BackgroundColor function at the end to alter the colour of the textbox
Box19 = uicontrol('style','text','string','Roll =','position',[150 100 50 20],'BackgroundColor','Red'); %% Displays a box with text inside to aid with operation of the GUI. Added BackgroundColor function at the end to alter the colour of the textbox
Box20 = uicontrol('style','text','string','Pitch =','position',[150 75 50 20],'BackgroundColor','green'); %% Displays a box with text inside to aid with operation of the GUI. Added BackgroundColor function at the end to alter the colour of the textbox
Box21 = uicontrol('style','text','string','Yaw =','position',[150 50 50 20],'BackgroundColor','blue'); %% Displays a box with text inside to aid with operation of the GUI. Added BackgroundColor function at the end to alter the colour of the textbox
function pushButtonPressed (src,event) %% Causes the below event to trigger upon pressing the GUI pushbutton
    
    global box1 %%Declares the use of box1 inside this function. In particular to take the values inputted by the user.
    global box2 %%Declares the use of box2 inside this function. In particular to take the values inputted by the user.
    global box3 %%Declares the use of box3 inside this function. In particular to take the values inputted by the user.
    global box4 %%Declares the use of box4 inside this function. In particular to take the values inputted by the user.
    global box5 %%Declares the use of box5 inside this function. In particular to take the values inputted by the user.
    global box6 %%Declares the use of box6 inside this function. In particular to take the values inputted by the user.
   
    box1=get(box1,'string'); %% when puhbutton is pressed it gets the value from box1 which is defiened as a string
    box2=get(box2,'string'); %% when puhbutton is pressed it gets the value from box1 which is defiened as a string
    box3=get(box3,'string'); %% when puhbutton is pressed it gets the value from box1 which is defiened as a string
    box4=get(box4,'string'); %% when puhbutton is pressed it gets the value from box1 which is defiened as a string
    box5=get(box5,'string'); %% when puhbutton is pressed it gets the value from box1 which is defiened as a string
    box6=get(box6,'string'); %% when puhbutton is pressed it gets the value from box1 which is defiened as a string
    
    Theta1=str2num(box1); %% Converts the value inputted into box1 on the GUI from a string to a number for mathmatical manipulation
    Theta2=str2num(box2)-90; %% Converts the value inputted into box2 on the GUI from a string to a number for mathmatical manipulation
    Theta3=str2num(box3); %% Converts the value inputted into box3 on the GUI from a string to a number for mathmatical manipulation
    Theta4=str2num(box4); %% Converts the value inputted into box4 on the GUI from a string to a number for mathmatical manipulation
    Theta5=str2num(box5); %% Converts the value inputted into box5 on the GUI from a string to a number for mathmatical manipulation
    Theta6=str2num(box6); %% Converts the value inputted into box6 on the GUI from a string to a number for mathmatical manipulation
  
    %% Below the values calculated in the DH table have been declared as variables in preperation for mathmatical manipulation to calculate the end effector position
    D1 = 330; %% Here the value for moveremnt in the Z axis for joint 1 has been assigned to the varaible D1
    D2 = 0;   %% Here the value for moveremnt in the Z axis for joint 2 has been assigned to the varaible D2
    D3 = 0;   %% Here the value for moveremnt in the Z axis for joint 3 has been assigned to the varaible D3
    D4 = -340;%% Here the value for moveremnt in the Z axis for joint 4 has been assigned to the varaible D4
    D5 = 0;   %% Here the value for moveremnt in the Z axis for joint 5 has been assigned to the varaible D5
    D6 = -180;%% Here the value for moveremnt in the Z axis for joint 6 has been assigned to the varaible D6
    
    A1 = 40;  %% Here the value for moveremnt in the X axis for joint 1 has been assigned to the varaible A1
    A2 = 345; %% Here the value for moveremnt in the X axis for joint 2 has been assigned to the varaible A2
    A3 = 40;  %% Here the value for moveremnt in the X axis for joint 3 has been assigned to the varaible A3
    A4 = 0;   %% Here the value for moveremnt in the X axis for joint 4 has been assigned to the varaible A4
    A5 = 0;   %% Here the value for moveremnt in the X axis for joint 5 has been assigned to the varaible A5
    A6 = 0;   %% Here the value for moveremnt in the X axis for joint 6 has been assigned to the varaible A6
    
    NotAlpha1 = -90; %% Here the value for rotation around the X axis for joint 1 has been assigned to the varaible NotAlpha1
    NotAlpha2 = 180; %% Here the value for rotation around the X axis for joint 1 has been assigned to the varaible NotAlpha1
    NotAlpha3 = -90; %% Here the value for rotation around the X axis for joint 1 has been assigned to the varaible NotAlpha1
    NotAlpha4 = 90;  %% Here the value for rotation around the X axis for joint 1 has been assigned to the varaible NotAlpha1
    NotAlpha5 = -90; %% Here the value for rotation around the X axis for joint 1 has been assigned to the varaible NotAlpha1
    NotAlpha6 = 180; %% Here the value for rotation around the X axis for joint 1 has been assigned to the varaible NotAlpha1
    
    Base = [1 0 0 0; 0 1 0 0; 0 0 1 -330; 0 0 0 1]; %% Defines the position of the baseframe of the Yakasawa GP8 robot
    
    jointSzrotation = [cosd(Theta1) -sind(Theta1) 0 0; sind(Theta1) cosd(Theta1) 0 0; 0 0 1 0; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. Using cosd and signd negates the need to convert between degrees and radians elsehwere in the code. The matrix is assigned to a varaible.
    jointSztranslation = [1 0 0 0; 0 1 0 0; 0 0 1 D1; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. 
    jointSxrotation = [ 1 0 0 A1; 0 1 0 0; 0 0 1 0; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. 
    jointSxtranslation = [1 0 0 0; 0 cosd(NotAlpha1) -sind(NotAlpha1) 0; 0 sind(NotAlpha1) cosd(NotAlpha1) 0; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. Using cosd and signd negates the need to convert between degrees and radians elsehwere in the code. The matrix is assigne dto a variable.
    jointSresultant = jointSzrotation*jointSztranslation*jointSxtranslation*jointSxrotation; %% Multiplies the values calculated for the rotational and translation matrices for this joint to find the resultant matrix as per the DH method.Assigned to the variable jointSresultant.
    
    jointLzrotation = [cosd(Theta2) -sind(Theta2) 0 0; sind(Theta2) cosd(Theta2) 0 0; 0 0 1 0; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. Using cosd and signd negates the need to convert between degrees and radians elsehwere in the code. The matrix is assigned to a variable.
    jointLztranslation = [1 0 0 0; 0 1 0 0; 0 0 1 D2; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. 
    jointLxrotation = [ 1 0 0 A2; 0 1 0 0; 0 0 1 0; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. 
    jointLxtranslation = [1 0 0 0; 0 cosd(NotAlpha2) -sind(NotAlpha2) 0; 0 sind(NotAlpha2) cosd(NotAlpha2) 0; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. Using cosd and signd negates the need to convert between degrees and radians elsehwere in the code. The matrix is assigned to a variable.
    jointLresultant = jointLzrotation*jointLztranslation*jointLxtranslation*jointLxrotation; %% Multiplies the values calculated for the rotational and translation matrices for this joint to find the resultant matrix as per the DH method.Assigned to the variable jointLresultant.
    
    jointUzrotation = [cosd(Theta3) -sind(Theta3) 0 0; sind(Theta3) cosd(Theta3) 0 0; 0 0 1 0; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. Using cosd and signd negates the need to convert between degrees and radians elsehwere in the code. The matrix is assigned to a variable.
    jointUztranslation = [1 0 0 0; 0 1 0 0; 0 0 1 D3; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. 
    jointUxrotation = [ 1 0 0 A3; 0 1 0 0; 0 0 1 0;  0 0 0 1]; %% Constructs a four by four matrix as per the DH method. 
    jointUxtranslation = [1 0 0 0; 0 cosd(NotAlpha3) -sind(NotAlpha3) 0; 0 sind(NotAlpha3) cosd(NotAlpha3) 0; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. Using cosd and signd negates the need to convert between degrees and radians elsehwere in the code. The matrix is assigned to a variable.
    jointUresultant = jointUzrotation*jointUztranslation*jointUxrotation*jointUxtranslation; %% Multiplies the values calculated for the rotational and translation matrices for this joint to find the resultant matrix as per the DH method.Assigned to the variable jointUresultant.
    
    jointRzrotation = [cosd(Theta4) -sind(Theta4) 0 0; sind(Theta4) cosd(Theta4) 0 0; 0 0 1 0; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. Using cosd and signd negates the need to convert between degrees and radians elsehwere in the code. The matrix is assigned to a variable.
    jointRztranslation = [1 0 0 0; 0 1 0 0; 0 0 1 D4; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. 
    jointRxrotation = [ 1 0 0 A4; 0 1 0 0; 0 0 1 0; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. 
    jointRxtranslation = [1 0 0 0; 0 cosd(NotAlpha4) -sind(NotAlpha4) 0; 0 sind(NotAlpha4) cosd(NotAlpha4) 0; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. Using cosd and signd negates the need to convert between degrees and radians elsehwere in the code. The matrix is assigned to a variable.
    jointRresultant = jointRzrotation*jointRztranslation*jointRxtranslation*jointRxrotation; %% Multiplies the values calculated for the rotational and translation matrices for this joint to find the resultant matrix as per the DH method.Assigned to the variable jointRresultant.
    
    jointBzrotation = [cosd(Theta5) -sind(Theta5) 0 0; sind(Theta5) cosd(Theta5) 0 0; 0 0 1 0; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. Using cosd and signd negates the need to convert between degrees and radians elsehwere in the code. The matrix is assigned to a variable.
    jointBztranslation = [1 0 0 0; 0 1 0 0; 0 0 1 D5; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. 
    jointBxrotation = [ 1 0 0 A5; 0 1 0 0; 0 0 1 0; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. 
    jointBxtranslation = [1 0 0 0; 0 cosd(NotAlpha5) -sind(NotAlpha5) 0; 0 sind(NotAlpha5) cosd(NotAlpha5) 0; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. Using cosd and signd negates the need to convert between degrees and radians elsehwere in the code. The matrix is assigned to a variable.
    jointBresultant = jointBzrotation*jointBztranslation*jointBxtranslation*jointBxrotation; %% Multiplies the values calculated for the rotational and translation matrices for this joint to find the resultant matrix as per the DH method.Assigned to the variable jointBresultant.
    
    jointTzrotation = [cosd(Theta6) -sind(Theta6) 0 0; sind(Theta6) cosd(Theta6) 0 0; 0 0 1 0; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. Using cosd and signd negates the need to convert between degrees and radians elsehwere in the code. The matrix is assigned to a variable.
    jointTztranslation = [1 0 0 0; 0 1 0 0; 0 0 1 D6; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. 
    jointTxrotation = [ 1 0 0 A6; 0 1 0 0; 0 0 1 0; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. 
    jointTxtranslation = [1 0 0 0; 0 cosd(NotAlpha6) -sind(NotAlpha6) 0; 0 sind(NotAlpha6) cosd(NotAlpha6) 0; 0 0 0 1]; %% Constructs a four by four matrix as per the DH method. Using cosd and signd negates the need to convert between degrees and radians elsehwere in the code. The matrix is assigned to a variable.
    jointTresultant = jointTzrotation*jointTztranslation*jointTxtranslation*jointTxrotation; %% Multiplies the values calculated for the rotational and translation matrices for this joint to find the resultant matrix as per the DH method.Assigned to the variable jointTresultant.
    
    finalResultant = Base*jointSresultant*jointLresultant*jointUresultant*jointRresultant*jointBresultant*jointTresultant %% Multiplies the values calculated from each joint resultant and the base frame to give the final resultant. This is assigned to the variable finalResultant
    
    X = finalResultant(1,4); %% Assigns the X value of the end effector to variable X. The X value is pulled from row one column four of the final resultant matrix
    Y = finalResultant(2,4); %% Assigns the Y value of the end effector to variable Y. The Y value is pulled from row two column four of the final resultant matrix
    Z = finalResultant(3,4); %% Assigns the Z value of the end effector to variable Y. The Z value is pulled from row three column four of the final resultant matrix
    
    %% Used to pull the values from the final resultant matrix needed to calculate Yaw, Pitch, and Roll as per the formula
    R21 = finalResultant(2,1) %% The value in the first row and first column of the resultant matrix has been assigned to R21
    R11 = finalResultant(1,1) %% The value in the second row and first column of the resultant matrix has been assigned to R11
    R31 = finalResultant(3,1) %% The value in the third row and first column of the resultant matrix has been assigned to R31
    R32 = finalResultant(3,2) %% The value in the third row and second column of the resultant matrix has been assigned to R32
    R33 = finalResultant(3,3) %% The value in the third row and third column of the resultant matrix has been assigned to R33
    
    Yaw = atand(R21/R11); %%Formula to calculate the Yaw Value using the variables from the resultant matrix, assigned to the variable Yaw
    Pitch = atand(-R31/(sqrt(R32*R32)+(R33*R33))); %%Formula to calculate the Pitch value using the variabes from te resultant matrix, assigned to the variable Pitch
    Roll = atand(R32/R33); % Formula to calculate the Roll value using the variables from the resultant matrix, assigned to the variable Roll
    
    Box22 = uicontrol('style','text','string',X,'position',[90 100 50 20],'BackgroundColor','Red'); %% Displays the calculated X value in a red text box in the GUI. Text box only appears once the pushbutton has been pressed as it is part of the psuh button event
    Box23 = uicontrol('style','text','string',Y,'position',[90 75 50 20],'BackgroundColor','green'); %% Displays the calculated Y value in a green text box in the GUI. Text box only appears once the pushbutton has been pressed as it is part of the psuh button event
    Box24 = uicontrol('style','text','string',Z,'position',[90 50 50 20],'BackgroundColor','blue'); %% Displays the calculated Z value in a blue text box in the GUI. Text box only appears once the pushbutton has been pressed as it is part of the psuh button event
    Box22 = uicontrol('style','text','string',Roll,'position',[190 100 50 20],'BackgroundColor','Red'); %% Displays the calculated Yaw value in a red text box in the GUI. Text box only appears once the pushbutton has been pressed as it is part of the psuh button event
    Box23 = uicontrol('style','text','string',Pitch,'position',[190 75 50 20],'BackgroundColor','green'); %% Displays the calculated Pitch value in a green text box in the GUI. Text box only appears once the pushbutton has been pressed as it is part of the psuh button event
    Box24 = uicontrol('style','text','string',Yaw,'position',[190 50 50 20],'BackgroundColor','blue'); %% Displays the calculated Roll value in a blue text box in the GUI. Text box only appears once the pushbutton has been pressed as it is part of the psuh button event
    
end