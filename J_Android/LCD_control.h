


int eyeR_R = 13;
int eyeR_G = 12;
int eyeR_B = 11;
int eyeL_R = 9;
int eyeL_G = 10;
int eyeL_B = 8;



LiquidCrystal_I2C lcd(0x27,16,2);

void initLCD(){
  lcd.init();
  lcd.backlight();
}

  
void printLCD(String string1, String string2){
  lcd.clear();
  lcd.print(string1);
  lcd.setCursor(0, 1); // bottom left
  lcd.print(string2);
}


void eyeControl(int R_R, int R_G, int R_B, int L_R, int L_G, int L_B){
  analogWrite(eyeR_R, R_R);
  analogWrite(eyeR_G, R_G);
  analogWrite(eyeR_B, R_B);
  analogWrite(eyeL_R, L_R);
  analogWrite(eyeL_G, L_G);
  analogWrite(eyeL_B, L_B);
}
