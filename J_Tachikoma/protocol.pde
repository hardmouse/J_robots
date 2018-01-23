
int counter;
int num;
int c;

int varArray[15];
int joyX = 0;
int joyY = 0;
int maxVal = 500;
int minVal = -500;
int centerPoint = 1500;
void stopMove(){
  frontLeftWheel.writeMicroseconds(centerPoint);
  frontRightWheel.writeMicroseconds(centerPoint);
  rearLeftWheel.writeMicroseconds(centerPoint);
  rearRightWheel.writeMicroseconds(centerPoint);
}
void doMove(){
  joyX = varArray[5];
  joyY = varArray[6];
  joyX = map(joyX, 0,600,minVal,maxVal);
  joyY = map(joyY, 0,600,minVal,maxVal);
  int speed_L =joyY - joyX + centerPoint;
  int speed_R =joyY + joyX - centerPoint;
  frontLeftWheel.writeMicroseconds(speed_L);
  frontRightWheel.writeMicroseconds(speed_R);
  rearLeftWheel.writeMicroseconds(speed_L);
  rearRightWheel.writeMicroseconds(speed_R);
  
  if(varArray[14]==1){
    digitalWrite(laser, HIGH);
  }else{
    digitalWrite(laser, LOW);
  }
  if(varArray[13]==1){
    digitalWrite(cannon, HIGH);
  }else{
    digitalWrite(cannon, LOW);
  }
  /*
  if(varArray[9]==0){
    if(varArray[10]==0){
      digitalWrite(backLED, HIGH);
    }else{
      if(speed_L<80 && speed_R<80){
        digitalWrite(backLED, HIGH);
      }else{
        digitalWrite(backLED, LOW);
      }
    }
    if(speed_R>130 && speed_L>130){
      digitalWrite(leftLED, HIGH);
      digitalWrite(rightLED, HIGH);
    }else{
      if(speed_L - speed_R > 30){
        digitalWrite(leftLED, HIGH);
      }else{
        digitalWrite(leftLED, LOW);
      }
      if(speed_R - speed_L > 30){
        digitalWrite(rightLED, HIGH);
      }else{
        digitalWrite(rightLED, LOW);
      }
    }
  }else{
    digitalWrite(rightLED, LOW);
    digitalWrite(leftLED, LOW);
    if(varArray[10]==0){
      digitalWrite(backLED, HIGH);
    }else{
      digitalWrite(backLED, LOW);
    }
  }
  
  speedPinLeft.write(speed_L);
  speedPinRight.write(speed_R+15);
  */
}

void process_command(){

  if(varArray[0]==6){
    //digitalWrite(indLED, HIGH);
     light("green","green");
    doMove();
  }else{
    //digitalWrite(indLED, LOW);
    light("white","white");
    stopMove();
  }
  delay(10);
}
void assignVar(){
    c = Serial2.read();
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

        num = 0;
      }
      if (c == '*'){
        varArray[counter] = num;
        //Serial.print("<-----");
        process_command ();
      }
}

