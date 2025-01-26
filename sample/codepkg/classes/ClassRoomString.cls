public class ClassRoomString {
    public static void palindrome(string original,string reverse){
        for(integer i=original.length()-1;i>=0;i--){
            reverse+=original.substring(i,i+1);
        }
        if(original.equals(reverse)){
            system.debug(original+'is Palindrome');
        }
        else{
            system.debug(original+'is not a palindrome');
        }
    }
}