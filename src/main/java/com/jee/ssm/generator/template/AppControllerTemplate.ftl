package com.jee.ssm.modules.${lower}.app;

import ${servicePackage};
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;

/**
* ${modelName}管理 客户端 Controller
* @author GaoXiang
* @version 1.0
*/
@Controller
@RequestMapping("/app/${lower}")
public class App${upper}Controller {







    //---------------------------- property -------------------------------

    @Resource
    private ${upper}Service ${lower}Service;

}
