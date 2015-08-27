<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="java.util.*, my.board.*" %>
<!-- list.jsp : �Խñ� ��� ������ -->
<%@ include file="/top.jsp"%>
<jsp:useBean id="bdao" class="my.board.BoardDAO"/>
<div align="center">
<%
	//�˻��� ����
	request.setCharacterEncoding("euc-kr");
	String search = request.getParameter("search");
	String searchString = request.getParameter("searchString");
	
	//��� ����
	ArrayList<BoardDTO> list;
	if(search!=null&&searchString!=null
					&&!searchString.trim().equals("")){
		list = bdao.searchBoard(search, searchString);//�˻�
	}else{
		list = bdao.listBoard();//���
	}
%> 
<h1>search : <%=search%>, 
					searchString : <%=searchString%></h1>
<!-- �۾��� ��ư -->
<table width="700">
	<tr><td align="right">
	<input type="button" value="�۾���"
							onclick="location.href='write.jsp'">
	</td></tr>
</table>
<br>
<!-- ��� ��� -->
<table class="outline" width="700">
	<!-- ������ -->
	<tr>
		<th class="m2">��ȣ</th>
		<th class="m2">����</th>
		<th class="m2">�ۼ���</th>
		<th class="m2">�ۼ���</th>
		<th class="m2">��ȸ��</th>
		<th class="m2">��õ��</th>
	</tr>
	<!-- ������ -->
	<%for(BoardDTO bdto : list){ %>
	<tr align="center">
		<td class="m3"><%=bdto.getNo()%></td>
		<td class="m3" align="left" width="40%">
		<a href="content.jsp?no=<%=bdto.getNo()%>">
			<%=bdto.getTitle()%>
		</a>
		</td>
		<td class="m3"><%=bdto.getWriter()%></td>
		<td class="m3"><%=bdto.getTime()%></td> 
		<td class="m3"><%=bdto.getReadcount()%></td>
		<td class="m3"><%=bdto.getRecommand()%></td>
	</tr>
	<%} %>
</table>
<br><br>
<!-- �˻�â -->
<form method="post">
	<select name="search" class="box">
		<option value="title">����
		<option value="writer">�ۼ���
	</select>
	<input type="text" class="box" name="searchString">
	<input type="submit" value="�˻�"> 
</form>
</div>
<%@ include file="/bottom.jsp"%>

	











