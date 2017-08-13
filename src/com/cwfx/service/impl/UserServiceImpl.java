package com.cwfx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.cwfx.mapper.UserMapper;
import com.cwfx.model.User;
import com.cwfx.service.UserService;

public class UserServiceImpl implements UserService {
	@Autowired
	private UserMapper userMapper;

	@Override
	public void updateBy(User user) {
		userMapper.updateBy(user);
	}

	@Override
	public User findOne(Integer id) {
		return userMapper.findOne(id);
	}

	@Override
	public List<User> findAll() {
		return userMapper.findAll();
	}

	@Override
	public User findByNamePass(User user) {
		return userMapper.findByNamePass(user);
	}

}
