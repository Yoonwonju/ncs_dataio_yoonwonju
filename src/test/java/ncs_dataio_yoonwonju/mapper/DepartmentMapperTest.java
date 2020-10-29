package ncs_dataio_yoonwonju.mapper;

import java.util.List;

import org.apache.ibatis.logging.Log;
import org.apache.ibatis.logging.LogFactory;
import org.junit.After;
import org.junit.Assert;
import org.junit.FixMethodOrder;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.runners.MethodSorters;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import ncs_dataio_yoonwonju.config.ControllerConfig;
import ncs_dataio_yoonwonju.dto.Department;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ControllerConfig.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class DepartmentMapperTest {

	protected static final Log log = LogFactory.getLog(EmployeeMapperTest.class);

	@Autowired
	private DepartmentMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}

	@Test
	public void test01SelectDepartmentByAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Department> list = mapper.selectDepartmentByAll();
		Assert.assertNotNull(list);
		list.forEach(Department -> log.debug(Department.toString()));
	}

	@Test
	public void test02SelectDepartmentByNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Department selectDept = mapper.selectDepartmentByNo(1);
		Assert.assertNotNull(selectDept);
		log.debug(selectDept.toString());
	}

	@Test
	public void test03InsertDepartment() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Department insertDept = new Department(5, "무역", 11);
		int res = mapper.insertDepartment(insertDept);
		Assert.assertEquals(1, res);
		log.debug(insertDept.toString());
	}

	@Test
	public void test04UpdateDepartment() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Department updateDept = new Department(5, "전산", 22);
		int res = mapper.updateDepartment(updateDept);
		Assert.assertEquals(1, res);
		log.debug(updateDept.toString());
	}
	

	@Test
	public void test05DeleteDepartment() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Department deleteDept = new Department(5);
		int res = mapper.deleteDepartment(deleteDept);
		Assert.assertEquals(1, res);
		log.debug(deleteDept.toString());
	}

}
