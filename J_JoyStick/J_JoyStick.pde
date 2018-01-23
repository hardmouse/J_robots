#include <Wire.h> 
#include <LiquidCrystal_I2C.h>
#include <TimedAction.h>// Multitask
#include "beep.h"
#include "easyTransfer.h"
#include "eventHandler.h"


void setup(){
  lcd.init();
  lcd.backlight();
  Serial.begin(9600);
  
  lcd.print("All set!");
  delay(1000);
  beepMulti.check();
  String tempStr = "Mech:";
  printLCD(currentFunc[currentFunPik],tempStr+devices[currentDevNum]);
  initPin();
}
void loop(){
   //ET_EventDispatch();
  defaultEventDispatch();
  timedKeyEvent.check();
  timedJoystickEvent.check();
  delay(10);
}






