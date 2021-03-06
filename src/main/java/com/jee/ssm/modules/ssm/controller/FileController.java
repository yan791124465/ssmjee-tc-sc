package com.jee.ssm.modules.ssm.controller;

import com.jee.ssm.model.json.Tip;
import com.jee.ssm.common.utils.ProjectConfig;
import com.jee.ssm.common.utils.UUIDFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;

/**
 * 文件上传、管理
 * Created by GaoXiang on 2015/12/28 0028.
 */
@Controller
@RequestMapping("/file")
public class FileController {

    @Autowired
    ProjectConfig projectConfig;

    private String DISK_SANEPATH;

    /**
     * 上传文件到临时文件目录，此目录清空不会影响程序运行和文件丢失。
     * @param file 文件流，单个文件
     * @param model
     * @param request
     * @return
     */
    @RequestMapping("/uploadTempImage")
    @ResponseBody
    public Tip uploadTempImage( @RequestParam(value = "file") MultipartFile file,
                                ModelMap model,
                                HttpServletRequest request) {

        initDir();

        if (file != null) {
            try {
                String fileName = file.getOriginalFilename();
                String saveName = UUIDFactory.getStringId() + fileName.substring(fileName.lastIndexOf("."));
                String filePath = DISK_SANEPATH + saveName;
                file.transferTo(new File(filePath));
                return new Tip(filePath);
            } catch (IOException e) {
                e.printStackTrace();
                return new Tip(2);
            }
        } else {
            return new Tip(1);
        }
    }


    /**
     * 验证地址是否存在
     */
    public void initDir(){

        DISK_SANEPATH = projectConfig.getTempImagePath();

        File file = new File(DISK_SANEPATH);
        //如果文件夹不存在则创建
        if  (!file .exists()  && !file .isDirectory())
        {
            boolean isMk = file .mkdirs();
            System.out.println("目录创建状态：" + isMk);
        }
    }
}
