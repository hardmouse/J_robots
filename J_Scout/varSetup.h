int actSpeed = 800;
int dePos_L[] = {1450,1550,1500,1500,1500,1500,2400,700};
int dePos_R[] = {1450,1540,1450,1500,1500,1450,600,2300};
int Servo_L[] = {21,22,23,24,25,26,28,29};
int Servo_R[] = {5,6,7,8,9,10,12,13};

enum dir { straight,left,right,back };

SSC32 myssc = SSC32();
