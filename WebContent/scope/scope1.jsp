<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%
	//�ڹٿ��� 4���� ������ �ִ�.
	//page, request, session, application
	//������ ������ �����͸� ÷���Ͽ� ������ ������ �Ǵ��� Ȯ���Ѵ�.

	//������ ÷�� ��� : ������.setAttribute("�̸�", ��);
	//�̸��� String, ���� Object ���·� ����ȴ�.
	//���̵� - ��й�ȣ / ������� - �� �� ���� Map ����

	//page�� ������ ������ �߰��� �Ұ��ϴ�.
	int a = 10;//page�� ������ �Ҵ�ȴ�.
	request.setAttribute("data", new Integer(10)); // 10�� data��� �̸����� �ִ´�.
	session.setAttribute("data", new Integer(20)); // 20
	application.setAttribute("data", new Integer(30)); // 30

	//������ Ȯ�� : ������.getAttribute("�̸�"); -> ��(Object)
	Integer data1 = a;
	//int data2 = request.getAttribute("data"); //�������� object�̹Ƿ� ������ ����.
	
	Integer data2 = (Integer) request.getAttribute("data");
	Integer data3 = (Integer) session.getAttribute("data");
	Integer data4 = (Integer) application.getAttribute("data");
%>

<!-- ��ΰ� ����� �� �ȴ�. -->
<h1>
	page :
	<%=data1%></h1>
<h1>
	request :
	<%=data2%></h1>
<h1>
	session :
	<%=data3%></h1>
<h1>
	application :
	<%=data4%></h1>

<a href="scope2.jsp">���� ������</a>
<br>