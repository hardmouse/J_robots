
#define TRIGGER_PIN  3
#define ECHO_PIN     2
#define MAX_DISTANCE 200
int dest = 0;

NewPing sonar(TRIGGER_PIN, ECHO_PIN, MAX_DISTANCE);


Servo myservo[8];
int initPos[]={90,90,95,93,84,92,98,95};
int currentPos[8];
int targetPos[8];
int mSpeed = 5;
int pos = 0;

int myStep = 35;
int divStep = 10;

int getPing() {
  //delay(30);
  unsigned int uS = sonar.ping();
  dest = uS / US_ROUNDTRIP_CM;
  return dest;
}
void servPos4(int sNum1, int sPos1, int sNum2, int sPos2, int sNum3, int sPos3, int sNum4, int sPos4){
  int Num[]={sNum1,sNum2,sNum3,sNum4};
  int Pos[]={sPos1,sPos2,sPos3,sPos4};
  int div[4];
  for(int i=0; i<4;i++){
    targetPos[Num[i]] = Pos[i];
    div[i] = (Pos[i] - currentPos[Num[i]])/divStep;
  }
  for(int i=0; i<divStep; i++){
    for(int j=0; j<4; j++){
      currentPos[Num[j]] = currentPos[Num[j]]+div[j];
      myservo[Num[j]].write(currentPos[Num[j]]);
      delay(mSpeed);
    }
  }
}
