package com.core.generator.plugins;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.generator.api.IntrospectedTable;
import org.mybatis.generator.api.PluginAdapter;
import org.mybatis.generator.api.dom.java.FullyQualifiedJavaType;
import org.mybatis.generator.api.dom.java.Method;
import org.mybatis.generator.api.dom.java.TopLevelClass;

/**
 * Myabtis Generator Lombok 插件
 * 
 * @author Angzk
 * @date 2019年6月13日
 */
public class LombokAnnotationPlugin extends PluginAdapter {

    @Override
    public boolean validate(List<String> warnings) {
        return true;
    }

    @Override
    public boolean modelBaseRecordClassGenerated(TopLevelClass topLevelClass, IntrospectedTable introspectedTable) {
        topLevelClass.addAnnotation("@Data");
        topLevelClass.addImportedType(new FullyQualifiedJavaType("lombok.Data"));
        List<Method> methods = topLevelClass.getMethods();
        List<Method> remove = new ArrayList<Method>();
        for (Method method : methods) {
            if (method.getBodyLines().size() < 2) {
                remove.add(method);
            }
        }
        methods.removeAll(remove);
        return true;
    }

}