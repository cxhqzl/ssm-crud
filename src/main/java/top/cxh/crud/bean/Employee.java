package top.cxh.crud.bean;

import javax.validation.constraints.Pattern;

public class Employee {
    private Integer empId;

    @Pattern(regexp="(^[a-zA-Z0-9_-]{6,16}$)|(^[\\u2E80-\\u9FFF]{2,5})"
    		,message="员工名称为2-5位中文或6-16为英文和数字的组合")
    private String empName;

    private String gendef;

    @Pattern(regexp="^([a-z0-9_\\.-]+)@([\\da-z\\.-]+)\\.([a-z\\.]{2,6})$"
    		,message="邮箱格式不正确")
    private String email;

    private Integer dId;
    
    private Department department;

    
    
    public Employee() {
		super();
	}

	

	public Employee(Integer empId, String empName, String gendef, String email, Integer dId) {
		super();
		this.empId = empId;
		this.empName = empName;
		this.gendef = gendef;
		this.email = email;
		this.dId = dId;
	}



	public Integer getEmpId() {
        return empId;
    }

    public void setEmpId(Integer empId) {
        this.empId = empId;
    }

    public String getEmpName() {
        return empName;
    }

    public void setEmpName(String empName) {
        this.empName = empName == null ? null : empName.trim();
    }

    public String getGendef() {
        return gendef;
    }

    public void setGendef(String gendef) {
        this.gendef = gendef == null ? null : gendef.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public Integer getdId() {
        return dId;
    }

    public void setdId(Integer dId) {
        this.dId = dId;
    }

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}



	@Override
	public String toString() {
		return "Employee [empId=" + empId + ", empName=" + empName + ", gendef=" + gendef + ", email=" + email
				+ ", dId=" + dId + "]";
	}
	
}