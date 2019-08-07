package Spring;

import com.jee.ssm.common.config.Logger;
import com.jee.ssm.model.Role;
import com.jee.ssm.modules.ssm.services.RoleService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import javax.annotation.Resource;

/**
 * @author GaoXiang
 * @version 1.0
 * @since 2016/11/1.
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = "classpath:spring/spring-application.xml")
public class SpringTest {

    @Resource
    private RoleService roleService;

    /**
     * 测试查询
     */
    @Test
    public void findTest(){
        Logger.info("================================= findTest Begin =====================================");
        Role role = roleService.selectById("888888");
        Logger.info(role.getName());
    }

    /**
     * 测试事务
     */
    @Test
    /*    @Transactional   //标明此方法需使用事务
    @Rollback(true)*/
    public void transientTest(){
        Logger.info("================================= transientTest Begin =====================================");
        try {

        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
