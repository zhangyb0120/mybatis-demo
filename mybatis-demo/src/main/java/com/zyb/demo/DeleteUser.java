package com.zyb.demo;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;

/**
 *
 */
public class DeleteUser
{
    private static SqlSessionFactory factory = null;
    
    static
    {
        String resource = "mybatis-config.xml";
        
        try
        {
            //读取主配置文件
            Reader reader = Resources.getResourceAsReader(resource);
            //创建SqlSessionFactory对象
            factory = new SqlSessionFactoryBuilder().build(reader);
        }
        catch (IOException e)
        {
            e.printStackTrace();
        }
    }
    
    public static void main(String[] args)
    {
        SqlSession sqlSession = factory.openSession();
        int count = 0;


        try
        {
            count = sqlSession.insert("com.zyb.mapper.UserMapper.deleteById", 1012);

            // 提交事务
            sqlSession.commit();
        }
        catch (Exception e)
        {
            e.printStackTrace();
        }
        finally
        {
            sqlSession.close();
        }

        System.out.println("删除了" + count + "条记录。");
    }
}
