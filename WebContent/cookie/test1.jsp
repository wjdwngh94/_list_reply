<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!-- test1.jsp : cookie���� ������ -->
<%
	//[1]Cookie Ŭ���� ��ü ����(������ �������� �ʰ� ������ �����.)
	//[2]��ȿ ���� ����(Session�� �ϳ��� ������ �ϰ������� cookie�� �������� ��������)
	//[3]���Ϸ� ��������(������ �����ȴ�.)

	//[1]Cookie Ŭ���� ��ü ����
	//Cookie ��Ű�� = new Cookie("�̸�ǥ", "������");
	Cookie ck = new Cookie("userId", "admin"); //String, String �� �Է� ����

	//[2]Cookie �� ��ȿ������ �ʴ����� �����Ѵ�.
	ck.setMaxAge(1 * 24 * 60 * 60);//1�� (�ʴ���)
	//ck.setMaxAge(0); �� ��Ű�� ������ �ʰڴ�, �� ���� ����̴�(session.removeAttribute�� ����)

	//[3]���Ϸ� �������� - response�� �̿��Ѵ�.
	response.addCookie(ck); //���������� �����ų �� �˾Ƽ� cookie�� ����� �ش�.
%>