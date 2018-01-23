
void defaultEventDispatch(){
  //KeepDispatchJoyStickValue
  int ax,ay,bx,by;
  ax=analogRead(JoyStickA_X);
  ay=analogRead(JoyStickA_Y);
  bx=analogRead(JoyStickB_X);
  by=analogRead(JoyStickB_Y);
  A_X_Value = map(ax, 0, 1023, 0, 600);
  A_Y_Value = map(ay, 0, 1023, 0, 600);
  A_Z_Value = digitalRead(JoyStickA_Z);
  B_X_Value = map(bx, 0, 1023, 0, 600);
  B_Y_Value = map(by, 0, 1023, 0, 600);
  B_Z_Value = digitalRead(JoyStickB_Z);
  //pinState1 = digitalRead(extraPin1);
  //pinState2 = digitalRead(extraPin2);
  //pinState3 = digitalRead(extraPin3);
  Serial.print("#");
  Serial.print(currentDevNum);
  int dispatchVal[] = {A_X_Value,A_Y_Value,A_Z_Value,analogRead(sliderA),B_X_Value,B_Y_Value,B_Z_Value,analogRead(sliderB),digitalRead(extraPin0),digitalRead(extraPin1),digitalRead(extraPin2),digitalRead(extraPin3),digitalRead(extraPin4),digitalRead(extraPin5)};
  for(int i=0;i<14;i++){
    String tempVar = "|";
    Serial.print(tempVar+dispatchVal[i]);
  }
  Serial.print("|*");
  delay(100);
}
void joystickEvent(){
  if(joyShow==true){
    String st1_0 = "X:";
    String st1_1 = st1_0+A_X_Value;
    String st1_2 = st1_1+"  Y:";
    String st1_3 = st1_2+A_Y_Value;
    String st1_4 = st1_3+" Z:";
    String st1_5 = st1_4+A_Z_Value;
    String st2_0 = "X:";
    String st2_1 = st2_0+B_X_Value;
    String st2_2 = st2_1+"  Y:";
    String st2_3 = st2_2+B_Y_Value;
    String st2_4 = st2_3+" Z:";
    String st2_5 = st2_4+B_Z_Value;
    printLCD(st1_5,st2_5);
  }
  if(A_Z_Value==1){
        digitalWrite(LED_A, LOW);
  }else{
        digitalWrite(LED_A, HIGH);
  }
  if(B_Z_Value==1){
        digitalWrite(LED_B, LOW);
  }else{
        digitalWrite(LED_B, HIGH);
  }
}

int get_key(unsigned int input){
    int k;
    for (k = 0; k < NUM_KEYS; k++){
      if (input < adc_key_val[k]){
        return k;
      }
   }
   if (k >= NUM_KEYS)k = -1;
   return k;
}

void functionPick(){
  beepLong.check();
  currentFunPik++;
  if(currentFunPik>=6){
    currentFunPik=0;
  }
  String line2="";
  if(currentFunPik==0){
    String tempStr = "Mech:";
    line2 = tempStr+devices[currentDevNum];
  }else if(currentFunPik==1){
    line2 = devices[currentDevNum];
  }else if(currentFunPik==2){
    line2 = "False";
  }else{
    line2 = "";
  }
  printLCD(currentFunc[currentFunPik],line2);
}
void keyEvent(){
  adc_key_in = analogRead(A4);   // read the value from the sensor 
  key = get_key(adc_key_in);     // convert into key press
 
  if (key != oldkey){            // if keypress is detected
    delay(50);                   // wait for debounce time
    adc_key_in = analogRead(A4); // read the value from the sensor 
    key = get_key(adc_key_in);   // convert into key press
    if (key != oldkey){
      oldkey = key;
      if (key >=0){
        String viewString = "";
        joyShow = false; //_________________________________________________Trun view joystick to flase
        switch(key){
           case 0:
             functionPick();
             break;
           case 1:
             if(currentFunPik==1){// _______________________________________Pick the MECH upward
               beepShort.check();
               currentDevNum++;
               if(currentDevNum>=totalDevice){
                 currentDevNum=0;
               }
               printLCD(currentFunc[currentFunPik],devices[currentDevNum]);
             }else if(currentFunPik==2){ // ________________________________View joystick stats upward.
               beepShort.check();
               if(joyViewPick){
                 joyViewPick=false;
                 viewString = "False";
               }else{
                 joyViewPick=true;
                 viewString = "True";
               }
               printLCD(currentFunc[currentFunPik],viewString);
             }
             break;
           case 2:
             printLCD("S3 OK","No function");
             break;
           case 3:
             printLCD("S4 OK","No function");
             break;      
           case 4:
             if(currentFunPik==1){        // _____________________________Pick the MECH downward
               beepShort.check();
               currentDevNum--;
               if(currentDevNum<0){
                 currentDevNum=totalDevice-1;
               }
               printLCD(currentFunc[currentFunPik],devices[currentDevNum]);
             }else if(currentFunPik==2){  // _____________________________Check joystick viewable stats.
               beepShort.check();
               joyShow=joyViewPick;
             }
             break;  
        }                
      }
    }
  }
}


TimedAction timedKeyEvent = TimedAction(10,keyEvent);
TimedAction timedJoystickEvent = TimedAction(1000,joystickEvent);
