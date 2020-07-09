package top.cxh.crud.test;

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

import com.github.pagehelper.PageInfo;

import top.cxh.crud.bean.Employee;

/**
 * 请求测试
 * @author cxhqz
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:springmvc.xml"})
public class MvcTest {
	
	//传入springmvc的ioc
	@Autowired
	WebApplicationContext context;

	//虚拟MVC请求
	MockMvc mockMvc;
	
	@Before
	public void initMockMvc() {
		mockMvc = MockMvcBuilders.webAppContextSetup(context).build();
	}
	
	@Test
	public void testPage() throws Exception {
		MvcResult result = mockMvc.perform(MockMvcRequestBuilders.get("/emps").param("pn", "5")).andReturn();
		MockHttpServletRequest res = result.getRequest();
		PageInfo pageInfo = (PageInfo) res.getAttribute("pageInfo");
		System.out.println("当前页码" + pageInfo.getPageNum());
		System.out.println("总页码" + pageInfo.getPages());
		System.out.println("总记录" + pageInfo.getTotal());
		System.out.println("在页面需要连续显示的页码：");
		int[] nums = pageInfo.getNavigatepageNums();
		for(int i : nums) {
			System.out.print("   " + i);
		}
		System.out.println("****员工信息*****");
		List<Employee> list = pageInfo.getList();
		for(Employee e : list) {
			System.out.println(e.toString() + ":" + e.getDepartment().toString());
		}
	}
	
}
