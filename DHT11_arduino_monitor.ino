// Example testing sketch for various DHT humidity/temperature sensors
// Written by ladyada, public domain
// Edited CRFP 2015  Celsius/DHT11

#include "DHT.h"
#define DHTPIN 2   
#define DHTTYPE DHT11   // DHT 11 
DHT dht(DHTPIN, DHTTYPE);

void setup() {
  Serial.begin(9600); 
  //Serial.println("DHT11 test!");
 
  dht.begin();
}

void loop() {

  delay(2000);
  float h = dht.readHumidity();
  float t = dht.readTemperature();
  
  Serial.println(h);
  Serial.println(t);
 
}
