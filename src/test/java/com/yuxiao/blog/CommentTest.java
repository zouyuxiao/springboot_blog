package com.yuxiao.blog;

import com.yuxiao.blog.bean.Comment;
import com.yuxiao.blog.service.CommentService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.Date;
import java.util.List;

/**
 * Created by ${邹} on 2018/10/31.
 * 描述：
 */
@RunWith(SpringRunner.class)
@SpringBootTest
public class CommentTest {
    @Autowired
    private CommentService commentService;
    @Test
    public void list(){
        List<Comment> comments = commentService.list();
        System.out.println( comments );
    }
    @Test
    public void selectById(){
        Long id = Long.valueOf( 1 );
        List<Comment> comments = commentService.selectById( id );
        System.out.println( comments );
    }
    @Test
    public void add(){
        Comment comment = new Comment();
        comment.setContent( "测试" );
        comment.setTime( new Date());
        comment.setuId( (long) 1 );
//        commentService.add( comment );
        commentService.update( comment );
    }
}
