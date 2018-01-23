#include <Servo.h> 

int dir1PinA = 13;
int dir2PinA = 12;
int speedPinA = 10;

int dir1PinB = 11;
int dir2PinB = 8;
int speedPinB = 9;
int headLight = 6;
int indLED = 7;
Servo turret;
void setup(void){
  pinMode(indLED, OUTPUT);
  pinMode(headLight, OUTPUT);
  Serial.begin(9600);
  pinMode(dir1PinA, OUTPUT);
  pinMode(dir2PinA, OUTPUT);
  pinMode(speedPinA, OUTPUT);
  pinMode(dir1PinB, OUTPUT);
  pinMode(dir2PinB, OUTPUT);
  pinMode(speedPinB, OUTPUT);
  
  //turret.attach(7);
}
void loop(void){
  while (Serial.available() < 1) {
  } // Wait until a character is received
  //char val = Serial.read();
  assignVar();
}
