package com.cwfx.service;

import java.util.List;

import com.cwfx.model.Mail;
import com.cwfx.model.PageData;

/**
 * 
 * <b></b>
 * 
 * @Description: TODO类的描述
 * @author 棋 张
 * @version V1.0
 * @ClassName: MailMapper类名
 * @Comments:
 * @Creatr Date:2017年7月22日 下午8:22:59
 * @Company:
 * @Copyright: Copyright (c) 2017
 * @版权所有 棋 张
 */
public interface MailService {
	void save(Mail mail);

	void update(Mail mail);

	List<Mail> findMailByPd(PageData pd);

	int getCountByPd(PageData pd);

	Mail getOne(Integer id);

	void delete(Integer id);
}
