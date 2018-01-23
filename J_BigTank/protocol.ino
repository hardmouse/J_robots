int counter;
int num;
int c;

int varArray[13];
int speed_L = 0;
int speed_R = 0;
int joyX = 0;
int joyY = 0;
int tAngle = 0;

void stopMove(){
    digitalWrite(dir1PinA,LOW);
    digitalWrite(dir1PinB,LOW);
    digitalWrite(dir2PinA,LOW);
    digitalWrite(dir2PinB,LOW);
}
void doMove(){
  joyX = (varArray[5]-300)*0.8;
  joyY = (varArray[6]-300)*0.8;
  tAngle = varArray[8];
  tAngle = map(tAngle,0,1023,0,179);
  digitalWrite(headLight,varArray[12]);
  //turret.write(tAngle);
  speed_L = joyY-joyX;
  speed_R = joyY+joyX;
  if(speed_L>240){
    speed_L=240;
  }
  if(speed_L<-240){
    speed_L=-240;
  }
  if(speed_R>240){
    speed_R=240;
  }
  if(speed_R<-240){
    speed_R=-240;
  }
  if(speed_L>10){
    digitalWrite(dir1PinA, LOW);
    digitalWrite(dir2PinA, HIGH);
  }else if(speed_L<-10){
    digitalWrite(dir1PinA, HIGH);
    digitalWrite(dir2PinA, LOW);
  }else{
    digitalWrite(dir1PinA, LOW);
    digitalWrite(dir2PinA, LOW);
  }
  if(speed_R>10){
    digitalWrite(dir1PinB, HIGH);
    digitalWrite(dir2PinB, LOW);
  }else if(speed_R<-10){
    digitalWrite(dir1PinB, LOW);
    digitalWrite(dir2PinB, HIGH);
  }else{
    digitalWrite(dir1PinB, LOW);
    digitalWrite(dir2PinB, LOW);
  }
  analogWrite(speedPinA, abs(speed_L));
  analogWrite(speedPinB, abs(speed_R));
}
void process_command(){
  //Serial.println(varArray[0]);
  if(varArray[0]==4){
    digitalWrite(indLED, HIGH);
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
