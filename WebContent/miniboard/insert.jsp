<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- insert.jsp : DB�� ������ ����ִ� ������ -->
<!-- Oracle�� TEST ���̺� ������ ����ִ� ���� ��ǥ -->

<%
	request.setCharacterEncoding("euc-kr");
	String name = request.getParameter("name");
	String text = request.getParameter("text");
	//3. ��ȿ�� �˻�
	if(name==null||name.trim().equals("")||text==null){
		response.sendRedirect("home.jsp");//�ѾƳ��ڴ�.
		return;
	}
	Class.forName("oracle.jdbc.driver.OracleDriver");
	
	//�α��� - ��ġ, ���̵�, ��й�ȣ
	String url = "jdbc:oracle:thin:@localhost:1521:xe";
	String user = "jsp1";
	String pass = "jsp1";
	
	Connection con = DriverManager.getConnection(url, user, pass);
	//���(����) ����
	String sql = "insert into miniboard values(miniboard_seq.nextval,?,?,sysdate)";
	PreparedStatement ps = con.prepareStatement(sql);
	
	ps.setString(1, name);//�ڹ� String ������ varchar2 ���·� ����
	ps.setString(2, text);
	
	int result = ps.executeUpdate();
	
		if(result>0){%>
		<script type="text/javascript">
			alert("�Խñ� �Է� ����");
			location.href="list.jsp";
		</script>
<%	}else{%>
		<script type="text/javascript">
			alert("�Խñ� �Է� ����...");
			location.href="home.jsp";
		</script>
<%	}%>










