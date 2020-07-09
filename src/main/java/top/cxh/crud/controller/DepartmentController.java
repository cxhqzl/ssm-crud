package top.cxh.crud.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;

import top.cxh.crud.bean.Department;
import top.cxh.crud.bean.Employee;
import top.cxh.crud.bean.Msg;
import top.cxh.crud.service.DepartmentService;

@Controller
public class DepartmentController {

	@Autowired
	private DepartmentService departmentService;
	
	@RequestMapping("/depts")
	@ResponseBody
	public Msg getDepts() {
		List<Department> emps = departmentService.getAll();
		return Msg.success().add("depts", emps);
	}
	
}
