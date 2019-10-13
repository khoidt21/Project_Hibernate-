package com.hibernate.dao;

import java.util.List;
import java.nio.channels.SeekableByteChannel;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.ListIterator;

import javax.jws.soap.SOAPBinding.Use;
import javax.management.Query;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

import com.hibernate.been.User;

public class UserDAO {

	Configuration configuration = new Configuration().configure();
	SessionFactory sessionFactory = configuration.buildSessionFactory();

	public boolean login(String userName, String password) {

		Transaction transaction = null;
		Session session = sessionFactory.openSession();
		transaction = session.beginTransaction();
		if (session != null) {
			try {
				List<User> list = session.createQuery("FROM User where user_name='" + userName + "' and password='" + password + "'").list();
				Iterator iterator = list.iterator();
				while (iterator.hasNext()) {
					User user = (User) iterator.next();
					if (user.getUserName().equals(userName) && user.getPassword1().equals(password)) {
						return true;
					}
				}
				
			} catch (Exception e) {
				System.out.println("Error session query " + e.getMessage());
				return false;
			}
		} else {
			System.out.println("Database server downloading...");
		}
		return false;
	}
	
	public List<User> getAllUser(){
		Transaction transaction = null;
		List<User> listUser = null;
		Session session = sessionFactory.openSession();	
		try {
			transaction = session.beginTransaction();
			listUser = session.createQuery("FROM User").list();
			transaction.commit();
		}
		catch (Exception e) {
			e.printStackTrace();
		}
		return listUser;
	}
	
	
	public void addUser(User user) {
		try {
			Session session = sessionFactory.openSession();
			Transaction transaction = session.beginTransaction();
			session.save(user);
			transaction.commit();
			System.out.println("\n\n Add User Success \n");

		} catch (HibernateException e) {
			System.out.println(e.getMessage());
			System.out.println("error");
		}
	}
	public User getUser(int id) {

	        Transaction transaction = null;
	        User user = null;
	        try {
	        	Session session = sessionFactory.openSession();
	            transaction = session.beginTransaction();
	            user = (User)session.get(User.class, id);
	            
	            transaction.commit();
	        } catch (Exception e) {
	            if (transaction != null) {
	                transaction.rollback();
	            }
	            e.printStackTrace();
	        }
	        return user;
	}
	
	// update information User 
	public void updateUser(User user) {
			Transaction transaction = null;
			try {
				Session session = sessionFactory.openSession();
				transaction = session.beginTransaction();
				session.update(user);
				transaction.commit();
			}
			catch (Exception e) {
				// TODO: handle exception
				if(transaction !=null) {
					transaction.rollback();
				}
				e.printStackTrace();
			}
	}
	public void deleteUser(int id) {
			Transaction transaction = null;
			try {
				Session session = sessionFactory.openSession();
				transaction = session.beginTransaction();
				User user = (User) session.get(User.class,id);
				session.delete(user);
				transaction.commit();
				
			}
			catch (Exception e) {
				// TODO: handle exception
				if(transaction !=null) {
					transaction.rollback();
				}
				e.printStackTrace();
			}
	}
}
