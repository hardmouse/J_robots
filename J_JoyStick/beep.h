
int BuzzerPin = 33;
void beep1(){
  digitalWrite(13,HIGH);
  digitalWrite(BuzzerPin, HIGH);
  delay(10);
  digitalWrite(13,LOW);
  digitalWrite(BuzzerPin, LOW);
}
void beep2(){
  digitalWrite(13,HIGH);
  digitalWrite(BuzzerPin, HIGH);
  delay(200);
  digitalWrite(13,LOW);
  digitalWrite(BuzzerPin, LOW);
}
void beep3(){
  digitalWrite(13,HIGH);
  digitalWrite(BuzzerPin, HIGH);
  delay(10);
  digitalWrite(13,LOW);
  digitalWrite(BuzzerPin, LOW);
  delay(100);
  digitalWrite(13,HIGH);
  digitalWrite(BuzzerPin, HIGH);
  delay(10);
  digitalWrite(13,LOW);
  digitalWrite(BuzzerPin, LOW);
  delay(100);
  digitalWrite(13,HIGH);
  digitalWrite(BuzzerPin, HIGH);
  delay(10);
  digitalWrite(13,LOW);
  digitalWrite(BuzzerPin, LOW);
}


TimedAction beepMulti = TimedAction(100,beep3);
TimedAction beepLong = TimedAction(100,beep2);
TimedAction beepShort = TimedAction(100,beep1);
