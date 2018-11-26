package com.yuxiao.blog;

import com.yuxiao.blog.bean.User;
import com.yuxiao.blog.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class SpringbootBlogApplicationTests {
	@Autowired
	private UserService userService;
	@Test
	public void contextLoads() {
		User user = new User();
		user.setPhone( "12233333" );
		user.setEmail( "123" );
		user.setPassword( "123" );
		user.setUsername( "12" );
		user.setSex( "1" );
		user.setStatus( "1" );
		userService.reg( user );
		System.out.println( user );
	}

	@Test
	public void deleteUserById(){
			for (int i = 17;i < 41;i++){
				userService.deleteById( (long) i );
			}
	}

	@Test
	public void listUser(){
		List<User> users = userService.list();
		System.out.println( users );
		}
	@Test
	public void update(){
		User user = new User();
		user.setPhone( "12233333" );
		user.setEmail( "123" );
		user.setPassword( "123" );
		user.setUsername( "朱婷" );
		user.setSex( "女" );
		user.setStatus( "1" );
		user.setuId( (long) 22 );
		userService.update( user );
		System.out.println( user );
	}


}
