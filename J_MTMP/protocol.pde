int counter;
int num;
int c;

int varArray[15];
int joyX = 0;
int joyY = 0;
int microAdjust = 8;
int maxVal = 600;//140;
int minVal = 0;//40;
int centerPoint = (maxVal-minVal)/2+minVal;//95;

int S_LEN, S_LFP, S_LBP, S_REN, S_RFP, S_RBP = 1;

void setMotor(int LEN, int LFP, int LBP, int REN, int RFP, int RBP){
  analogWrite(L_EN, LEN);
  analogWrite(L_fPin, LFP);
  analogWrite(L_bPin, LBP);
  analogWrite(R_EN, REN);
  analogWrite(R_fPin, RFP);
  analogWrite(R_bPin, RBP);
  Serial.print("L_F:\t");
  Serial.print(LFP);
  Serial.print("\tL_B:\t");
  Serial.print(LBP);
  Serial.print("\t_______________");
  Serial.print("R_F:\t");
  Serial.print(RFP);
  Serial.print("\tR_B:\t");
  Serial.println(RBP);

  //speedPinLeft.write(centerPoint);
  //speedPinRight.write(centerPoint);
}
void stopMove(){
  setMotor(1,1,1,1,1,1);
    //speedPinLeft.write(centerPoint);
    //speedPinRight.write(centerPoint);
}
void doMove(){
  joyX = varArray[5];
  joyY = varArray[6];
  joyX = map(joyX, 0,600,minVal,maxVal);
  joyY = map(joyY, 0,600,minVal,maxVal);
  int speed_L = joyY - joyX + centerPoint - microAdjust;
  int speed_R = joyY + joyX - centerPoint + microAdjust;
  
  if(speed_L > maxVal){
    speed_L = maxVal;
  }else if(speed_L < minVal){
    speed_L = minVal;
  }
  if(speed_R > maxVal){
    speed_R = maxVal;
  }else if(speed_R < minVal){
    speed_R = minVal;
  }
  
  if(speed_L>310){
    S_LFP = map(speed_L, 310,600,0,255);
    S_LBP = 1;
  }else if(speed_L<290){
    S_LFP = 1;
    S_LBP = map(speed_L, 290,0,0,255);
  }else{
    S_LFP = 1;
    S_LBP = 1;
  }
  if(speed_R>310){
    S_RFP = map(speed_R, 310,600,0,255);
    S_RBP = 1;
  }else if(speed_R<290){
    S_RFP = 1;
    S_RBP = map(speed_R, 290,0,0,255);
  }else{
    S_RFP = 1;
    S_RBP = 1;
  }
  
  setMotor(S_LEN,S_LFP,S_LBP,S_REN,S_RFP,S_RBP);
  
  
  if(varArray[9]==0){
    if(varArray[10]==0){
      digitalWrite(backLED, HIGH);
    }else{
      if(S_LBP>80 && S_RBP>80){
        digitalWrite(backLED, HIGH);
      }else{
        digitalWrite(backLED, LOW);
      }
    }
    if(S_LFP>130 && S_RFP>130){
      digitalWrite(leftLED, HIGH);
      digitalWrite(rightLED, HIGH);
    }else{
      if(S_LFP - S_RFP > 30){
        digitalWrite(leftLED, HIGH);
      }else{
        digitalWrite(leftLED, LOW);
      }
      if(S_RFP - S_LFP > 30){
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
  //speedPinLeft.write(speed_L);
  //speedPinRight.write(speed_R+15);
  //delay(1000);
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
  if(varArray[0]==3){
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
