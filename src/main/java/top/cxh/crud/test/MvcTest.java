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
 * �������
 * @author cxhqz
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"classpath:applicationContext.xml","classpath:springmvc.xml"})
public class MvcTest {
	
	//����springmvc��ioc
	@Autowired
	WebApplicationContext context;

	//����MVC����
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
		System.out.println("��ǰҳ��" + pageInfo.getPageNum());
		System.out.println("��ҳ��" + pageInfo.getPages());
		System.out.println("�ܼ�¼" + pageInfo.getTotal());
		System.out.println("��ҳ����Ҫ������ʾ��ҳ�룺");
		int[] nums = pageInfo.getNavigatepageNums();
		for(int i : nums) {
			System.out.print("   " + i);
		}
		System.out.println("****Ա����Ϣ*****");
		List<Employee> list = pageInfo.getList();
		for(Employee e : list) {
			System.out.println(e.toString() + ":" + e.getDepartment().toString());
		}
	}
	
}
