#include <TimedAction.h>// Multitask
#include <Wire.h> 
#include <LiquidCrystal_I2C.h>
#include <Servo.h>
#include "LCD_control.h"
#include "ultrasoundSensor.h"
#include "motor_control.h"



 

void setup() {
  Serial.begin(9600);
  initLCD();
  motorSetup();
  printLCD("Hi! I'm Android,","Waiting...");
  eyeControl(255,255,200,255,255,200);
  handDefault();
}

  
void loop() {
  while (Serial.available() < 1) {}
  //delay(2000);
  assignVar();
  //distanceEvent.check();
  //motionEvent.check();
}
