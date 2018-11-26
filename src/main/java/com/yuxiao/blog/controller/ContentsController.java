package com.yuxiao.blog.controller;

import com.github.pagehelper.PageHelper;
import com.yuxiao.blog.bean.Category;
import com.yuxiao.blog.bean.Comment;
import com.yuxiao.blog.bean.Contents;
import com.yuxiao.blog.bean.MyPageInfo;
import com.yuxiao.blog.service.CategoryService;
import com.yuxiao.blog.service.ContentsService;
import com.yuxiao.blog.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * Created by ${邹} on 2018/11/3.
 * 描述：博客内容
 */
@Controller
@RequestMapping("/api/contents/")
public class ContentsController extends BaseApiController{
    @Autowired
    private ContentsService contentsService;
    @Autowired
    private CategoryService categoryService;
    @Autowired
    private UserService userService;
    // 查询所有内容信息
    @GetMapping("list")
    @ResponseBody
    public Map<String,Object> listReception(@RequestParam(defaultValue = "1")Integer page_num,
                                   @RequestParam(defaultValue = "10")Integer page_size,Contents contents){
        PageHelper.startPage( page_num,page_size );
        return onDataResp(new MyPageInfo< Contents>(contentsService.list(contents)));
    }

    // 查询所有内容信息前台
    @GetMapping("listReception")
    public String list(Model model, @ModelAttribute Contents contents1,
                       @RequestParam(defaultValue = "1")Integer page_num,
                       @RequestParam(defaultValue = "1")Integer page_size){
        PageHelper.startPage( page_num,page_size );
        MyPageInfo<Contents> contents = new MyPageInfo<Contents>( contentsService.list( contents1 ));
        model.addAttribute( "contents",contents );
        return "index";
    }

    // 通过标题模糊查询内容 未完成
/*    @GetMapping("selectByTitle")
    public String selectByTitle(@RequestParam(defaultValue = "1")Integer page_num,
                                @RequestParam(defaultValue = "5")Integer page_size,
                                @RequestParam String title, Model model){
        PageHelper.startPage( page_num,page_size );
        List<Contents> contentsMyPageInfo = contentsService.selectByTitle( title );
        model.addAttribute( "contents",contentsMyPageInfo );
        return "list_by_title";
    }*/
    @GetMapping("selectByTitle")
    @ResponseBody
    public Map<String, Object> selectByTitle(@RequestParam(defaultValue = "1")Integer page_num,
                                             @RequestParam(defaultValue = "5")Integer page_size,
                                             @RequestParam String title, Model model){
        PageHelper.startPage( page_num,page_size );
        return onDataResp( new MyPageInfo<Contents>( contentsService.selectByTitle( title ) ) );
    }

    // 添加内容
    @PostMapping("add")
    public String add(@RequestParam String title, @RequestParam String content,
                      @RequestParam Long uId, @RequestParam String status,
                      @RequestParam Long cId,Model model){
        if (title == null || title.trim().length() == 0){
            model.addAttribute( "msg","标题不能为空" );
            return "/user/write_blog";
        }
        if (content == null || content.trim().length() == 0){
            model.addAttribute( "msg","内容不能为空" );
            return "/user/write_blog";
        }
        if (uId == null) {
            model.addAttribute( "msg","用户id不能为空"  );
            return "/user/write_blog";
        }
        if (status == null || status.trim().length() == 0) {
            model.addAttribute( "msg","状态不能为空" );
            return "/user/write_blog";
        }
        if (cId == null) {
            model.addAttribute( "msg","分类id不能为空" );
            return "/user/write_blog";
        }
        Contents contents = new Contents();
        contents.setTitle( title );
        contents.setContent( content );
        contents.setuId( uId );
        contents.setTime( new Date());
        contents.setStatus( status );
        contents.setcId( cId );
        if (contentsService.add( contents ) > 0){
            return "index";
        }
        return "/user/write_blog";
    }

    // 修改
    @PostMapping("update")
    public Map<String,Object> update(@RequestParam String title,@RequestParam String content,
                                  @RequestParam Long uId,@RequestParam String status,@RequestParam Long cId,
                                     @RequestParam Long id){
        if (title == null || title.trim().length() == 0) return onBadResp( "标题不能为空" );
        if (content == null || content.trim().length() == 0) return onBadResp( "内容不能为空" );
        if (uId == null) return onBadResp( "用户id不能为空" );
        if (status == null || status.trim().length() == 0) return onBadResp( "状态不能为空" );
        if (cId == null) return onBadResp( "分类id不能为空" );
        Contents contents = new Contents();
        contents.setId( id );
        contents.setTitle( title );
        contents.setContent( content );
        contents.setuId( uId );
        contents.setTime( new Date());
        contents.setStatus( status );
        contents.setcId( cId );
        contentsService.update( contents );
        return onSuccessRep( "修改成功" );
    }

    // 修改状态
    @PostMapping("updateStatus")
    public Map<String,Object> updateStatus(@RequestParam String status,@RequestParam Long id){
        if (status == null || status.trim().length() == 0) return onBadResp( "状态不能为空" );
        Contents contents = new Contents();
        contents.setId( id );
        contents.setStatus( status );
        contentsService.updateStatus( contents );
        return onSuccessRep( "修改成功" );
    }

    // 删除
    @GetMapping("delete")
    @ResponseBody
    public Map<String,Object> delete(@RequestParam Long id){
        if (contentsService.delete( id ) > 0) return onSuccessRep( "删除成功" );
        return onBadResp( "删除失败" );
    }

    // 根据id查询
    @GetMapping("selectById/{id}")
    @ResponseBody
    public Map<String,Object> selectById(@PathVariable Long id,HttpSession session,
                                         @RequestParam(defaultValue = "1")Integer page_num,
                                         @RequestParam(defaultValue = "10")Integer page_size){
        PageHelper.startPage( page_num,page_size );
        return onDataResp(new MyPageInfo< Contents>(contentsService.selectById( id )));
    }

    // 编写博客
    @GetMapping("/writeBlog/{id}")
    public String writeBlog(Model model,@PathVariable Long id){
        Long uId = id;
        model.addAttribute( "uid",uId );
        List<Category> categoryList = categoryService.list();
        model.addAttribute( "category",categoryList);
        return "/user/write_blog";
    }
    // 根据博客查询所有评论
    @GetMapping("selectByContentId/{id}")
    @ResponseBody
    public Map<String,Object> selectContentById(@PathVariable Long id,
                                         @RequestParam(defaultValue = "1")Integer page_num,
                                         @RequestParam(defaultValue = "10")Integer page_size){
        PageHelper.startPage( page_num,page_size );
        return onDataResp(new MyPageInfo<Comment>(contentsService.selectByContentId( id )));
    }

    // 根据博客查询评论
    @GetMapping("selectByIdComment/{id}")
    @ResponseBody
    public Map<String,Object> comment(@PathVariable Long id){
        List<Contents> contents = contentsService.selectByIdComment( id );
        return onDataResp( contents );
    }
    @GetMapping("selectComment/{id}")
    @ResponseBody
    public Map<String,Object> selectComment(@PathVariable Long id ,
                                            @RequestParam(defaultValue = "1")Integer page_num,
                                            @RequestParam(defaultValue = "10")Integer page_size){
        PageHelper.startPage( page_num,page_size );
        return onDataResp(new MyPageInfo<Comment>(contentsService.selectComment( id )));
    }
}
