//#include <Servo.h>
#include <MegaServo.h>
#include "servo_control.h"
#include "Ultrasonic.h";

Ultrasonic ultrasonic(38,39);
//__________________________________________________________________________________________
/*
Servo F_R_H;
Servo F_R_M;
Servo F_R_L;
Servo F_L_H;
Servo F_L_M;
Servo F_L_L;
Servo R_R_H;
Servo R_R_M;
Servo R_R_L;
Servo R_L_H;
Servo R_L_M;
Servo R_L_L;
*/

MegaServo F_R_H;
MegaServo F_R_M;
MegaServo F_R_L;
MegaServo F_L_H;
MegaServo F_L_M;
MegaServo F_L_L;
MegaServo R_R_H;
MegaServo R_R_M;
MegaServo R_R_L;
MegaServo R_L_H;
MegaServo R_L_M;
MegaServo R_L_L;

int L_R_C = 0;
int L_L_C = 10;
int M_R_C = 100;
int M_L_C = 100;
int fadeAmount1 = 5;
int fadeAmount2 = 5;
int moveSpeed = 500;
int moveAng = 20;

int standard = 95;
int differce = 40;

int lowerAng = 20;
int middlAng = 40;
int highrAng = 40;

int microAdj = 10;

int currentDir = 0;

int laserPin =  14;

int ledLeft1 =  20;
int ledLeft2 =  21;
int ledLeft3 =  19;
int ledRight1 =  43;
int ledRight2 =  44;
int ledRight3 =  42;

int motionSensorPin = 35;
int motionValue = 0;

char notes1[] = "cdefgab "; // a space represents a rest
int beats1[] = { 
  1, 1, 1, 1, 1, 1, 3};
int length1 = 7; // the number of notes
char notes2[] = "cdefgab "; // a space represents a rest
int beats2[] = { 
  1, 1, 1, 1, 1, 1, 3};
int length2 = 7; // the number of notes
char notes3[] = "ccccc "; // a space represents a rest
int beats3[] = { 
  1, 1, 1, 1, 1};
int length3 = 5; // the number of notes
char notes4[] = "fffff "; // a space represents a rest
int beats4[] = { 
  1, 1, 1, 1, 1};
int length4 = 5; // the number of notes
char notes5[] = "CCCCC "; // a space represents a rest
int beats5[] = { 
  1, 1, 1, 1, 1};
int length5 = 6; // the number of notes
int tempo = 50;

void eyeControl(int R_R, int R_G, int R_B, int L_R, int L_G, int L_B){
  analogWrite(ledLeft1, R_R);
  analogWrite(ledLeft2, R_G);
  analogWrite(ledLeft3, R_B);
  analogWrite(ledRight1, L_R);
  analogWrite(ledRight2, L_G);
  analogWrite(ledRight3, L_B);
}
void initServo(){
  F_R_H.attach(2);
  F_R_M.attach(6);
  F_R_L.attach(10);
  F_L_H.attach(3);
  F_L_M.attach(7);
  F_L_L.attach(11);
  R_R_H.attach(4);
  R_R_M.attach(8);
  R_R_L.attach(12);
  R_L_H.attach(5);
  R_L_M.attach(9);
  R_L_L.attach(13);
}

void moveMe(){
  while(currentDir==1){
    //LOWER JOINT - 425
    if(L_R_C==150){
      L_R_C=140;
    }
    else{
      L_R_C=150;
    }
    if(L_L_C==50){
      L_L_C=40;
    }
    else{
      L_L_C=50;
    }
    //MIDDLE JOINT - 645
    if(M_R_C==170){
      M_R_C=150;
    }
    else{
      M_R_C=170;
    }
    if(M_L_C==20){
      M_L_C=40;
    }
    else{
      M_L_C=20;
    }
    F_R_L.write(L_R_C);
    F_R_M.write(M_R_C);
    F_R_H.write(M_R_C);
    //delay(moveSpeed);
    F_L_L.write(L_L_C);
    F_L_M.write(M_L_C);
    F_L_H.write(M_L_C);
    //delay(moveSpeed);
    R_L_L.write(L_R_C);
    R_L_M.write(M_R_C);
    R_L_H.write(M_R_C);
    //delay(moveSpeed);
    R_R_L.write(L_L_C);
    R_R_M.write(M_L_C);
    R_R_H.write(M_L_C);
    //delay(moveSpeed);
  }
}

void stopMe(){
  F_R_L.write(standard+lowerAng);
  F_R_M.write(standard+middlAng);
  F_R_H.write(standard+highrAng);
  
  F_L_L.write(standard-lowerAng);
  F_L_M.write(standard-middlAng);
  F_L_H.write(standard-highrAng);
 
  R_R_L.write(standard-lowerAng);
  R_R_M.write(standard-middlAng);
  R_R_H.write(standard-highrAng-5);
 
  R_L_L.write(standard+lowerAng);
  R_L_M.write(standard+middlAng);
  R_L_H.write(standard+highrAng);
 
  delay(moveSpeed);
}
void moveForward(){
  //1
  F_R_L.write(standard+lowerAng-30);
  F_R_M.write(standard+middlAng);
  F_R_H.write(standard+highrAng);
  
  F_L_L.write(standard-lowerAng-30);
  F_L_M.write(standard-middlAng);
  F_L_H.write(standard-highrAng);
  
  R_R_L.write(standard-lowerAng+30);
  R_R_M.write(standard-middlAng);
  R_R_H.write(standard-highrAng);
  
  R_L_L.write(standard+lowerAng+30);
  R_L_M.write(standard+middlAng);
  R_L_H.write(standard+highrAng);
  delay(moveSpeed);
  
  //2
  F_R_L.write(standard+lowerAng+30);
  F_R_M.write(standard+middlAng+30);
  F_R_H.write(standard+highrAng+30);
  
  F_L_L.write(standard-lowerAng+30);
  F_L_M.write(standard-middlAng);
  F_L_H.write(standard-highrAng);
  
  R_R_L.write(standard-lowerAng-30);
  R_R_M.write(standard-middlAng);
  R_R_H.write(standard-highrAng);
  
  R_L_L.write(standard+lowerAng-30);
  R_L_M.write(standard+middlAng+30);
  R_L_H.write(standard+highrAng+30);
  delay(moveSpeed);
  
  // 3
  F_R_L.write(standard+lowerAng+30);
  F_R_M.write(standard+middlAng);
  F_R_H.write(standard+highrAng);
 
  F_L_L.write(standard-lowerAng+30);
  F_L_M.write(standard-middlAng);
  F_L_H.write(standard-highrAng);
  
  R_R_L.write(standard-lowerAng-30);
  R_R_M.write(standard-middlAng);
  R_R_H.write(standard-highrAng);
  
  R_L_L.write(standard+lowerAng-30);
  R_L_M.write(standard+middlAng);
  R_L_H.write(standard+highrAng);
  delay(moveSpeed);
  
  // 4
  F_R_L.write(standard+lowerAng-30);
  F_R_M.write(standard+middlAng);
  F_R_H.write(standard+highrAng);
 
  F_L_L.write(standard-lowerAng-30);
  F_L_M.write(standard-middlAng-30);
  F_L_H.write(standard-highrAng-30);
  
  R_R_L.write(standard-lowerAng+30);
  R_R_M.write(standard-middlAng-30);
  R_R_H.write(standard-highrAng-30);
  
  R_L_L.write(standard+lowerAng+30);
  R_L_M.write(standard+middlAng);
  R_L_H.write(standard+highrAng);
  delay(moveSpeed);
}

void moveBackward(){
  //1
  F_R_L.write(standard+lowerAng-30);
  F_R_M.write(standard+middlAng);
  F_R_H.write(standard+highrAng);
  
  F_L_L.write(standard-lowerAng-30);
  F_L_M.write(standard-middlAng-30);
  F_L_H.write(standard-highrAng-30);
 
  R_R_L.write(standard-lowerAng+30);
  R_R_M.write(standard-middlAng-30);
  R_R_H.write(standard-highrAng-30);
  
  R_L_L.write(standard+lowerAng+30);
  R_L_M.write(standard+middlAng);
  R_L_H.write(standard+highrAng);
  delay(moveSpeed);
  
  //2
  F_R_L.write(standard+lowerAng+30);
  F_R_M.write(standard+middlAng);
  F_R_H.write(standard+highrAng);
  
  F_L_L.write(standard-lowerAng+30);
  F_L_M.write(standard-middlAng);
  F_L_H.write(standard-highrAng);
  
  R_R_L.write(standard-lowerAng-30);
  R_R_M.write(standard-middlAng);
  R_R_H.write(standard-highrAng);
 
  R_L_L.write(standard+lowerAng-30);
  R_L_M.write(standard+middlAng);
  R_L_H.write(standard+highrAng);
  delay(moveSpeed);
  
  // 3
  F_R_L.write(standard+lowerAng+30);
  F_R_M.write(standard+middlAng+30);
  F_R_H.write(standard+highrAng+30);
  
  F_L_L.write(standard-lowerAng+30);
  F_L_M.write(standard-middlAng);
  F_L_H.write(standard-highrAng);
  
  R_R_L.write(standard-lowerAng-30);
  R_R_M.write(standard-middlAng);
  R_R_H.write(standard-highrAng);
  
  R_L_L.write(standard+lowerAng-30);
  R_L_M.write(standard+middlAng+30);
  R_L_H.write(standard+highrAng+30);
  delay(moveSpeed);
  
  // 4
  F_R_L.write(standard+lowerAng-30);
  F_R_M.write(standard+middlAng);
  F_R_H.write(standard+highrAng);
 
  F_L_L.write(standard-lowerAng-30);
  F_L_M.write(standard-middlAng);
  F_L_H.write(standard-highrAng);
 
  R_R_L.write(standard-lowerAng+30);
  R_R_M.write(standard-middlAng);
  R_R_H.write(standard-highrAng);
 
  R_L_L.write(standard+lowerAng+30);
  R_L_M.write(standard+middlAng);
  R_L_H.write(standard+highrAng);
  delay(moveSpeed);
}

void moveLeft(){
  //1
  F_L_L.write(standard-lowerAng-35);
  F_L_M.write(standard-middlAng-30);
  F_L_H.write(standard-highrAng-30);
  
  F_R_L.write(standard+lowerAng-35);
  F_R_M.write(standard+middlAng);
  F_R_H.write(standard+highrAng);
  
  R_R_L.write(standard-lowerAng-35);
  R_R_M.write(standard-middlAng-30);
  R_R_H.write(standard-highrAng-35);
  
  R_L_L.write(standard+lowerAng-35);
  R_L_M.write(standard+middlAng);
  R_L_H.write(standard+highrAng);
  delay(moveSpeed);

  //2
  F_L_L.write(standard-lowerAng+35);
  F_L_M.write(standard-middlAng-30);
  F_L_H.write(standard-highrAng-30);
  
  F_R_L.write(standard+lowerAng+35);
  F_R_M.write(standard+middlAng);
  F_R_H.write(standard+highrAng);
  
  R_R_L.write(standard-lowerAng+35);
  R_R_M.write(standard-middlAng-30);
  R_R_H.write(standard-highrAng-35);
  
  R_L_L.write(standard+lowerAng+35);
  R_L_M.write(standard+middlAng);
  R_L_H.write(standard+highrAng);
  delay(moveSpeed);

  //3
  F_R_L.write(standard+lowerAng+35);
  F_R_M.write(standard+middlAng+30);
  F_R_H.write(standard+highrAng+30);
  
  F_L_L.write(standard-lowerAng+35);
  F_L_M.write(standard-middlAng);
  F_L_H.write(standard-highrAng);
  
  R_R_L.write(standard-lowerAng+35);
  R_R_M.write(standard-middlAng);
  R_R_H.write(standard-highrAng-5);
  
  R_L_L.write(standard+lowerAng+35);
  R_L_M.write(standard+middlAng+30);
  R_L_H.write(standard+highrAng+30);
  delay(moveSpeed);

  //4
  F_R_L.write(standard+lowerAng-35);
  F_R_M.write(standard+middlAng+30);
  F_R_H.write(standard+highrAng+30);
  
  F_L_L.write(standard-lowerAng-35);
  F_L_M.write(standard-middlAng);
  F_L_H.write(standard-highrAng);
  
  R_R_L.write(standard-lowerAng-35);
  R_R_M.write(standard-middlAng);
  R_R_H.write(standard-highrAng-5);
  
  R_L_L.write(standard+lowerAng-35);
  R_L_M.write(standard+middlAng+30);
  R_L_H.write(standard+highrAng+30);
  delay(moveSpeed);
}

void moveRight(){
  //1
  F_R_L.write(standard+lowerAng-35);
  F_R_M.write(standard+middlAng+30);
  F_R_H.write(standard+highrAng+30);
  
  F_L_L.write(standard-lowerAng-35);
  F_L_M.write(standard-middlAng);
  F_L_H.write(standard-highrAng);
  
  R_R_L.write(standard-lowerAng-35);
  R_R_M.write(standard-middlAng);
  R_R_H.write(standard-highrAng-5);
  
  R_L_L.write(standard+lowerAng-35);
  R_L_M.write(standard+middlAng+30);
  R_L_H.write(standard+highrAng+30);
  delay(moveSpeed);

  //2
  F_R_L.write(standard+lowerAng+35);
  F_R_M.write(standard+middlAng+30);
  F_R_H.write(standard+highrAng+30);
  
  F_L_L.write(standard-lowerAng+35);
  F_L_M.write(standard-middlAng);
  F_L_H.write(standard-highrAng);
  
  R_R_L.write(standard-lowerAng+35);
  R_R_M.write(standard-middlAng);
  R_R_H.write(standard-highrAng-5);
  
  R_L_L.write(standard+lowerAng+35);
  R_L_M.write(standard+middlAng+30);
  R_L_H.write(standard+highrAng+30);
  delay(moveSpeed);
  
  //3
  F_L_L.write(standard-lowerAng+35);
  F_L_M.write(standard-middlAng-30);
  F_L_H.write(standard-highrAng-30);
  
  F_R_L.write(standard+lowerAng+35);
  F_R_M.write(standard+middlAng);
  F_R_H.write(standard+highrAng);
  
  R_R_L.write(standard-lowerAng+35);
  R_R_M.write(standard-middlAng-30);
  R_R_H.write(standard-highrAng-35);
  
  R_L_L.write(standard+lowerAng+35);
  R_L_M.write(standard+middlAng);
  R_L_H.write(standard+highrAng);
  delay(moveSpeed);

  //4
  F_L_L.write(standard-lowerAng-35);
  F_L_M.write(standard-middlAng-30);
  F_L_H.write(standard-highrAng-30);
  
  F_R_L.write(standard+lowerAng-35);
  F_R_M.write(standard+middlAng);
  F_R_H.write(standard+highrAng);
  
  R_R_L.write(standard-lowerAng-35);
  R_R_M.write(standard-middlAng-30);
  R_R_H.write(standard-highrAng-35);
  
  R_L_L.write(standard+lowerAng-35);
  R_L_M.write(standard+middlAng);
  R_L_H.write(standard+highrAng);
  delay(moveSpeed);
}

//_____________________________________________________________________
int sensorPin = A2;
//int ledPin = A6;
int BuzzerPin = A8;
int sensorValue = 0;
int indLed = 25;
int rangeLength = 0;

void setup(){
  Serial.begin(9600);
  delay(1000);
  pinMode(motionSensorPin, INPUT);
  pinMode(BuzzerPin, OUTPUT);
  pinMode(laserPin, OUTPUT);
  pinMode(indLed, OUTPUT);
  initServo();
  stopMe();
  digitalWrite(indLed,HIGH);
}

void loop(){
  /*
  moveForward();
  moveForward();
  moveForward();
  moveForward();
  moveForward();
  moveForward();
  moveForward();
  moveForward();
  moveBackward();
  moveBackward();
  moveBackward();
  moveBackward();
  moveBackward();
  moveBackward();
  moveBackward();
  moveBackward();
  
  moveLeft();
  moveLeft();
  moveLeft();
  moveLeft();
  moveLeft();
  moveLeft();
  moveRight();
  moveRight();
  moveRight();
  moveRight();
  moveRight();
  moveRight();
  */
  if(Serial.available() > 0) {
    assignVar();
  }
  /*
  eyeControl(255,255,255,255,255,255);
  delay(500);
  eyeControl(0,255,255,0,255,255);
  delay(500);
  eyeControl(255,0,255,255,0,255);
  delay(500);
  eyeControl(255,255,0,255,255,0);
  delay(500);
  eyeControl(0,0,255,0,0,255);
  delay(500);
  eyeControl(255,255,0,255,0,0);
  delay(500);
  digitalWrite(indLed,LOW);
  digitalWrite(laserPin,HIGH);
  delay(2000);
  digitalWrite(laserPin,LOW);
  delay(500);
  */
}
