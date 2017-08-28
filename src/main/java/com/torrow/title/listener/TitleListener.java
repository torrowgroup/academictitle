package com.torrow.title.listener;

import javax.servlet.ServletContextEvent;
import javax.servlet.ServletContextListener;

import com.torrow.title.util.Email;
/**
 * Application Lifecycle Listener implementation class AppStartListener
 *
 */
public class TitleListener implements ServletContextListener {

    /**
     * Default constructor. 
     */
    public TitleListener() {
        // TODO Auto-generated constructor stub
    }

	/**
     * @see ServletContextListener#contextDestroyed(ServletContextEvent)
     */
    public void contextDestroyed(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    }

	/**
     * @see ServletContextListener#contextInitialized(ServletContextEvent)
     */
    public void contextInitialized(ServletContextEvent arg0)  { 
         // TODO Auto-generated method stub
    	String rootPath = arg0.getServletContext().getContextPath()+"/";
    	arg0.getServletContext().setAttribute("rootPath",rootPath);
    	//配置邮箱，发送邮件的邮箱，授权码
    	Email email = new Email();
    	email.config(Email.SMTP_QQ(false), "from", "授权码");//from是发送邮件的邮箱地址，授权码是smpt授权码
    }
	
}
