

void setup(){
  Serial.begin(9600); 
}

void loop(){
  int sensorA, degreesA, sensorB, degreesB, sensorC, degreesC, sensorD, degreesD, sensorE, degreesE;
  sensorA = analogRead(0);
  sensorB = analogRead(1);
  sensorC = analogRead(2);
  sensorD = analogRead(3);
  sensorE = analogRead(4);
  degreesA = map(sensorA, 540, 820, 0, 270);
  degreesB = map(sensorB, 540, 820, 0, 270);
  degreesC = map(sensorC, 540, 820, 0, 270);
  degreesD = map(sensorD, 540, 820, 0, 270);
  degreesE = map(sensorE, 540, 820, 0, 270);
  
  Serial.print("a0:");
  Serial.print(sensorA,DEC);
  Serial.print("  degA: ");
  Serial.print(degreesA,DEC);
  Serial.print("  a1:");
  Serial.print(sensorB,DEC);
  Serial.print("  degB: ");
  Serial.print(degreesB,DEC);
  Serial.print("  a2:");
  Serial.print(sensorC,DEC);
  Serial.print("  degC: ");
  Serial.print(degreesC,DEC);
  Serial.print("  a3:");
  Serial.print(sensorD,DEC);
  Serial.print("  degD: ");
  Serial.print(degreesD,DEC);
  Serial.print("  a4:");
  Serial.print(sensorE,DEC);
  Serial.print("  degE: ");
  Serial.println(degreesE,DEC);
  
  delay(100);                     
}
