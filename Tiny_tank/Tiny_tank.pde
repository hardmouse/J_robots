#include <Servo.h> 
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
#define  TRIG_PIN  2
#define  ECHO_PIN  11
/*-----( Declare objects )-----*/
Ultrasonic OurModule(TRIG_PIN, ECHO_PIN);
/*-----( Declare Variables )-----*/
#define LedPin  13

#define pA1 9
#define pB1 10
#define pA2 A0
#define pB2 A1

PololuWheelEncoders enc;

byte Lspeed1=255;
byte Rspeed2=255;
int danger;
int range;
int rotatePos;
Servo rotateServo;  //180= look right   0=look left

char a,b;

//-------------------------------------------------------------------------- 
void setup() {  
   
  // set motor pins as output and LOW so the motors are braked 
  Serial.begin(38400);
  pinMode(L1,OUTPUT);
  pinMode(L2, OUTPUT);
  pinMode(LPWM, OUTPUT);
  pinMode(RPWM, OUTPUT);
  pinMode(R1, OUTPUT);
  pinMode(R2, OUTPUT);  
  danger=30; 
  rotateServo.attach(12);
  rotateServo.write(90); //90 degrees, looking straight ahead 
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
  rotateServo.write(abs(encL%180));
}
void loop()
{
  //testEncoder();
  //scan();
  autonomous();
  //forward();
  //rightSlide();
  //fireSonar();
  //delay(1000);
}
float scan() {

  Serial.print(OurModule.Ranging(CM));
  Serial.print("cm   ");
  delay(100);  //Let echos from room dissipate
  Serial.print(OurModule.Ranging(INC));
  Serial.println("inches");

  delay(500);
  //
}

void autonomous()
{
  for (rotatePos=20;rotatePos<160;rotatePos+=10)
  {
    rotateServo.write(rotatePos);
    delay(50);
    fireSonar();
    checkRange();
  }
  for (rotatePos=160;rotatePos>20;rotatePos-=10)
  {
    rotateServo.write(rotatePos);
    delay(50);
    fireSonar();    
    checkRange();
  }   
}



void checkRange()
{
  if (range>danger)
  {
    if (rotatePos<45)
    {
      leftSlide();
    }
    if (rotatePos>44 && rotatePos<91)
    {
      leftSpin();
    }
    if (rotatePos>90 && rotatePos<135)
    {
      rightSpin();
    }
    if (rotatePos>134)
    {
      rightSlide();
    }   
  }else{
    forward(); 
  }
  fireSonar();   
  if (range>danger)
  { 
  checkRange();  
  }
}
 

void motorSpeed(int thisLeft,int thisRight)
{
  analogWrite(LPWM,thisLeft);
  analogWrite(RPWM,thisRight);
}

void fireSonar()
{
  range = OurModule.Ranging(CM);
  //range=analogRead(A6);
  //Serial.println(range);
}

void forward()
{
  digitalWrite(L1,HIGH);
  digitalWrite(L2,LOW);
  digitalWrite(R1,HIGH);
  digitalWrite(R2,LOW);
}

void reverse()
{
  digitalWrite(L1,LOW);
  digitalWrite(L2,HIGH);
  digitalWrite(R1,LOW);
  digitalWrite(R2,HIGH);  
}

void leftSlide()
{
  digitalWrite(L1,LOW);
  digitalWrite(L2,LOW);
  digitalWrite(R1,HIGH);
  digitalWrite(R2,LOW);  
}

void rightSlide()
{
  digitalWrite(L1,HIGH);
  digitalWrite(L2,LOW);
  digitalWrite(R1,LOW);
  digitalWrite(R2,LOW);  
}

void leftSpin()
{
  digitalWrite(L1,LOW);
  digitalWrite(L2,HIGH);
  digitalWrite(R1,HIGH);
  digitalWrite(R2,LOW);    
}

void rightSpin()
{
  digitalWrite(L1,HIGH);
  digitalWrite(L2,LOW);
  digitalWrite(R1,LOW);
  digitalWrite(R2,HIGH);    
}

void allStop()
{
  digitalWrite(L1,LOW);
  digitalWrite(L2,LOW);
  digitalWrite(R1,LOW);
  digitalWrite(R2,LOW);  
}
