package com.jee.ssm.generator.generator;

import com.jee.ssm.model.*;

/**
 * 生成代码
 * Created by GaoXiang
 */
public class Start {

    public static void main(String[] args) {

        new ModuleConfig("字典",Dict.class).startGenerator("t");

        //new ModuleConfig("城市",City.class).startGenerator("t");

       /* new ModuleConfig("日志",Log.class).startGenerator("t");

        new ModuleConfig("小区",Residence.class).startGenerator("d");
        new ModuleConfig("楼栋",Building.class).startGenerator("d");
        new ModuleConfig("单元",Unit.class).startGenerator("d");
        new ModuleConfig("房间",Room.class).startGenerator("d");
        new ModuleConfig("住户",Owner.class).startGenerator("d");
        new ModuleConfig("设备",Equipment.class).startGenerator("d");
        new ModuleConfig("门禁",Card.class).startGenerator("d");*/

    }
}
