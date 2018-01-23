#define soundSerial Serial1
#include <Servo.h>
#include "sys_define.h"

void setup(){
  Serial2.begin(9600);
  InitSound();
  InitParts();
}
void loop(){
  //light("red", "red");
  while (Serial2.available() < 1) {
  }
  assignVar();
  /*
  sensorValue = analogRead(sensorPin);
  sensorValue = map(sensorValue,0,1023,0,100); 
  Serial.println(sensorValue);
  
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
  */
  //if (sp>2450 || sp<550) dr=-dr; Serial.println(sp);
  /*
    move();
    if(sp<-100){
      light("green","green");
    }else if (sp<=0){
      light("red","red");
    }
    if(sp>100){
      light("white","white");
    }else if(sp>0){
      light("blue","blue");
    }
  if (sp>750 || sp<-750){
    dr=-dr;
  }
  delay(20);
  */
  /*
  Serial.println("Serial");
  delay(500);
  sndSerial.println("Sound");
  delay(500);
  */
}

