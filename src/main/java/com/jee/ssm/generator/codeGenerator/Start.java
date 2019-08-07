package com.jee.ssm.generator.codeGenerator;

import org.mybatis.generator.api.ShellRunner;

/**
 * 实体Bean文件生成
 * @author GaoXiang
 * @version 1.0
 * @since 2016/10/31.
 */
public class Start {

    public static void main(String[] args) {
        String dir = System.getProperty("user.dir") + "/src/main/java/com/jee/ssm/generator/codeGenerator/generatorConfig.xml";
        String[] param = {"-configfile",dir};
        ShellRunner.main(param);
    }
}
