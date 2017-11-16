package export;

import com.jfinal.config.*;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.render.ViewType;
import com.jfinal.template.Engine;

/**
 * Created by Yaoyuqi on 2017/11/15.
 */
public class ExportExcelConfig extends JFinalConfig {
    @Override
    public void configConstant(Constants me) {
        me.setDevMode(true);
        me.setViewType(ViewType.JSP);//设置当前的视图类型
    }

    @Override
    public void configRoute(Routes me) {
        me.add("/excel", ExportExcelController.class);
    }

    @Override
    public void configEngine(Engine me) {
    }

    @Override
    public void configPlugin(Plugins me) {
        loadPropertyFile("config.properties");
        DruidPlugin dp = new DruidPlugin(getProperty("jdbcUrl"),
                getProperty("user"), getProperty("password"));
        me.add(dp);
        ActiveRecordPlugin arp = new ActiveRecordPlugin(dp);
        me.add(arp);
//        arp.addMapping("user","user_id", User.class);
        arp.addMapping("haihuiyuan",Haihuiyuan.class);
    }

    @Override
    public void configInterceptor(Interceptors me) {
    }

    @Override
    public void configHandler(Handlers me) {
    }
}
