<%--
  Created by IntelliJ IDEA.
  User: anilturgut
  Date: 7.07.2021
  Time: 11:57
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add MIP</title>
</head>
<body>
<p>Enter the mip's information to add:</p>
<%
    String mname = (String) session.getAttribute("mipName");

    if(mname == null){
%>
<p style="color: red" >${errorMessage}</p>
<form method="post">
    <div>
        Mip Name : <input type="text" name="mipName" required/>
    </div>
    <div>
        <input type="submit" value="Add" />
    </div>
    <a href="/" >Back to previous page</a>
</form>

<%
}else{
%>
<p style="color: green">${"MIP added successfully"}</p>
<a href="/addMip" >Add another MIP</a>
<a href="/" >Back to previous page</a>
<%
    }
%>
</body>
</html>
