public class FibonnociSeries {
    public static void Fibonnoci(Integer num){
        integer first = 0;
        integer second = 1;
        for(integer i =0;i<=num;i++){
           system.debug('Fibonocci series: '+first + ',' +second);   
            first = first+second;
            second = first+second;
          }
       }
}