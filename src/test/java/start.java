import com.jfinal.core.JFinal;

/**
 * Created by Administrator on 2017/11/15.
 */
public class start {
    public static void main(String[] args) {
        JFinal.start("src/main/webapp", 8088, "/");
    }
}
