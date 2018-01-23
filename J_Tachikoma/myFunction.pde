void move(){
  
  frontLeftHip_val=1500+microAng-sp;
  frontLeftWheel_val=1500-sp;
  
  frontRightHip_val=1500-microAng-sp;
  frontRightWheel_val=1500+sp;
  
  rearLeftHip_val=1500-microAng-sp;
  rearLeftWheel_val=1500-sp;
  
  rearRightHip_val=1500+microAng-sp;
  rearRightWheel_val=1500+sp;

  frontLeftHip.writeMicroseconds(frontLeftHip_val);
  frontLeftWheel.writeMicroseconds(frontLeftWheel_val);
  
  frontRightHip.writeMicroseconds(frontRightHip_val);
  frontRightWheel.writeMicroseconds(frontRightWheel_val);
  
  rearLeftHip.writeMicroseconds(rearLeftHip_val);
  rearLeftWheel.writeMicroseconds(rearLeftWheel_val);
  
  rearRightHip.writeMicroseconds(rearRightHip_val);
  rearRightWheel.writeMicroseconds(rearRightWheel_val);

  claw.writeMicroseconds(claw_val);
  ass.writeMicroseconds(ass_val);
  sp+=dr;
}
void light(char* R, char* L){
  if(R=="red"){
    digitalWrite(lightRight_R, LOW);
    digitalWrite(lightRight_G, HIGH);
    digitalWrite(lightRight_B, HIGH);
  }else if(R=="green"){
    digitalWrite(lightRight_R, HIGH);
    digitalWrite(lightRight_G, LOW);
    digitalWrite(lightRight_B, HIGH);
  }else if(R=="blue"){
    digitalWrite(lightRight_R, HIGH);
    digitalWrite(lightRight_G, HIGH);
    digitalWrite(lightRight_B, LOW);
  }else if(R=="white"){
    digitalWrite(lightRight_R, LOW);
    digitalWrite(lightRight_G, LOW);
    digitalWrite(lightRight_B, LOW);
  }
    
  if(L=="red"){
    digitalWrite(lightLeft_R, LOW);
    digitalWrite(lightLeft_G, HIGH);
    digitalWrite(lightLeft_B, HIGH);
  }else if(L=="green"){
    digitalWrite(lightLeft_R, HIGH);
    digitalWrite(lightLeft_G, LOW);
    digitalWrite(lightLeft_B, HIGH);
  }else if(L=="blue"){
    digitalWrite(lightLeft_R, HIGH);
    digitalWrite(lightLeft_G, HIGH);
    digitalWrite(lightLeft_B, LOW);
  }else if(L=="white"){
    digitalWrite(lightLeft_R, LOW);
    digitalWrite(lightLeft_G, LOW);
    digitalWrite(lightLeft_B, LOW);
  }
}
void InitSound(void){
  //Speech Arduino
  soundSerial.begin(9600);
  light("white", "red");
  delay(500);
}
void InitParts(void){
  light("red", "white");
  //parts setup
  pinMode(laser, OUTPUT);
  pinMode(cannon, OUTPUT);
  claw.attach(28);  
  ass.attach(29);
  
  //Light Setup
  pinMode(lightRight_R, OUTPUT);
  pinMode(lightRight_G, OUTPUT);
  pinMode(lightRight_B, OUTPUT);
  pinMode(lightLeft_R, OUTPUT);
  pinMode(lightLeft_G, OUTPUT);
  pinMode(lightLeft_B, OUTPUT);
  //Leg Servos
  frontLeftHip.attach(35);
  frontLeftWheel.attach(34);
  
  frontRightHip.attach(37);
  frontRightWheel.attach(36);
  
  rearRightHip.attach(38);
  rearRightWheel.attach(39);
  
  rearLeftHip.attach(40);
  rearLeftWheel.attach(41);
  
  //Sensor Setting
  
  delay(500);
}
