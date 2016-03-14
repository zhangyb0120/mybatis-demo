package com.zyb.demo;

import com.zyb.entity.User;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;
import java.util.Random;

/**
 *
 */
public class UpdateUser
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
            User user = sqlSession.selectOne("com.zyb.mapper.UserMapper.findUserById2", 1003);
            if (user != null)
            {
                user.setRealname(user.getRealname() + new Random().nextInt(100));
            }

            count = sqlSession.update("com.zyb.mapper.UserMapper.update", user);

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

        System.out.println("更新了" + count + "条记录。");
    }
}
