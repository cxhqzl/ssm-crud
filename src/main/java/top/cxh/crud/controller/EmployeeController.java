package top.cxh.crud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.cxh.crud.bean.Employee;
import top.cxh.crud.bean.Msg;
import top.cxh.crud.service.EmployeeService;

/**
 * 处理员工crud请求
 * @author cxhqz
 *
 */
@Controller
public class EmployeeController {

	@Autowired
	EmployeeService employeeService;
	
	
	@RequestMapping(value="/emp/{empIds}",method = RequestMethod.DELETE)
	@ResponseBody
	public Msg deleteEmpById(@PathVariable("empIds") String empIds) {
		boolean flag = false;
		if(empIds.contains("-")) {
			String[] ids = empIds.split("-");
			List<Integer> emp_ids = new ArrayList<Integer>();
			for (String id : ids) {
				emp_ids.add(Integer.parseInt(id));
			}
			flag = employeeService.deleteEmps(emp_ids);
			if(flag) {
				return Msg.success();
			}else {
				return Msg.fail();
			}
		}else {
			Integer empId = Integer.parseInt(empIds);
			flag = employeeService.deleteEmpById(empId);
			if(flag) {
				return Msg.success();
			}else {
				return Msg.fail();
			}
		}
		
	}
	/**
	 * 员工更新
	 * @param employee
	 * @return
	 */
	@RequestMapping(value="/emp/{empId}",method = RequestMethod.PUT)
	@ResponseBody
	public Msg updateEmp(Employee employee) {
		boolean flag = employeeService.updateEmp(employee);
		if(flag) {
			return Msg.success();
		}else {
			return Msg.fail();
		}
	}
	
	/**
	 * 获取单个员工
	 * @param empName
	 * @return
	 */
	@RequestMapping(value="/emp/{id}",method = RequestMethod.GET)
	@ResponseBody
	public Msg getEmp(@PathVariable("id") Integer id) {
		Employee e = employeeService.getEmp(id);
		return Msg.success().add("emp", e);
	}
	
	/**
	 * 检验用户名
	 * @param empName
	 * @return
	 */
	@RequestMapping(value="/checkUser")
	@ResponseBody
	public Msg checkUser(String empName) {
		boolean flag = employeeService.checkUser(empName);
		if(flag) {
			return Msg.success();
		}else {
			return Msg.fail();
		}
	}
	/**
	 * 添加用户
	 * @param employee
	 * @param result
	 * @return
	 */
	@RequestMapping(value="/emp",method=RequestMethod.POST)
	@ResponseBody
	public Msg saveEmp(@Valid Employee employee,BindingResult result) {
		if(result.hasErrors()) {
			Map<String,Object> map = new HashMap<String,Object>();
			List<FieldError> errors = result.getFieldErrors();
			for (FieldError fieldError : errors) {
				map.put(fieldError.getField(), fieldError.getDefaultMessage());
			}
			return Msg.fail().add("errorFields", map);
		}else {
			employeeService.saveEmp(employee);
			return Msg.success();
		}
	}
	/**
	 * 获取用户
	 * @param pn
	 * @return
	 */
	@RequestMapping("/emps")
	@ResponseBody
	public Msg getEmpsWithJson(@RequestParam(value = "pn", defaultValue = "1") Integer pn) {
		//使用pageHelper分页插件分页查询
		//参数：开始页，一页数量
		PageHelper.startPage(pn, 5);
		List<Employee> emps = employeeService.getAll();
		//使用pageInfo获取查询结果信息
		PageInfo<Employee> page = new PageInfo<Employee>(emps, 5);
		return Msg.success().add("pageInfo", page);
	}
	
	//@RequestMapping("/emps")
	public String getEmps(@RequestParam(value="pn",defaultValue="1") Integer pn,
						Model model) {
		//使用pageHelper分页插件分页查询
		//参数：开始页，一页数量
		PageHelper.startPage(pn,5);
		List<Employee> emps = employeeService.getAll();
		//使用pageInfo获取查询结果信息
		PageInfo<Employee> page = new PageInfo<Employee>(emps,5);
		model.addAttribute("pageInfo",page);
		return "list";
	}
	
}
