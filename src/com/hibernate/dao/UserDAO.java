


package com.hibernate.dao;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.hibernate.been.User;

public class UserDAO {
		
	public void addUserDetails(String userName, String password,String email,String phone,String city) {
		try {
			
			Configuration configuration = new Configuration().configure();
			SessionFactory sessionFactory = configuration.buildSessionFactory();
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
			User user = new User();
			user.setUserName(userName);
			user.setPassword1(password);
			user.setEmail(email);
			user.setPhone(phone);
			user.setCity(city);
			
			session.save(user);
			transaction.commit();
			System.out.println("\n\n Add User Success \n");

		} catch (HibernateException e) {
			System.out.println(e.getMessage());
			System.out.println("error");
		}

	}
}
