package com.cwfx.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.cwfx.mapper.MailMapper;
import com.cwfx.model.Mail;
import com.cwfx.model.PageData;
import com.cwfx.service.MailService;

public class MailServiceImpl implements MailService {
	@Autowired
	private MailMapper mailMapper;

	@Override
	public void save(Mail mail) {
		mailMapper.save(mail);
	}

	@Override
	public void update(Mail mail) {
		mailMapper.update(mail);
	}

	@Override
	public List<Mail> findMailByPd(PageData pd) {
		return mailMapper.findMailByPd(pd);
	}

	@Override
	public int getCountByPd(PageData pd) {
		return mailMapper.getCountByPd(pd);
	}

	@Override
	public Mail getOne(Integer id) {
		return mailMapper.getOne(id);
	}

	@Override
	public void delete(Integer id) {
		mailMapper.delete(id);
	}

}
