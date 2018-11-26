/**
 * Created by ${邹} on 2018/11/21.
 */
//显示数据及分页
$(function(){
    getData(1);
});
function getData(page_num){
    var _data = "page_num=" + page_num + "&page_size=1";
    $.ajax({
        url:"/api/contents/list",
        type:"get",
        dataType:"json",
        cache:false,//去掉缓存
        xhrFields:{
            withCredentials:true
        },
        data:_data,
        success: function (result) {
            if (result.code == 200) {
                initData(result.data);
                // window.location.href = "/index";
            }
        }
    });
    $("#list").html(tr_str);
    $(".M-box").pagination({
        pageCount: data.pages,
        current: data.pageNum,
        callback: 'pageselectCallback',
        prevContent: "上一页",
        nextContent: "下一页",
        jump: true,
        coping: true,
        callback: function (api) {
            getData(api.getCurrent())
        }
    });
}


// 搜索
function search(page_num){
    var _data = "page_num=" + page_num + "&page_size=1";
    $.ajax({
        url: "/api/contents/selectByTitle",
        type: "get",
        data: $("#search").serialize(),
        dataType:"json",
        cache:false,//去掉缓存
        xhrFields:{
            withCredentials:true
        },
        beforeSend: function() {
        },
        complete: function() {
        },
        success: function (result) {
            if (result.code == 200) {
                initData(result.data);
            } else {
                alert(result.msg);
            }
        },error: function (result) {
            alert("网络连接失败！");
        }
    });
}
function initData(data) {
    var list = data.list;
    // var uId = [[${session.user.uId}]];
    // alert(uId);
    var tr_str = "<ul>" + "</ul>";
    for (var i = 0; i < list.length; i++) {
        var users = list[i].users;
        var categories = list[i].categories;
        var  comments = list[i].comments;
        for (var x = 0; x < 1; x++) {
            tr_str += "<ul  data-id='" + list[i].id + "'>" +
                "<li id='title'>" + list[i].title + "</li>" +
                "<li>" + list[i].content + "</li>" +
                "<ul id='information'>" +
                "<li>" + '发表时间：'+list[i].time + "</li>" +
                "<li>" + '作者：'+users[x].username + "</li>" +
                "<li >" + '类别：'+categories[x].name + "</li>" +
                "<li ><a href='#'>点赞</a></li>" +
                "<li ><a href='#'>收藏</a></li>" +
                "<li ><a href='#'>转发</a></li>" +
                "</ul>" +
                "<br><br><br><br></ul>"+
                "<ul><div id='comment'>" +
                "<li>"+comments[x].content +'评论时间：'+comments[x].time+"</li>"+
                "<li>"+"</li>"+
                + "</div></ul>"+
                "<div>" +
                "<form><input type='text' name='uId' ><textarea rows='10' cols='80%'></textarea><br><input type='button' onclick='comment()' value='提交'></form>" +
                "</div>";
        }
    }
    $("#list").html(tr_str);
    $(".M-box").pagination({
        pageCount: data.pages,
        current: data.pageNum,
        callback: 'pageselectCallback',
        prevContent: "上一页",
        nextContent: "下一页",
        jump: true,
        coping: true,
        callback: function (api) {
            getData(api.getCurrent())
        }
    });
}
function userIndex() {
    window.location.href = "/user/index";
}
function comment(){
/*alert(11);
    $.ajax({
        url: "/api/user/update",
        type: "post",
        data: new FormData($("#update")[0]),
        dataType: "json",
        cache: false, // 上传文件无需缓存
        processData: false, // 用于对data参数进行序列化处理 这里必须false
        contentType: false, // 必须
        beforeSend: function() {
        },
        complete: function() {
        },
        success: function (result) {
            alert(result.msg);
            if (result.code == 200) {
                window.location.href = "/user/index";
            }
        },error: function (result) {
            alert("网络连接出错！");
        }
    });*/

}