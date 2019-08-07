package mybatis;

import com.jee.ssm.model.Admin;
import com.jee.ssm.model.RolePower;
import com.jee.ssm.modules.ssm.services.BaseService;
import org.junit.Test;
import org.mybatis.generator.api.ShellRunner;
import java.lang.annotation.Annotation;
import java.lang.reflect.Field;

/**
 * Created by GaoXiang
 */
public class JavaTest extends BaseService<Admin> {

    @Test
    public void test0() {

        Double a = 10.0;
        Double b = 100.0;
        Double c = a/b;
        System.out.println(c);
    }


    @Test
    public void test1() {

        Admin admin = new Admin();
        try {
            //insert(admin);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }


    @Test
    public void test2() {
        Field[] fields = RolePower.class.getDeclaredFields();

        for(Field field : fields){
            Annotation[] allAnnotations = field.getAnnotations();
            System.out.println(field.getName()+":");
            for(Annotation annotation : allAnnotations){
                Class annotationType = annotation.annotationType();

                System.out.println(annotationType);
            }
        }

    }

    @Test
    public void test3(){
        String xmlPath= "D:\\work\\ideaProject\\ssmjee\\src\\main\\resources\\generatorConfig.xml";
        String[] args = {"-configfile",xmlPath};
        ShellRunner shellRunner = new ShellRunner();
        shellRunner.main(args);
    }

}
