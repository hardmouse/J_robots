int analogValue0 = 0;
int analogValue1 = 0;
int analogValue2 = 0;
int analogValue3 = 0;
int analogValue4 = 0;
void setup() { 
   Serial.begin(9600);
} 

 void loop()  { 
   analogValue0 = analogRead(A0);
   analogValue0 = map(analogValue0, 0, 1023, 0, 179);
   analogValue1 = analogRead(A1);
   analogValue1 = map(analogValue1, 0, 1023, 0, 179);
   analogValue2 = analogRead(A2);
   analogValue2 = map(analogValue2, 0, 1023, 0, 179);
   analogValue3 = analogRead(A3);
   analogValue3 = map(analogValue3, 0, 1023, 0, 179);
   analogValue4 = analogRead(A4);
   analogValue4 = map(analogValue4, 0, 1023, 0, 179);
   Serial.print("0:");
   Serial.print(analogValue0);
   Serial.print("   1:");
   Serial.print(analogValue1);
   Serial.print("   2:");
   Serial.print(analogValue2);
   Serial.print("   3:");
   Serial.println(analogValue3);
   delay(100);
}
