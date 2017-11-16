<%@page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8" %>
<html>
<header>
    <script type="application/javascript" src="../js/jquery-1.8.3.js">
    </script>
</header>
<body>
<h2>信息列表</h2>
<form action="" method="post">
    <table>
        <tr width="100%">
            <td width="50%">
                <select id = "site" name = "site" style="width:150">
                    <option value="1">1座</option>
                    <option value="2">2座</option>
                    <option value="3">3座</option>
                    <option value="4">4座</option>
                    <option value="5">5座</option>
                    <option value="6">6座</option>
                    <option value="7">7座</option>
                    <option value="8">8座</option>
                    <option value="9">9座</option>
                    <option value="10">10座</option>
                    <option value="11">11座</option>
                    <option value="12">12座</option>
                    <option value="13">13座</option>
                    <option value="14">14座</option>
                    <option value="15">15座</option>
                    <option value="16">16座</option>
                    <option value="17">17座</option>
                    <option value="18">18座</option>
                    <option value="19">19座</option>
                    <option value="20">20座</option>
                    <option value="21">21座</option>
                    <option value="22">22座</option>
                    <option value="23">23座</option>
                    <option value="24">24座</option>
                    <option value="25">25座</option>
                    <option value="26">26座</option>
                </select><span style="color: red;;font-size:10;">*必填</span>
            </td>
            <td width="50%"><input type="text" placeholder="房号" name="room_num" id="room_num" maxlength="4"style="width:150"><span style="color: red;font-size:10;">*必填</span></td>
        </tr>
        <tr width="100%">
            <td width="50%">
                <input type="text" placeholder="名字"  name="name" id="name" maxlength="50"style="width:150"><span style="color: red;;font-size:10;">*必填</span>
            </td>
            <td>
                <input type="text" placeholder="手机号"  name="mobile" id="mobile" maxlength="11"style="width:150">
            </td>
        </tr>
        <tr width="100%">
            <td>
                <input type="text" placeholder="微信帐号"  name="weixin" id="weixin" maxlength="50"style="width:150">
            </td>

            <td width="50%">
                <textarea  name="remark" id="remark" placeholder="备注" cols="20" rows="5"></textarea>
            </td>
        </tr>
    </table>
    <input type="button" value="提交" onclick="saveInfo()">
</form>

<form>

    <div>
        <select id = "seartSite" name = "site" >
            <option value="">选择座次</option>
            <option value="1">1座</option>
            <option value="2">2座</option>
            <option value="3">3座</option>
            <option value="4">4座</option>
            <option value="5">5座</option>
            <option value="6">6座</option>
            <option value="7">7座</option>
            <option value="8">8座</option>
            <option value="9">9座</option>
            <option value="10">10座</option>
            <option value="11">11座</option>
            <option value="12">12座</option>
            <option value="13">13座</option>
            <option value="14">14座</option>
            <option value="15">15座</option>
            <option value="16">16座</option>
            <option value="17">17座</option>
            <option value="18">18座</option>
            <option value="19">19座</option>
            <option value="20">20座</option>
            <option value="21">21座</option>
            <option value="22">22座</option>
            <option value="23">23座</option>
            <option value="24">24座</option>
            <option value="25">25座</option>
            <option value="26">26座</option>
        </select>
        <input type="button" value="查询" onclick="getInfoList()">
    </div>
    <table id ="listTable" width="100%">

    </table>
</form>


<script>
    function getInfoList(){
        $("#listTable").empty();
        $("#listTable").append(" <tr><td>座次</td><td>房号</td><td>名字</td><td>微信号</td></tr>")
        $.get("/excel/getHaihuiyuanInfo",{"site":$("#seartSite").val()},function(res){
            $.each(res,function(n,item){
                $("#listTable").append(" <tr><td>"+item.site+"</td><td>"+item.room_num+"</td><td>"+item.name+"</td><td>"+item.weixin+"</td></tr>")
            })
        })
    }
    function saveInfo(){
        if($("#site").val()==""){
            alert("座次不能为空！");
            return;
        }
        if($("#room_num").val()==""){
            alert("房间号不能为空！");
            return;
        }
        if($("#name").val()==""){
            alert("贵姓啊美女帅哥！");
            return;
        }

        $.post("/excel/saveHaihuiyuan",{
            "site":$("#site").val(),
            "room_num":$("#room_num").val(),
            "name":$("#name").val(),
            "remark":$("#remark").val(),
            "mobile":$("#mobile").val(),
            "weixin":$("#weixin").val()
        },function(res){
            if(res.code==1){
                alert("已经有人录入了该房间号，请搜索查看");
            }else{
                getInfoList();
            }
        })
    }
    getInfoList();
</script>
</body>
</html>
