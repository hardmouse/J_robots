//#include <Servo.h> 

//Servo speedPinLeft;

//Servo speedPinRight;
int L_EN = 2;
int L_fPin = 3;
int L_bPin = 5;
int R_EN = 4;
int R_fPin = 6;
int R_bPin = 9;
int indLED = 7;
int backLED = 8;
int leftLED = 12;
int rightLED = 11;

void setup(void){
  Serial.begin(9600);
  pinMode(indLED, OUTPUT);
  pinMode(backLED, OUTPUT);
  pinMode(rightLED, OUTPUT);
  pinMode(leftLED, OUTPUT);
  pinMode(L_fPin, OUTPUT);
  pinMode(L_bPin, OUTPUT);
  pinMode(R_fPin, OUTPUT);
  pinMode(R_bPin, OUTPUT);
  pinMode(L_EN, OUTPUT);
  pinMode(R_EN, OUTPUT);
  //speedPinLeft.attach(5);
  //speedPinRight.attach(6);
}
void loop(void){

  while (Serial.available() < 1) {
    digitalWrite(indLED, LOW);
    //stopMove();
  }
  assignVar();
}
