package top.cxh.crud.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import top.cxh.crud.bean.Employee;
import top.cxh.crud.bean.EmployeeExample;
import top.cxh.crud.bean.EmployeeExample.Criteria;
import top.cxh.crud.dao.EmployeeMapper;

@Service
public class EmployeeService {

	@Autowired
	EmployeeMapper employeeMapper;
	//查询
	public List<Employee> getAll(){
		return employeeMapper.selectByExampleWithDept(null);
	}
	//保存员工
	public void saveEmp(Employee employee) {
		employeeMapper.insertSelective(employee);
	}
	//检查用户名是否存在
	public boolean checkUser(String empName) {
		EmployeeExample ex = new EmployeeExample();
		Criteria cr = ex.createCriteria();
		cr.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(ex);
		return count == 0;
	}
	//查询员工by id
	public Employee getEmp(Integer id){
		return employeeMapper.selectByPrimaryKey(id);
	}
	//修改员工
	public boolean updateEmp(Employee employee) {
		int count = employeeMapper.updateByPrimaryKeySelective(employee);
		if(count == 0) {
			return false;
		}else {
			return true;
		}
	}
	//删除单个员工
	public boolean deleteEmpById(Integer empId) {
		int count = employeeMapper.deleteByPrimaryKey(empId);
		if(count == 0) {
			return false;
		}else {
			return true;
		}
	}
	//批量删除员工
	public boolean deleteEmps(List<Integer> empIds) {
		EmployeeExample ex = new EmployeeExample();
		Criteria cr = ex.createCriteria();
		cr.andEmpIdIn(empIds);
		int count = employeeMapper.deleteByExample(ex);
		if(count == 0) {
			return false;
		}else {
			return true;
		}
	}
	
}
