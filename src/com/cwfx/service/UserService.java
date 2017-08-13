package com.cwfx.service;

import java.util.List;

import com.cwfx.model.User;

public interface UserService {
	void updateBy(User user);

	User findOne(Integer id);

	List<User> findAll();

	User findByNamePass(User user);
}
