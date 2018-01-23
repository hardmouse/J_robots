
  
String devices[] = {"Scout","LittleTank","Frog","M.T.M.P.","BigTank","BiWheel","Tachikoma","Android","Hell-O-Kitty"};
int totalDevice = 9;
String currentFunc[] = {"Welcome to HCU!","Mecha select:","Joystick stat:","Battery check:","Default2:","Quit:"};
boolean joyShow = false;
boolean joyViewPick = false;
int timing = 0;
int currentDevNum = 0;
int currentFunPik = 0;

LiquidCrystal_I2C lcd(0x27,16,2);
int LED_A = 4;
int LED_B = 5;

int JoyStickA_X = A0; //x
int JoyStickA_Y = A1; //y
int JoyStickA_Z = 30; //key
int JoyStickB_X = A2; //x
int JoyStickB_Y = A3; //y
int JoyStickB_Z = 31; //key

int sliderA = A5;
int sliderB = A6;

int A_X_Value = 0;
int A_Y_Value = 0;
int A_Z_Value = 0;
int B_X_Value = 0;
int B_Y_Value = 0;
int B_Z_Value = 0;

int adc_key_val[5] ={50, 200, 400, 600, 800 };
int NUM_KEYS = 5;
int adc_key_in;
int key=-1;
int oldkey=-1;

int extraPin0=50;
int extraPin1=51;
int extraPin2=52;
int extraPin3=53;
int extraPin4=8;
int extraPin5=9;
int tt=0;
void initPin(){
  //ET.init(details(mydata));
  digitalWrite(extraPin0, HIGH);
  digitalWrite(extraPin1, HIGH);
  digitalWrite(extraPin2, HIGH);
  digitalWrite(extraPin3, HIGH);
  digitalWrite(extraPin4, HIGH);
  digitalWrite(extraPin5, HIGH);
  pinMode(JoyStickA_X, INPUT); 
  pinMode(JoyStickA_Y, INPUT); 
  pinMode(JoyStickA_Z, INPUT); 
  pinMode(JoyStickB_X, INPUT); 
  pinMode(JoyStickB_Y, INPUT); 
  pinMode(JoyStickB_Z, INPUT);
  
  pinMode(extraPin0, INPUT);
  pinMode(extraPin1, INPUT);
  pinMode(extraPin2, INPUT);  
  pinMode(extraPin3, INPUT);
  pinMode(extraPin4, INPUT);  
  pinMode(extraPin5, INPUT);
  
  
  //pinMode(BuzzerPin, OUTPUT);
  //lcd.print(devices[currentDevNum]);
  pinMode(LED_A, OUTPUT);
  pinMode(LED_B, OUTPUT);
}



void printLCD(String string1, String string2){
  lcd.clear();
  lcd.print(string1);
  lcd.setCursor(0, 1); // bottom left
  lcd.print(string2);
}

