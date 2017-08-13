package com.cwfx.mapper;

import java.util.List;

import com.cwfx.model.User;

public interface UserMapper {
	void updateBy(User user);

	User findOne(Integer id);

	List<User> findAll();

	User findByNamePass(User user);
}
