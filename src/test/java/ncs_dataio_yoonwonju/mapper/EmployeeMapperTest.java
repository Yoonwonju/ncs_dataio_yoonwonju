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
import ncs_dataio_yoonwonju.dto.Employee;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = { ControllerConfig.class })
@FixMethodOrder(MethodSorters.NAME_ASCENDING)
public class EmployeeMapperTest {

	protected static final Log log = LogFactory.getLog(EmployeeMapperTest.class);
	
	@Autowired
	private EmployeeMapper mapper;

	@After
	public void tearDown() throws Exception {
		System.out.println();
	}
	
	@Test
	public void test01SelectEmployeeAll() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		List<Employee> list = mapper.selectEmployeeAll();
		Assert.assertNotNull(list);
		list.forEach(Employee -> log.debug(Employee.toString()));
	}

	@Test
	public void test02SelectEmployeeByNo() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
		Employee selecteEmp = mapper.selectEmployeeByNo(1003);
		Assert.assertNotNull(selecteEmp);
		log.debug(selecteEmp.toString());
	}

	@Test
	public void test03InsertEmployee() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
        Employee insertEmpl = new Employee(9999, "인서트", "사원", new Employee(4377), 5555555, new Department(3));
        int res = mapper.insertEmployee(insertEmpl);
        Assert.assertEquals(1, res);
        log.debug(insertEmpl.toString());
	}

	@Test
	public void test04UpdateEmployee() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
        Employee updateEmpl = new Employee(9999, "EMP업뎃", "대리", new Employee(3426), 8888888, new Department(2));
        int res = mapper.updateEmployee(updateEmpl);
        Assert.assertEquals(1, res);
        log.debug(updateEmpl.toString());
	}

	@Test
	public void test05DeleteEmployee() {
		log.debug(Thread.currentThread().getStackTrace()[1].getMethodName() + "()");
        Employee deleteEmpl = new Employee(9999);
        int res = mapper.deleteEmployee(deleteEmpl);
        Assert.assertEquals(1, res);
        log.debug(deleteEmpl.toString());
	}

}
