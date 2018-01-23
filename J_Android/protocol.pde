int counter;
int num;
int c;

int varArray[13];
int speed_L = 0;
int speed_R = 0;
int joyX = 0;
int joyY = 0;

void doMove(){
  joyX = (varArray[5]-300)*0.35;
  joyY = (varArray[6]-300)*0.35;

  speed_L = joyY-joyX;
  speed_R = joyY+joyX;
  
  if(speed_L>100){
    speed_L=100;
  }
  if(speed_L<-100){
    speed_L=-100;
  }
  if(speed_R>100){
    speed_R=100;
  }
  if(speed_R<-100){
    speed_R=-100;
  }
  if(abs(speed_L)>30 && abs(speed_R)>30){
    if(abs(speed_L - speed_R)>50){
      if(speed_L>speed_R){
        eyeControl(0,255,255,255,0,255);
      }else{
        eyeControl(255,0,255,0,255,255);
      }
    }else if(abs(speed_L)>80 && abs(speed_R)>80){
      eyeControl(0,255,255,0,255,255);
    }else{
      eyeControl(255,255,0,255,255,0);
    }
  }else{
      eyeControl(0,0,0,0,0,0);
  }
  
  motorMovement(speed_L,speed_R);
  
  int shoAng_L = map(varArray[1],0,600,20,50);
  int shoAng_R = map(varArray[2],0,600,160,130);
  int armAng_L = map(varArray[4],0,1023,180,0);
  int armAng_R = map(varArray[8],0,1023,0,180);
  handMotion(shoAng_L, shoAng_R, armAng_L, armAng_R);
  //delay(200);
  
}
void process_command(){
  if(varArray[0]==7){
    printLCD("Thank you! ","You are in charge.");
    doMove();
  }else{
    printLCD("Sorry! ","Signal not pinged.");
    stopMove();
  }

  delay(10);
}
void assignVar(){
    c = Serial.read();
      if (c == '#'){
        counter = 0;
        num = 0;
      }
      if (isdigit (c)){
        num *= 10;  // previous value is 10 times larger
        num += c - '0';  // add new digit
       }
      if (c == '|'){
        varArray[counter++] = num;
        /*
        Serial.print(counter);
        Serial.print("=");
        Serial.print(num);
        Serial.print("|");
        */
        num = 0;
      }
  //printLCD("assignVar","*");
      if (c == '*'){
        //printLCD("assignVar","*");
        varArray[counter] = num;
        //Serial.println("<-----");
        process_command ();
      }
}
