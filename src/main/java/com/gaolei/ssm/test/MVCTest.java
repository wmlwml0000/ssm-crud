package com.gaolei.ssm.test;

import java.util.List;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.MvcResult;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import com.gaolei.ssm.bean.Employee;
import com.github.pagehelper.PageInfo;

/*
 * spring4的测试需要servlet-api 3.0以上版本
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={"classpath:spring-bean.xml","classpath:springmvc.xml"})
public class MVCTest {
	@Autowired
	WebApplicationContext context;
	MockMvc mvc; //虚拟springmvc
	
	@Before
	public void initMockMvc(){
		mvc=MockMvcBuilders.webAppContextSetup(context).build();
	}
	@Test
	public void page() throws Exception{
		//服务器端根据浏览器的数据产生的结果
		MvcResult result=mvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "1")).andReturn();
		
		//服务器端返回给浏览器的数据
		MockHttpServletRequest request=result.getRequest();
		PageInfo<Employee> info=(PageInfo<Employee>) request.getAttribute("pageInfo");
		//当前页码
		System.out.println(info.getPageNum());
		//总页码
		System.out.println(info.getPages());
		//每页的个数
		System.out.println(info.getSize());
		//总数量
		System.out.println(info.getTotal());
		//连续显示的页码
		int[]pages=info.getNavigatepageNums();
		for(int i:pages)System.out.print(i+",");
		System.out.println();
		List<Employee> list=info.getList();
		for(Employee e:list){
			System.out.println(e);
		}
	}
}
