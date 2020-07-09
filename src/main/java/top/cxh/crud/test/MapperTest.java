package top.cxh.crud.test;

import java.util.List;
import java.util.UUID;

import org.apache.ibatis.session.SqlSession;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import top.cxh.crud.bean.Department;
import top.cxh.crud.bean.Employee;
import top.cxh.crud.bean.EmployeeExample;
import top.cxh.crud.dao.DepartmentMapper;
import top.cxh.crud.dao.EmployeeMapper;

/**
 * 测试
 * @author cxhqzs
 *
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:applicationContext.xml"})
public class MapperTest {
	
	@Autowired
	DepartmentMapper departmentMapper;
	
	@Autowired
	EmployeeMapper employeeMapper;
	
	@Autowired
	SqlSession sqlSession;

	@Test
	public void testCrud() {
		//创建SpringIOC容器
		ApplicationContext ioc = new ClassPathXmlApplicationContext("applicationContext.xml");
		//从容器中获取mapper
		/*
		 * EmployeeMapper e_bean = (EmployeeMapper) ioc.getBean(Employee.class);
		 * Employee e = new Employee("大海","男","","");
		 */
		/*
		 * DepartmentMapper bean = (DepartmentMapper) ioc.getBean(Department.class);
		 * Department d = new Department(); d.setDeptName("研发部"); int res =
		 * bean.insertSelective(d); System.out.println(res);
		 */
		System.out.println(departmentMapper);
		
		/*部门插入*/
		/*
		 * Department d = new Department(null,"研发部");
		 * departmentMapper.insertSelective(d); departmentMapper.insertSelective(new
		 * Department(null, "测试部"));
		 */
		
		
		
		/*员工插入*/
		/*
		 * employeeMapper.insertSelective(new Employee(null, "曹", "M", "cxh@163.com",
		 * 1)); employeeMapper.insertSelective(new Employee(null, "张", "F",
		 * "cxh@163.com", 1)); employeeMapper.insertSelective(new Employee(null, "马",
		 * "F", "cxh@163.com", 1)); employeeMapper.insertSelective(new Employee(null,
		 * "王", "F", "cxh@163.com", 2)); employeeMapper.insertSelective(new
		 * Employee(null, "刘", "M", "cxh@163.com", 2));
		 */
		/*
		 * EmployeeMapper e_mapper = sqlSession.getMapper(EmployeeMapper.class); for(int
		 * i=0;i<50;i++){ String uid=UUID.randomUUID().toString().substring(0,5)+i;
		 * e_mapper.insertSelective(new Employee(null,uid,"M",uid+"@shuwei.com",1)); }
		 * System.out.println("批量完成");
		 */
		/*员工查询*/
		/*
		 * EmployeeExample e_e = new EmployeeExample();
		 * 
		 * List<Employee> res = employeeMapper.selectByExampleWithDept(null);
		 * System.out.println(res.get(0).toString());
		 */
	}
	
}
