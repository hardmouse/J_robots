int drivingSpeed = 128                        ;    // how bright the LED is
//int fadeAmount = 5;    // how many points to fade the LED by
boolean ddir = true;


int PWM_FR = A0;//2;
int Dir_FR = 3;
int PWM_FL = A1;//;
int Dir_FL = 5;
int PWM_RR = A2;//;
int Dir_RR = 7;
int PWM_RL = A3;//;
int Dir_RL = 9;

void setup() {
  pinMode(Dir_FR, OUTPUT);
  pinMode(PWM_FR, OUTPUT); 
  pinMode(Dir_FL, OUTPUT);
  pinMode(PWM_FL, OUTPUT); 
  pinMode(Dir_RR, OUTPUT);
  pinMode(PWM_RR, OUTPUT); 
  pinMode(Dir_RL, OUTPUT);
  pinMode(PWM_RL, OUTPUT); 
}



void loop() { 

 
/*
  analogWrite(PWMPin, 255);
*/  

  // change the brightness for next time through the loop:
  //brightness = brightness + fadeAmount;

  // reverse the direction of the fading at the ends of the fade: 
  //if (brightness == 0 || brightness == 255) {
    //fadeAmount = -fadeAmount ; 
    if(ddir==true){
      digitalWrite(Dir_FR, LOW);
      digitalWrite(Dir_FL, HIGH);
      digitalWrite(Dir_RR, HIGH);
      digitalWrite(Dir_RL, LOW);
      ddir=false;
    }else{
      ddir=true;
      digitalWrite(Dir_FR, HIGH);
      digitalWrite(Dir_FL, LOW);
      digitalWrite(Dir_RR, LOW);
      digitalWrite(Dir_RL, HIGH);
    }  
  //}     
  analogWrite(PWM_FR, drivingSpeed); 
  analogWrite(PWM_FL, drivingSpeed);
  analogWrite(PWM_RR, drivingSpeed);
  analogWrite(PWM_RL, drivingSpeed);
  // wait for 30 milliseconds to see the dimming effect    
  delay(3000);   
}
