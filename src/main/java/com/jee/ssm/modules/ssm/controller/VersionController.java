package com.jee.ssm.modules.ssm.controller;

import com.jee.ssm.model.Version;
import com.jee.ssm.modules.ssm.services.VersionService;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.annotation.Resource;

/**
* 客户端版本 Controller
* @author GaoXiang
* @version 1.0
*/
@Controller
@RequestMapping("/version")
public class VersionController extends AdminBaseController<Version> {







    //---------------------------- property -------------------------------

    @Resource
    private VersionService versionService;

}
