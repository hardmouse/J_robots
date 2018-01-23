#include <Servo.h> 

Servo speedPinLeft;

Servo speedPinRight;

int indLED = 7;
int leftLED = 12;
int rightLED = 11;
int backLED = 10;

void setup(void){
  Serial.begin(9600);
  pinMode(indLED, OUTPUT);
  pinMode(backLED, OUTPUT);
  pinMode(rightLED, OUTPUT);
  pinMode(leftLED, OUTPUT);
  speedPinLeft.attach(5);
  speedPinRight.attach(6);
}
void loop(void){
  /*
  // fade in from min to max in increments of 5 points:
  for(int fadeValue = 0 ; fadeValue <= 255; fadeValue +=5) { 
    speedPinLeft.write(fadeValue);
    speedPinRight.write(fadeValue);
  Serial.println(fadeValue);
    delay(700);                            
  } 

  // fade out from max to min in increments of 5 points:
  for(int fadeValue = 255 ; fadeValue >= 0; fadeValue -=5) { 
    speedPinLeft.write(fadeValue);
    speedPinRight.write(fadeValue);
  Serial.println(fadeValue);
    delay(700);                            
  } 
  
  */
  //doMove();
  while (Serial.available() < 1) {
  }
  
  assignVar();
}
