
void setup(){
  Serial.begin(9600); 
}

void loop(){
  int sensorA, degreesA, sensorB, degreesB;
  
  sensorA = analogRead(0);
  sensorB = analogRead(1);
  
  degreesA = map(sensorA, 540, 820, 0, 270);
  degreesB = map(sensorB, 540, 820, 0, 270);

  Serial.print("a0: ");
  Serial.print(sensorA,DEC);
  Serial.print("   degA: ");
  Serial.print(degreesA,DEC);
  Serial.print("       a1: ");
  Serial.print(sensorB,DEC);
  Serial.print("   degB: ");
  Serial.println(degreesB,DEC);
  
  delay(100);                     
}
