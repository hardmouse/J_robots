#include <SSC32.h>
#include "varSetup.h"
#include "defaultPos.h"
#include "breath.h"
#include "walk.h"

void setup() {
  Serial.begin(9600);
  myssc.begin(9600);
  defaultPos();
  delay(2000);
}

void loop() {
  breath();
  //walk(7);
}
