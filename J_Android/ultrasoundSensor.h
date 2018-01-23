
int buce_L = 42;
int echo_L = 43;
int buce_R = 44;
int echo_R = 45;

long microsecondsToInches(long microseconds){
  return microseconds / 74 / 2;
}
 
long microsecondsToCentimeters(long microseconds){
  return microseconds / 29 / 2;
}
void objDetect(){
  long duration_L, inches_L, cm_L, duration_R, inches_R, cm_R;
 
  // The PING))) is triggered by a HIGH pulse of 2 or more microseconds.
  // Give a short LOW pulse beforehand to ensure a clean HIGH pulse:
  pinMode(buce_L, OUTPUT);
  digitalWrite(buce_L, LOW);
  delayMicroseconds(2);
  digitalWrite(buce_L, HIGH);
  delayMicroseconds(10);
  digitalWrite(buce_L, LOW);
 
  pinMode(buce_R, OUTPUT);
  digitalWrite(buce_R, LOW);
  delayMicroseconds(2);
  digitalWrite(buce_R, HIGH);
  delayMicroseconds(10);
  digitalWrite(buce_R, LOW);
  
  // The same pin is used to read the signal from the PING))): a HIGH
  // pulse whose duration is the time (in microseconds) from the sending
  // of the ping to the reception of its echo off of an object.
  pinMode(echo_L, INPUT);
  duration_L = pulseIn(echo_L, HIGH);
  pinMode(echo_R, INPUT);
  duration_R = pulseIn(echo_R, HIGH);
   // convert the time into a distance
  inches_L = microsecondsToInches(duration_L);
  cm_L = microsecondsToCentimeters(duration_L); 
  inches_R = microsecondsToInches(duration_R);
  cm_R = microsecondsToCentimeters(duration_R);  
/*  
  Serial.print("LEFT:"); 
  Serial.print(inches_L);
  Serial.print("in, ");
  Serial.print(cm_L);
  Serial.print("cm");    
  Serial.print("         RIGHT:"); 
  Serial.print(inches_R);
  Serial.print("in, ");
  Serial.print(cm_R);
  Serial.println("cm");
 */
  //delay(100);
}

TimedAction distanceEvent = TimedAction(200,objDetect);
