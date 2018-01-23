int counter;
int num;
int c;
int varArray[13];
int speed_L = 0;
int speed_R = 0;
void doMove(){
    speed_L = abs((varArray[2]-300)/2.5);
    speed_R = abs((varArray[6]-300)/2.5);
    /*
    Serial.print(varArray[2]-300);
    Serial.print("<<<<<");
    Serial.print(speed_L);
    Serial.print("<||>");
    Serial.print(speed_R);
    Serial.print(">>>>>");
    Serial.println(varArray[6]-300);
    */
    if(varArray[2]-300>30){
      digitalWrite(M1,LOW);
    }else if(varArray[2]-300<-30){
      digitalWrite(M1,HIGH);
    }else{
      analogWrite (E1,LOW);
    }
    if(varArray[6]-300>30){
      digitalWrite(M2,LOW);
    }else if(varArray[6]-300<-30){
      digitalWrite(M2,HIGH);
    }else{
      analogWrite (E2,LOW);
    }
    analogWrite (E1,speed_L);
    analogWrite (E2,speed_R);
}
void process_command(){
  //Serial.println(varArray[0]);
  if(varArray[0]==1){
    digitalWrite(13, HIGH);
    doMove();
  }else{
    digitalWrite(13, LOW);
    analogWrite (E1,LOW);
    analogWrite (E2,LOW);
  }
  
  delay(10);
  //#3|111|112|123|*
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
