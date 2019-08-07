package mybatis;
/**

 * Created by GaoXiang on
 */
import com.jee.ssm.common.config.Logger;
import com.jee.ssm.common.utils.ProjectConfig;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(locations = {"classpath:spring/spring-application.xml"})
public class TestMyBatis {

    @Autowired
    ProjectConfig projectConfig;


    @Test
    public void test1() {
        Logger.info("====================== properties ========================");
        Logger.info("page.size="+projectConfig.getPageSize());
    }

}