package export;

import com.alibaba.druid.util.StringUtils;
import com.jfinal.core.Controller;
import com.jfinal.json.FastJson;
import com.jfinal.kit.HttpKit;
import com.jfinal.plugin.activerecord.SqlPara;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Logger;

/**
 * Created by Yaoyuqi on 2017/11/15.
 */
public class ExportExcelController extends Controller {

    private static Logger logger= Logger.getLogger("controller");

    public void saveHaihuiyuan(){
        Map returnMap = new HashMap();
        Map map = getParaMap();

        Haihuiyuan haihuiyuan= new Haihuiyuan();
        if(getRequest().getParameter("id")!=null){
            haihuiyuan=Haihuiyuan.dao.findById(getRequest().getParameter("id"));
        }else{
            SqlPara sqlPara = new SqlPara();

            String sql = "select * from haihuiyuan where site=? and room_num=?";
            sqlPara.setSql(sql);
            sqlPara.addPara(getRequest().getParameter("site"));
            sqlPara.addPara(getRequest().getParameter("room_num"));
            List<Haihuiyuan> list = Haihuiyuan.dao.find(sqlPara);
            if(list.size()>0){
                returnMap.put("code",1);
                returnMap.put("msg","已经存在该信息");
                renderJson(returnMap);
                return;
            }
        }
        haihuiyuan.set("remark",getRequest().getParameter("remark"));
        haihuiyuan.set("name",getRequest().getParameter("name"));
        haihuiyuan.set("mobile",getRequest().getParameter("mobile"));
        haihuiyuan.set("site",getRequest().getParameter("site"));
        haihuiyuan.set("room_num",getRequest().getParameter("room_num"));
        haihuiyuan.set("weixin",getRequest().getParameter("weixin"));
        haihuiyuan.save();
        render("haihuiyuan.jsp");
    }

    public void getHaihuiyuanInfo(){
        Map map = getParaMap();
        SqlPara sqlPara = new SqlPara();
        StringBuilder sql = new StringBuilder("select * from haihuiyuan where 1=1 ");
        if(!StringUtils.isEmpty(getRequest().getParameter("site"))){
            sql.append(" and site = ?");
            sqlPara.addPara(getRequest().getParameter("site"));
        }
//        sql.append("order by site,room_num");
        sqlPara.setSql(sql.toString());
        List<Haihuiyuan> list = Haihuiyuan.dao.find(sqlPara);
        renderJson(list);
    }

}
