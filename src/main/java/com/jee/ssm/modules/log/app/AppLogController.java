package com.jee.ssm.modules.log.app;

import com.jee.ssm.modules.log.services.LogService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;

/**
* 日志管理 客户端 Controller
* @author GaoXiang
* @version 1.0
*/
@Controller
@RequestMapping("/app/log")
public class AppLogController {







    //---------------------------- property -------------------------------

    @Resource
    private LogService logService;

}
