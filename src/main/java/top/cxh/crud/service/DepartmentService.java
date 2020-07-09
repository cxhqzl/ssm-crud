package top.cxh.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.cxh.crud.bean.Department;
import top.cxh.crud.dao.DepartmentMapper;

@Service
public class DepartmentService {

	@Autowired
	DepartmentMapper departmentMapper;
	
	public List<Department> getAll(){
		return departmentMapper.selectByExample(null);
	}
	
}
