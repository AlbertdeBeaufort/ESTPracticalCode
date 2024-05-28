#include <OneWire.h>
#include <DallasTemperature.h>

const int SENSOR_PIN = 13; // Arduino pin connected to DS18B20 sensor data line
const int Measurement_Interval = 5; // The amount of seconds between each measurement
long CurrentMillis;

OneWire oneWire(SENSOR_PIN);         // setup a oneWire instance
DallasTemperature tempSensor(&oneWire); // pass oneWire to DallasTemperature library

float tempCelsius;    // temperature in Celsius

void setup()
{
  Serial.begin(9600); // initialize serial
  tempSensor.begin();    // initialize the sensor
  pinMode(13, INPUT);
}

void loop()
{
      if (millis() - CurrentMillis >= Measurement_Interval*1000){ //starts the function when the time interval has been reached
          CurrentMillis = millis();
  tempSensor.requestTemperatures();             // send the command to get temperatures
  tempCelsius = tempSensor.getTempCByIndex(0);  // read temperature in Celsius
  Serial.println(String(millis()) + "\t" + tempCelsius);    // print the temperature in Celsius
  }
}
