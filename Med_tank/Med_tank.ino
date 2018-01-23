#include "Ultrasonic.h"
#include <PololuWheelEncoders.h>
//Inputs/outputs
#define L1 3
#define L2 4
#define LPWM 5
#define RPWM 6
#define R1 7
#define R2 8
/*-----( Declare Constants and Pin Numbers )-----*/
#define  TRIG_PIN  A3
#define  ECHO_PIN  A2
/*-----( Declare objects )-----*/
Ultrasonic ultrasonic(TRIG_PIN, ECHO_PIN);
/*-----( Declare Variables )-----*/
#define LedPin  13

#define pA1 9
#define pB1 10
#define pA2 A0
#define pB2 A1

PololuWheelEncoders enc;
float cmMsec, inMsec;
byte Lspeed1=255;
byte Rspeed2=255;
int danger_near;
int danger_far;
int range;
int rotatePos;
boolean attempt=false;
char a,b;

//--------------------------------------------------------------------------
void setup(){   
  // set motor pins as output and LOW so the motors are braked
  Serial.begin(38400);
  pinMode(L1,OUTPUT);
  pinMode(L2, OUTPUT);
  pinMode(LPWM, OUTPUT);
  pinMode(RPWM, OUTPUT);
  pinMode(R1, OUTPUT);
  pinMode(R2, OUTPUT);  
  danger_far=20;
  danger_near=10;
  pinMode(LedPin, OUTPUT);       
  digitalWrite(LedPin, LOW);
  motorSpeed(255,255);
  enc.init( pA1, pB1, pA2, pB2 );
}
void testEncoder(){
  int encR,encL;
  encR = enc.getCountsM1();
  encL = enc.getCountsM2();
  Serial.print(encR);
  Serial.print("_");
  Serial.println(encL);
}
void loop(){
  //testEncoder();
  //scan();
  autonomous();
  //forward();
  //rightSlide();
  //fireSonar();
  //delay(1000);
}
float scan(){
  
  long microsec = ultrasonic.timing();

  cmMsec = ultrasonic.convert(microsec, Ultrasonic::CM);
  inMsec = ultrasonic.convert(microsec, Ultrasonic::IN);

  delay(500);
  //
}

void autonomous(){
  long microsec = ultrasonic.timing();
  range = ultrasonic.convert(microsec, Ultrasonic::CM);
  if(range<5){
    if(!attempt){
      reverse();
      delay(500);
      attempt=true;
    }
    allStop();
    delay(1000);
  }else if(range<10){
    attempt=false;
    if(random(2)==1){
      leftSpin();
    }else{
      rightSpin();
    }
    delay(500);
  }else{
    attempt=false;
    forward();
  }
}

void motorSpeed(int thisLeft,int thisRight){
  analogWrite(LPWM,thisLeft);
  analogWrite(RPWM,thisRight);
}

void fireSonar(){
  long microsec = ultrasonic.timing();

  
  range = ultrasonic.convert(microsec, Ultrasonic::CM);
  //range=analogRead(A6);
  //Serial.println(range);
}

void forward(){
  digitalWrite(L1,HIGH);
  digitalWrite(L2,LOW);
  digitalWrite(R1,HIGH);
  digitalWrite(R2,LOW);
}

void reverse(){
  digitalWrite(L1,LOW);
  digitalWrite(L2,HIGH);
  digitalWrite(R1,LOW);
  digitalWrite(R2,HIGH);  
}

void leftSlide(){
  digitalWrite(L1,LOW);
  digitalWrite(L2,LOW);
  digitalWrite(R1,HIGH);
  digitalWrite(R2,LOW);  
}

void rightSlide(){
  digitalWrite(L1,HIGH);
  digitalWrite(L2,LOW);
  digitalWrite(R1,LOW);
  digitalWrite(R2,LOW);  
}

void leftSpin(){
  digitalWrite(L1,LOW);
  digitalWrite(L2,HIGH);
  digitalWrite(R1,HIGH);
  digitalWrite(R2,LOW);    
}

void rightSpin(){
  digitalWrite(L1,HIGH);
  digitalWrite(L2,LOW);
  digitalWrite(R1,LOW);
  digitalWrite(R2,HIGH);    
}

void allStop(){
  digitalWrite(L1,LOW);
  digitalWrite(L2,LOW);
  digitalWrite(R1,LOW);
  digitalWrite(R2,LOW);  
} 
