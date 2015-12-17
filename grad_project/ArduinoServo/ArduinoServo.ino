#include <SoftwareSerial.h>

int notes[] = {3,4,6,8,9};
int integerValue = 0;
byte incomingByte = 0;
const int outputPin = 13;

void setup() {
  //initialize
  for (int i = 0; i < 5; i++){
    pinMode(notes[i], OUTPUT);
  }

  pinMode(outputPin, OUTPUT);
  Serial.begin(9600);
  testloop();

}

void loop() {

//testloop();
incomingByte = Serial.read();
//read serial input from app and trigger solenoids//
  if(Serial.available() > 0){

//for unfilterable data due to mismatched chipset on Arduino
    if(incomingByte>0 &&incomingByte <=100){
        digitalWrite(notes[0], HIGH);
        digitalWrite(notes[2], HIGH);
    } else if (incomingByte >101 && incomingByte <= 200) {
        digitalWrite(notes[1], HIGH);  
        digitalWrite(notes[3], HIGH);
    } else if (incomingByte >201 && incomingByte <= 300) {
        digitalWrite(notes[2], HIGH);  
        digitalWrite(notes[4], HIGH);
    } else if (incomingByte >301 && incomingByte <= 350) {
        digitalWrite(notes[0], HIGH);  
        digitalWrite(notes[4], HIGH);    
    } else if (incomingByte >351 && incomingByte <= 400) {
        testloop();    
    } else {   
        for (int i = 0; i <5; i++){
        digitalWrite(notes[i], LOW);  
    }
    }

  delay(10);
  Serial.println(incomingByte);

  }
}

void testloop(){
//test loop - run to check that all solenoids are firing//
for (int i=0; i < 5; i++){
  digitalWrite(notes[i], HIGH);
  delay(100);
  digitalWrite(notes[i],LOW);
}
}





