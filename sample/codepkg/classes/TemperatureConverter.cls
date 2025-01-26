public class TemperatureConverter {
    //Takes a fahrenheit temperature and returns the celsius equivalent.
    public static Decimal FahrenheitToCelcius(Decimal fh){
        Decimal cs = (fh-32)* 5/9;
        return cs.setScale(2);
    }

}