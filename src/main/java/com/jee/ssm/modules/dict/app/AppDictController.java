package com.jee.ssm.modules.dict.app;

import com.jee.ssm.modules.dict.services.DictService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;

/**
* 字典管理 客户端 Controller
* @author GaoXiang
* @version 1.0
*/
@Controller
@RequestMapping("/app/dict")
public class AppDictController {







    //---------------------------- property -------------------------------

    @Resource
    private DictService dictService;

}
