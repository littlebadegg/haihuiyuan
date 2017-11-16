package export;

import com.jfinal.plugin.activerecord.Model;

/**
 * Created by Yaoyuqi on 2017/11/15.
 */
public class User extends Model<User> {
    public static final User dao = new User().dao();

}
