#include <Servo.h> 

Servo speedPinLeft;

Servo speedPinRight;

int frontLED = 2;
int backLED = 3;
int indLED = 8;
int greenLED = 9;
int rightLED = 10;
int leftLED = 11;

void setup(void){
  Serial.begin(9600);
  pinMode(indLED, OUTPUT);
  pinMode(backLED, OUTPUT);
  pinMode(frontLED, OUTPUT);
  pinMode(greenLED, OUTPUT);
  pinMode(rightLED, OUTPUT);
  pinMode(leftLED, OUTPUT);
  digitalWrite(indLED,LOW);
  digitalWrite(backLED,LOW);
  digitalWrite(frontLED,LOW);
  digitalWrite(greenLED,LOW);
  digitalWrite(rightLED,LOW);
  digitalWrite(leftLED,LOW);

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
  while (Serial.available() < 1) {
  }
  assignVar();
}
