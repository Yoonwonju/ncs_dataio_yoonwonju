package ncs_dataio_yoonwonju.mapper;

import java.util.List;

import ncs_dataio_yoonwonju.dto.Department;

public interface DepartmentMapper {
	List<Department> selectDepartmentByAll();
	Department selectDepartmentByNo(int deptNo);
	int insertDepartment(Department department);
	int updateDepartment(Department department);
	int deleteDepartment(Department department);
}