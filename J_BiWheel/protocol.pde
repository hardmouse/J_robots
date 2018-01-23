int counter;
int num;
int c;

int varArray[15];
int joyX = 0;
int joyY = 0;
int maxVal = 110;
int minVal = 90;
int centerPointR = 106;
int centerPointL = 92;
void stopMove(){
    speedPinLeft.write(centerPointL);
    speedPinRight.write(centerPointR);
}
void doMove(){
  joyX = varArray[5];
  joyY = varArray[6];
  joyX = map(joyX, 0,600,minVal,maxVal);
  joyY = map(joyY, 0,600,minVal,maxVal);
  int speed_L = joyY - joyX + centerPointL;
  int speed_R = joyY + joyX - centerPointR;
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
  speedPinRight.write(speed_R);

}
/*
void lightControl(){  
  if(varArray[10]==0){
    digitalWrite(backLED, HIGH);
  }else{
    digitalWrite(backLED, LOW);
  }
  if(varArray[11]==0){
    digitalWrite(rightLED, HIGH);
  }else{
    digitalWrite(rightLED, LOW);
  }
  if(varArray[9]==0){
    digitalWrite(leftLED, HIGH);
  }else{
    digitalWrite(leftLED, LOW);
  }
}
*/
void process_command(){
  /*
  Serial.print("9:");
  Serial.print(varArray[9]);
  Serial.print("    10:");
  Serial.print(varArray[10]);
  Serial.print("    11:");
  Serial.println(varArray[11]);
  */
  if(varArray[0]==5){
    digitalWrite(indLED, HIGH);
     //lightControl();
    doMove();
  }else{
    digitalWrite(indLED, LOW);
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
      if (c == '*'){
        varArray[counter] = num;
        //Serial.print("<-----");
        process_command ();
      }
}
