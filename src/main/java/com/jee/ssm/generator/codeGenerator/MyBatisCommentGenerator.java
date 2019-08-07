package com.jee.ssm.generator.codeGenerator;

import org.mybatis.generator.api.IntrospectedColumn;
import org.mybatis.generator.api.IntrospectedTable;
import org.mybatis.generator.api.dom.java.*;
import org.mybatis.generator.internal.DefaultCommentGenerator;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * 自定义实体生成策略
 * @author GaoXiang
 * @version 1.0
 * 2016/10/31.
 */
public class MyBatisCommentGenerator extends DefaultCommentGenerator {

    private SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy/MM/dd");

    @Override
    public void addFieldComment(Field field, IntrospectedTable introspectedTable, IntrospectedColumn introspectedColumn) {
        field.addJavaDocLine("/**");
        field.addJavaDocLine(" * " + introspectedColumn.getRemarks());
        field.addJavaDocLine(" * 表字段 : " + introspectedTable.getFullyQualifiedTable() + "." + introspectedColumn.getActualColumnName());
        field.addJavaDocLine(" * Create time " + simpleDateFormat.format(new Date()));
        field.addJavaDocLine(" */");

    }

    @Override
    public void addGeneralMethodComment(Method method, IntrospectedTable introspectedTable) {
        method.addJavaDocLine("/**");
        method.addJavaDocLine(" * 构造方法");
        method.addJavaDocLine(" */");
    }

    @Override
    public void addGetterComment(Method method, IntrospectedTable introspectedTable, IntrospectedColumn introspectedColumn) {

        method.addJavaDocLine("/**");
        method.addJavaDocLine(" * " + introspectedColumn.getRemarks());
        method.addJavaDocLine(" * @return " + introspectedColumn.getActualColumnName() + " " + introspectedColumn.getRemarks());
        method.addJavaDocLine(" */");

    }

    @Override
    public void addSetterComment(Method method, IntrospectedTable introspectedTable, IntrospectedColumn introspectedColumn) {
        Parameter parm = method.getParameters().get(0);
        method.addJavaDocLine("/**");
        method.addJavaDocLine(" * " + introspectedColumn.getRemarks());
        method.addJavaDocLine(" * @param " + parm.getName() + " " + introspectedColumn.getRemarks());
        method.addJavaDocLine(" */");

    }

    @Override
    public void addModelClassComment(TopLevelClass topLevelClass, IntrospectedTable introspectedTable) {
        //添加继承父类
        topLevelClass.addImportedType("com.jee.ssm.model.base.BaseModel");
        topLevelClass.setSuperClass("BaseModel");
        topLevelClass.addJavaDocLine("/**");
        topLevelClass.addJavaDocLine(" * " + introspectedTable.getRemarks());
        topLevelClass.addJavaDocLine(" * 表名 " + introspectedTable.getFullyQualifiedTable());
        topLevelClass.addJavaDocLine(" * @author GaoXiang");
        topLevelClass.addJavaDocLine(" * @version 1.0");
        topLevelClass.addJavaDocLine(" * Create time " + simpleDateFormat.format(new Date()));
        topLevelClass.addJavaDocLine(" */");
    }

}
