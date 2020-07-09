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
	//��ѯ
	public List<Employee> getAll(){
		return employeeMapper.selectByExampleWithDept(null);
	}
	//����Ա��
	public void saveEmp(Employee employee) {
		employeeMapper.insertSelective(employee);
	}
	//����û����Ƿ����
	public boolean checkUser(String empName) {
		EmployeeExample ex = new EmployeeExample();
		Criteria cr = ex.createCriteria();
		cr.andEmpNameEqualTo(empName);
		long count = employeeMapper.countByExample(ex);
		return count == 0;
	}
	//��ѯԱ��by id
	public Employee getEmp(Integer id){
		return employeeMapper.selectByPrimaryKey(id);
	}
	//�޸�Ա��
	public boolean updateEmp(Employee employee) {
		int count = employeeMapper.updateByPrimaryKeySelective(employee);
		if(count == 0) {
			return false;
		}else {
			return true;
		}
	}
	//ɾ������Ա��
	public boolean deleteEmpById(Integer empId) {
		int count = employeeMapper.deleteByPrimaryKey(empId);
		if(count == 0) {
			return false;
		}else {
			return true;
		}
	}
	//����ɾ��Ա��
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
