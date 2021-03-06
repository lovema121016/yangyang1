import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class Test {

	public static void main(String[] args) throws ParseException {
		// TODO Auto-generated method stub
		SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        String currentDate = dateFormat.format(new Date());//获取当前时间
        System.out.println(currentDate);
        String s= "2011-07-09 "; 
        java.text.SimpleDateFormat formatter = new SimpleDateFormat( "yyyy-MM-dd");
        Date date=formatter.parse(currentDate);
        System.out.print(date);
	}

}
