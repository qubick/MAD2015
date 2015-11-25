#include <Servo.h>
#include <SoftwareSerial.h>

int LEDYellow = 3;
int LEDGreen = 4;
int LEDRed= 5;

const int outputPin = 13;

Servo myservo;
SoftwareSerial BLE(0,1); //create instance of BLE with pin 0(RX), 1(TX)


void setup() {
  // put your setup code here, to run once:
  pinMode(outputPin, OUTPUT);

  
  pinMode(LEDYellow, OUTPUT);
  pinMode(LEDGreen, OUTPUT);
  pinMode(LEDRed, OUTPUT);

  myservo.attach(9);
  myservo.write(0);

  Serial.begin(9600);
  //BLE.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  /*
  
  delay(500);
  digitalWrite(LEDYellow,LOW);
  delay(500);
  digitalWrite(LEDRed, LOW);
  delay(500);
  digitalWrite(LEDGreen, LOW);
  delay(500);
  */
  digitalWrite(LEDYellow, LOW);
  digitalWrite(LEDRed, LOW);
  digitalWrite(LEDGreen, LOW);


  if(Serial.available() > 0){
    int incomingByte = Serial.read();
    digitalWrite(LEDGreen, HIGH);
    
    if(incomingByte){
      myservo.write(incomingByte);
      digitalWrite(outputPin, HIGH);
    } else {
      digitalWrite(outputPin, LOW);  
    }
    delay(500);
    digitalWrite(outputPin, LOW); 
    digitalWrite(LEDGreen, LOW);
  }
}
