#include <Servo.h>
#include <SoftwareSerial.h>

int LEDYellow = 3;
int LEDGreen = 4;
int LEDRed= 5;

const int outputPin = 13;

Servo myservo;
SoftwareSerial BLE(0,1); //create instance of BLE with pin 0(RX), 1(TX)

int integerValue = 0;


void setup() {
  // put your setup code here, to run once:
  pinMode(outputPin, OUTPUT);

  
  pinMode(LEDYellow, OUTPUT);
  pinMode(LEDGreen, OUTPUT);
  pinMode(LEDRed, OUTPUT);

  myservo.attach(9);
  myservo.write(0);

  Serial.begin(9600);
//  Serial1.begin(4800);
  //BLE.begin(9600);
}

void loop() {
  // put your main code here, to run repeatedly:
  
  digitalWrite(LEDYellow, LOW);
  digitalWrite(LEDRed, LOW);
  digitalWrite(LEDGreen, LOW);


  if(Serial.available() > 0){
    
    digitalWrite(LEDGreen, HIGH);
//    myservo.write(incomingByte);

    integerValue = 0;
    while(1){
      int incomingByte = Serial.read();
      if(incomingByte == '\n') break;
      if(incomingByte == -1) continue;

      integerValue *= 10;

      //convert ASCII to integer
      integerValue = ((incomingByte - 48) + integerValue);
      myservo.write(integerValue);
     }
    //Serial.println(incomingByte, DEC);
/*    
    if(incomingByte>0 &&incomingByte <=100){
      
      digitalWrite(outputPin, HIGH);
    } else if (incomingByte >100 && incomingByte <= 200) {
      digitalWrite(LEDGreen, HIGH);  
    }
    */
    
    delay(500);
    digitalWrite(outputPin, LOW); 
    digitalWrite(LEDGreen, LOW);
  }
}
