package com.zyb.demo;

import com.zyb.entity.User;
import com.zyb.mapper.UserMapper;
import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import java.io.IOException;
import java.io.Reader;

/**
 *
 */
public class MapperAddUser
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

        User user = new User();
        try
        {
            user.setLocked(0);
            user.setMobileNumber("13111111111");
            user.setPassword("password");
            user.setRealname("王逻辑");
            user.setUsername("zxx");

            UserMapper userMapper = sqlSession.getMapper(UserMapper.class);
            count = userMapper.save(user);

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

        System.out.println("插入了" + count + "条记录。新User.id=" + user.getId());
    }
}
