<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>KHJSP</title>
</head>
<body>
<%
String id = request.getParameter("id");
String pw = request.getParameter("pw");
String addr = request.getParameter("addr");
String tel = request.getParameter("tel");
Class.forName("com.mysql.jdbc.Driver");
Connection conn = DriverManager.getConnection("jdbc:mysql://hladagers.cafe24.com:3306/hladagers", "hladagers", "yoon665174db");
String sql = "insert into member(id,pw,addr,tel) values(?,?,?,?)";
PreparedStatement pstmt = conn.prepareStatement(sql);
pstmt.setString(1, id);
pstmt.setString(2, pw);
pstmt.setString(3, addr);
pstmt.setString(4, tel);
int cnt=pstmt.executeUpdate();
%>
<%=cnt %> 건 회원이 등록되었습니다.
<a href="index.jsp?page=kh">메인페이지</a>
</body>
</html>