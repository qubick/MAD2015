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

//read serial input from app and trigger solenoids//
  if(Serial.available() > 0){

    while(1){
      incomingByte = Serial.read();
      if(incomingByte == '\n') break;
      if(incomingByte == -1) continue;

      integerValue *= 10;

      //convert ASCII to integer
      //integerValue = ((incomingByte - 48) + integerValue);
      Serial.println(integerValue, DEC);
     }
  switch ((int)incomingByte) {
    case 'a':
      digitalWrite(notes[0], HIGH);
      break;
    case 'b':
      digitalWrite(notes[1], HIGH);
      break;
    case 'c':
      digitalWrite(notes[2], HIGH);
      break;
    case 17:
      digitalWrite(notes[3], HIGH);
      break;
    case 19:
      digitalWrite(notes[4], HIGH);
      break;
    default: 
      for (int i = 0; i <5; i++){
        digitalWrite(notes[i], LOW);
      }
    }
  }
delay(100);

//int incomingByte = Serial.read();
Serial.println(incomingByte);
delay(100);

}

void testloop(){
//test loop - run to check that all solenoids are firing//
for (int i=0; i < 5; i++){
  digitalWrite(notes[i], HIGH);
  delay(500);
  digitalWrite(notes[i],LOW);
}

}

