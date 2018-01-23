#include <Servo.h> 
#include <NewPing.h>

#include "steps.h"

int rightTime=0;
void setup(){
  Serial.begin(9600);
  int ss = 5;
  for(int i=0; i<8; i++){
    myservo[i].attach(ss);
    ss++;
    delay(10);
    myservo[i].write(initPos[i]);
    currentPos[i]=initPos[i];
    delay(10);
  }
} 

void goForward(){
  servPos4(0, initPos[0],6, initPos[6]+60,3, initPos[3]-30,5, initPos[5]-30);
  servPos4(1, initPos[1]+30,7, initPos[7]+30,2, initPos[2]-60,4, initPos[4]);
  servPos4(3, initPos[3],5, initPos[5],0, initPos[0]+60,6, initPos[6]);
  servPos4(2, initPos[2],4, initPos[4]-60,1, initPos[1],7, initPos[7]);
}
void goBackward(){
  servPos4(2, initPos[2],4, initPos[4]-60,1, initPos[1],7, initPos[7]);
  servPos4(3, initPos[3],5, initPos[5],0, initPos[0]+60,6, initPos[6]);
  servPos4(1, initPos[1]+30,7, initPos[7]+30,2, initPos[2]-60,4, initPos[4]);
  servPos4(0, initPos[0],6, initPos[6]+60,3, initPos[3]-30,5, initPos[5]-30);
}

void turnLeft(){
  servPos4(1, initPos[1]+myStep,7, initPos[7]+myStep,3, initPos[3],5, initPos[5]);
  servPos4(0, initPos[0]-myStep,6, initPos[6]-myStep,2, initPos[2],4, initPos[4]);
  servPos4(1, initPos[1],7, initPos[7],3, initPos[3]-myStep,5, initPos[5]-myStep);
  servPos4(0, initPos[0],6, initPos[6],2, initPos[2]-myStep,4, initPos[4]-myStep);
}

void turnRight(){
  servPos4(1, initPos[1]+myStep,7, initPos[7]+myStep,3, initPos[3],5, initPos[5]);
  servPos4(0, initPos[0]+myStep,6, initPos[6]+myStep,2, initPos[2],4, initPos[4]);
  servPos4(1, initPos[1],7, initPos[7],3, initPos[3]-myStep,5, initPos[5]-myStep);
  servPos4(0, initPos[0],6, initPos[6],2, initPos[2]+myStep,4, initPos[4]+myStep);
}
void standby(){
  servPos4(1, initPos[1],3, initPos[3],5, initPos[5],7, initPos[7]);
  servPos4(0, initPos[0],2, initPos[2],4, initPos[4],6, initPos[6]);
}
void loop() {
  if(getPing()<50){
    mSpeed=5;
  }else if(getPing()<90){
    mSpeed=4;
  }else if(getPing()<120){
    mSpeed=3;
  }else if(getPing()<150){
    mSpeed=3;
  }else if(getPing()<180){
    mSpeed=2;
  }
  if(getPing()<180){
    if(getPing()<12){
      standby();
    }else if(getPing()<20){
      goBackward();
      goBackward();
      turnLeft();
      turnLeft();
      turnLeft();
    }else{
      goForward();
    }
  }else{
    standby();
  }
} 
