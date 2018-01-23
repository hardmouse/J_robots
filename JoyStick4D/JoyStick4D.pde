
#include <LiquidCrystal.h>

#define battPin A6
#define blueLED A3
#define backLightPin 9
int battLevel;
int backLightBrightness;

LiquidCrystal lcd(10, 8, 7, 6, 5, 4);

const int yPin = A0;
const int xPin = A1;
const int rPin = A2;
int rVal, xVal, yVal, rRed, xRed, yRed, rOut, xOut, yOut = 0;
int btn=2;

void printLCD(String string1, String string2){
  lcd.clear();
  lcd.print(string1);
  lcd.setCursor(0, 1); // bottom left
  lcd.print(string2);
}

void setup() {
  // initialize serial communications at 9600 bps:
  Serial.begin(9600); 
  lcd.begin(16,2);
  pinMode(backLightPin,OUTPUT);
  analogWrite(backLightPin,255);
  
  digitalWrite(btn, HIGH);
  pinMode(btn, INPUT);
  delay(1000);
  printLCD("Countdown:","3");
  delay(1000);
  printLCD("Countdown:","2");
  delay(1000);
  printLCD("Countdown:","1");
  delay(1000);
  printLCD("Hi,","Joystick Ready!");
}
void loop() {
  // read the analog in value:
  rVal = analogRead(rPin);   
  xVal = analogRead(xPin);   
  yVal = analogRead(yPin);   

  if(rVal>70){
    rRed = rVal/5+60;
  }else{
    rRed = rVal;
  }
  xRed = xVal;
  yRed = yVal;
  Serial.print("Button:");
  Serial.print(digitalRead(btn));
  Serial.print("\t Rotate Read = " );                       
  Serial.print(rRed); 
  Serial.print("\t X read = " );                       
  Serial.print(xRed); 
  Serial.print("\t Y read = " );                       
  Serial.print(yRed); 
  rOut = map(rRed, 0, 1023, 0, 255);  
  xOut = map(xRed, 0, 1023, 0, 255);  
  yOut = map(yRed, 0, 1023, 0, 255); 
  // print the results to the serial monitor:
  Serial.print("\t Rotate Out = ");      
  Serial.print(rOut/2);   
  Serial.print("\t X out = ");      
  Serial.print(xOut/2);   
  Serial.print("\t Y out = ");      
  Serial.println(yOut/2);  
  
  String viewString1 = "";
  String viewString2 = "";
  viewString1+="X:";
  viewString1+=xOut;
  viewString1+=" Y:";
  viewString1+=yOut;
  viewString2+="R:";
  viewString2+=rOut;
  viewString2+=" B:";
  viewString2+=digitalRead(btn);
  printLCD(viewString1,viewString2);

  // wait 10 milliseconds before the next loop
  // for the analog-to-digital converter to settle
  // after the last reading:
  delay(100);                     
}
