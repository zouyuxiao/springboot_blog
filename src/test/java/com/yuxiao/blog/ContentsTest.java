package com.yuxiao.blog;

import com.yuxiao.blog.bean.Contents;
import com.yuxiao.blog.service.ContentsService;
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
public class ContentsTest {
    @Autowired
    private ContentsService contentsService;
 /*   @Test
    public void listContents(){
        List<Contents> contents = contentsService.list();
        System.out.println(contents );
    }*/

    @Test
    public void seleteTile(){
        String title = "j";
        List<Contents> contents = contentsService.selectByTitle( title );
        System.out.println(contents );
    }

    @Test
    public void seleteStatus(){
        String status = "2";
        List<Contents> contents = contentsService.selectByStatus( status );
        System.out.println( contents );
    }
    @Test
    public void seleteId(){
        Long id = Long.valueOf( 2 );
        List<Contents> contents = contentsService.selectById( id );
        System.out.println(contents );
    }
    @Test
    public void add(){
        Contents contents = new Contents();
        contents.setId( (long) 2 );
        contents.setTitle( "测试3" );
        contents.setContent( "测试3" );
        contents.setuId( (long) 1 );
        contents.setTime( new Date() );
        contents.setStatus( "1" );
        contents.setcId( (long) 1 );
//        contentsService.add( contents );
        contentsService.update( contents );
    }
}
