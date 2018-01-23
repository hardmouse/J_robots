int counter;
int num;
int c;
int joyX = 0;
int joyY = 0;
int curtDir = 0;
int prevDir = 0;

int varArray[13];


void doMove(){
  joyX = varArray[5]-600;
  joyY = varArray[6]-600;
  if(joyY>590){
    curtDir = 1;
  }else if (joyY<-590){
    curtDir = 2;
  }else if (joyY<-590){
    curtDir = 3;
  }else if (joyX>590){
    curtDir = 4;
  }else{
    curtDir = 0;
  }
  if(curtDir!=prevDir){
    if(curtDir = 1){
      moveForward();
    }else if(curtDir = 2){
      moveLeft();
    }else if(curtDir = 3){
      moveRight();
    }else if(curtDir = 4){
      moveBackward();
    }else{
      stopMe();
    }
    prevDir = curtDir;
  }
}
void process_command(){
  if(varArray[0]==2){
    digitalWrite(indLed,HIGH);
    doMove();
  }else{
    digitalWrite(indLed,LOW);
    currentDir = 0;
    stopMe();
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
