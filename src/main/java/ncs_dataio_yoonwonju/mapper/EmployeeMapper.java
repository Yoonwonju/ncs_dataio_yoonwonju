package ncs_dataio_yoonwonju.mapper;

import java.util.List;

import ncs_dataio_yoonwonju.dto.Employee;

public interface EmployeeMapper {
	List<Employee> selectEmployeeAll();
	Employee selectEmployeeByNo(int empNo);
	int insertEmployee(Employee employee);
	int updateEmployee(Employee employee);
	int deleteEmployee(Employee employee);
}