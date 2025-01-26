@isTest
private class TemperatureConverterTest {
    @isTest static void testWarmTemp(){
        Decimal celsius = TemperatureConverter.FahrenheitToCelcius(70);
        System.assertEquals(21.11, celsius);
    }
    @isTest static void TestFreezingPoint(){
        Decimal celsius = TemperatureConverter.FahrenheitToCelcius(32);
        System.assertEquals(0,celsius);
    }
    @isTest static void TestBoilingPoint(){
        Decimal celsius = TemperatureConverter.FahrenheitToCelcius(212);
        System.assertEquals(100,celsius,'Boiling point temperature is not expected.');
        }
    @isTest static void testNegativeTemperature(){
        Decimal celsius = TemperatureConverter.FahrenheitToCelcius(-10);
        System.assertEquals(-23.33,celsius);
    }
}