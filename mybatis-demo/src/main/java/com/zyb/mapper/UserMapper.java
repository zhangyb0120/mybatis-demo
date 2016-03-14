package com.zyb.mapper;

import com.zyb.entity.User;

import java.util.List;

/**
 * 注意： 接口UserMapper 的全路径 必须 和 UserMapper.xml 的 namespace 一致
 */
public interface UserMapper
{
    int save(User user);

    int deleteById(int id);

    User findUserById1(int id);

    User findUserById2(int id);

    User update(User user);

    List<User> findUser();
}
