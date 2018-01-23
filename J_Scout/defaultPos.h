void defaultPos(){
  for (int i=0; i<8; i++) {
    myssc.servoMove(Servo_L[i],dePos_L[i]);
    myssc.servoMove(Servo_R[i],dePos_R[i]);
  }
  delay(400);
}
