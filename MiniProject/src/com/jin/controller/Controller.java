package com.jin.controller;

import java.io.FileInputStream;
import java.io.IOException;
import java.security.Provider.Service;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;
import java.util.Properties;

import javax.servlet.RequestDispatcher;
import javax.servlet.Servlet;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebInitParam;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.jin.uri.Action;

/**
 * Servlet implementation class Controller
 */
@WebServlet(
		urlPatterns = { 
				"/Controller",
				"*.user",
				"*.board"
		}, 
		initParams = { 
				@WebInitParam(name = "propertyConfig", value = "command.properties")
		})
public class Controller extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private Map<String, Object> commandMap = new HashMap<String, Object>();
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Controller() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Servlet#init(ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException {
		//initParams에서 propertyConfig의 값을 읽어옴
				String props = config.getInitParameter("propertyConfig");
				String realFolder = "/property"; //properties 파일이 저장된 폴더


				//웹어플리케이션 루트 경로
				ServletContext context = config.getServletContext();
				//realFolder를 웹어플리케이션 시스템상의 절대경로로 변경
				String realPath = context.getRealPath(realFolder) +"\\" + props;
				System.out.println("실제 경로 : " + realPath);

				//명령어와 처리클래스의 매핑정보를 저장할 Properties객체 생성
				Properties pr = new Properties();
				FileInputStream f = null;
				try {
					//command.properties파일의 내용을 읽어옴
					f = new FileInputStream(realPath); 
					//command.properties의 내용을 Properties객체 pr에 저장
					pr.load(f);
				} catch (IOException e) {
					e.printStackTrace();
				} finally {
					if (f != null) try { f.close(); } catch(IOException ex) {}
				}

				//Set객체의 iterator()메소드를 사용해 Iterator객체를 얻어냄
				Iterator<?> keyIter = pr.keySet().iterator();
				//Iterator객체에 저장된 명령어와 처리클래스를 commandMap에 저장
				System.out.println("---- 명령 및 처리 클래스 목록  시작 -----");
				while( keyIter.hasNext() ) {
					String command = (String)keyIter.next();
					String className = pr.getProperty(command);
					System.out.println("명령 : " + command);
					System.out.println("명령 처리 클래스 이름 : " + className);

					try {
						Class<?> commandClass = Class.forName(className);
						Object commandInstance = commandClass.newInstance();
						commandMap.put(command, commandInstance);
					} catch (ClassNotFoundException e) {
						throw new ServletException(e);
					} catch (InstantiationException e) {
						throw new ServletException(e);
					} catch (IllegalAccessException e) {
						throw new ServletException(e);
					}
				}
				System.out.println("---- 명령 및 처리 클래스 목록 끝 -----");
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.requestPro(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		this.requestPro(request, response);
	}

	public void requestPro(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String view = null;
		Action act = null;

		try {
			String command = request.getRequestURI();
			if(command.indexOf(request.getContextPath()) == 0) {
				command = command.substring(request.getContextPath().length()
			);

				System.out.println("요청 명령 : " + command);
				System.out.println("요청 처리 클래스 : " + command.toString());

				act = (Action) commandMap.get(command);
				view = act.action(request, response);
				System.out.println("요청  처리 결과 뷰 : " + view);
			}

		}catch(Throwable t) {
			System.out.println("requestPro 메서드에서 예외 발생!!!");
			throw new ServletException(t);
		}

		RequestDispatcher dispatcher = request.getRequestDispatcher(view);
		dispatcher.forward(request, response);
	}
	
}
