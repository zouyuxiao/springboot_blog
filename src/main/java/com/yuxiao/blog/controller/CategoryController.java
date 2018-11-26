package com.yuxiao.blog.controller;

import com.github.pagehelper.PageHelper;
import com.yuxiao.blog.bean.Category;
import com.yuxiao.blog.bean.MyPageInfo;
import com.yuxiao.blog.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Map;

/**
 * Created by ${邹} on 2018/11/3.
 * 描述：
 */
@Controller
@RequestMapping("/api/category/")
public class CategoryController extends BaseApiController {
    @Autowired
    private CategoryService categoryService;

    // 查询所有分类
    @GetMapping("list")
    @ResponseBody
    public Map<String,Object> list(@RequestParam(defaultValue = "1")Integer page_num,
                                   @RequestParam(defaultValue = "10")Integer page_size){
        PageHelper.startPage( page_num,page_size );
        return onDataResp( new MyPageInfo<Category>( categoryService.list()));
    }

    // 根据id 查询分类
    @GetMapping("selectById/{id}")
    public String selectById(@PathVariable Long id, Model model){
        List<Category> categories = categoryService.selectById( id );
        model.addAttribute( "categories" ,categories);
        return "/admin/update_category";
    }

    // 根据分类名模糊查询分类
    @GetMapping("selectByName")
    public Map<String,Object> selectByName(@RequestParam(defaultValue = "1")Integer page_num,
                                         @RequestParam(defaultValue = "10")Integer page_size,
                                         @RequestParam String name){
        PageHelper.startPage( page_num,page_size );
        return onDataResp( new MyPageInfo<Category>( categoryService.listByName( name )));
    }

    // 添加分类
    @PostMapping("add")
    public String add(@RequestParam String name,Model model){
        if (name == null || name.trim().length() == 0){
            model.addAttribute( "name","分类名不能为空" );
            return "/admin/add_category";
        }
        Category eistName = categoryService.selectName( name );
        if (eistName != null) {
            model.addAttribute( "name","分类已存在" );
            return "/admin/add_category";
        }
        Category category = new Category();
        category.setName( name );
        categoryService.add( category );
        return "/admin/category";
    }

    // 删除分类
    @GetMapping("delete")
    @ResponseBody
    public Map<String,Object> delete(@RequestParam Long id){
        categoryService.delete( id );
        return onSuccessRep( "删除成功" );
    }

    // 修改分类
    @PostMapping("update")
    public String update(@RequestParam String name, @RequestParam Long id,Model model){
        if (name == null || name.trim().length() == 0){
            model.addAttribute( "name", "分类名不能为空");
            return "/admin/update_category";
        }
        Category category = new Category();
        category.setId( id );
        category.setName( name );
        categoryService.update( category );
        return "/admin/category";
    }

}
