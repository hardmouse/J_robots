

int pin1_L=2;
int pin2_L=3;
int speedpin_L=4;

int pin1_R=5;
int pin2_R=6;
int speedpin_R=7;


Servo shoulder_L;
Servo shoulder_R;
Servo arm_L;
Servo arm_R;


void motorSetup(){
  pinMode(pin1_L,OUTPUT);
  pinMode(pin2_L,OUTPUT);
  pinMode(speedpin_L,OUTPUT);
  pinMode(pin1_R,OUTPUT);
  pinMode(pin2_R,OUTPUT);
  pinMode(speedpin_R,OUTPUT);
  /*
  pinMode(eyeR_R,OUTPUT);
  pinMode(eyeR_G,OUTPUT);
  pinMode(eyeR_B,OUTPUT);
  pinMode(eyeL_R,OUTPUT);
  pinMode(eyeL_G,OUTPUT);
  pinMode(eyeL_B,OUTPUT);
  */
  shoulder_L.attach(15);
  shoulder_R.attach(39);
  arm_L.attach(14);
  arm_R.attach(38);
  
}
void handMotion(int s_L, int s_R, int a_L, int a_R){
  shoulder_L.write(s_L);
  shoulder_R.write(s_R);
  arm_L.write(a_L);
  arm_R.write(a_R);
}
void handDefault(){
  shoulder_L.write(30);
  shoulder_R.write(150);
  arm_L.write(0);
  arm_R.write(180);
}

void stopLeft(){
  digitalWrite(pin1_L,HIGH);
  digitalWrite(pin2_L,HIGH);
}
void stopRight(){
  digitalWrite(pin1_R,HIGH);
  digitalWrite(pin2_R,HIGH);
}
void stopMove(){ // DC motor stop rotating
  stopLeft();
  stopRight();
}
void motorMovement(int _L,int _R){
    if(_R < 10){
      digitalWrite(pin1_L,LOW);
      digitalWrite(pin2_L,HIGH);
    }else if(_R > 10){
      digitalWrite(pin1_L,HIGH);
      digitalWrite(pin2_L,LOW);
    }else{
      stopLeft();
    }
    analogWrite(speedpin_L,abs(_L));
    if(_L < 10){
      digitalWrite(pin1_R,HIGH);
      digitalWrite(pin2_R,LOW);
    }else if(_L > 10){
      digitalWrite(pin1_R,LOW);
      digitalWrite(pin2_R,HIGH);
    }else{
      stopRight();
    }
    analogWrite(speedpin_R,abs(_R));
}
/*
void motionExe(){
  //input a value to set the speed 
  analogWrite(speedpin_L,100);
  analogWrite(speedpin_R,100);

}
*/

