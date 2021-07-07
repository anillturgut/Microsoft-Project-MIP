<%--
  Created by IntelliJ IDEA.
  User: anilturgut
  Date: 7.07.2021
  Time: 12:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Remove Mip</title>
</head>
<body>
<p>Enter the mip's information to remove:</p>
<%
    String mname = (String) session.getAttribute("mName");

    if(mname == null){
%>
<p style="color: red" >${errorMessage}</p>
<form method="post">
    <div>
        Mip Name : <input type="text" name="mName" required/>
    </div>
    <div>
        <input type="submit" value="Remove" />
    </div>
</form>
<a href="/" >Back to previous page</a>
<%
}else{
%>
<p style="color: green">${"MIP removed successfully"}</p>
<a href="/removeMip" >Remove another MIP</a>
<a href="/" >Back to previous page</a>
<%
    }
%>
</body>
</html>
