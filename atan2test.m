clc
r31 =  1;
r21 = -0.3356;
r11 = -0.9377;
r12 = 0.3174;
r13 = 0.1415;
r32 = -0.6125;
r33 = 0.7832;


if (r31 ==1) ;
    roll = 0
    pitch = pi/2;
    pitch = rad2deg (pitch)
    yaw = roll + atan2d(r12,r13)
    
else
    if (r31 ==-1);
        roll = 0
        pitch = -pi/2;
      pitch = rad2deg (pitch)
        yaw = -roll + atan2d(-r12,-r13)
    else
    
    pitch = -asind(r31)
    yaw = atan2d((r21/cos(pitch)),(r11/cos(pitch)))
    roll = atan2d((r32/cos(pitch)),(r33/cos(pitch))) 
    end
end
    
    
    
  
       

    
