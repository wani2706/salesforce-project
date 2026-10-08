@isTest
public class TemperatureConverterTest{
   
     @isTest 
        static void testWarmTemp(){
        Decimal celsius = TemperatureConverter.FahrenheitToCelsius(70);
        system.assertEquals(21.11, celsius);
    }
}