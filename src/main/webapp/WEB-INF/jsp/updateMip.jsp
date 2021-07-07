<%--
  Created by IntelliJ IDEA.
  User: anilturgut
  Date: 7.07.2021
  Time: 14:11
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Update Mip</title>
</head>
<body>
<p>Enter the mip's information to update:</p>
<%
    String mname = (String) session.getAttribute("updatedName");

    if(mname == null){
%>
<p style="color: red" >${errorMessage}</p>
<form method="post">
    <div>
        Mip's Old Name : <input type="text" name="changingName" required/>
    </div>
    <div>
        Mip's Updated Name : <input type="text" name="updatedName" required/>
    </div>
    <div>
        <input type="submit" value="Update" />
    </div>
</form>
<a href="/" >Back to previous page</a>
<%
}else{
%>
<p style="color: green">${"MIP updated successfully"}</p>
<a href="/updateMip" >Update another MIP</a>
<a href="/" >Back to previous page</a>
<%
    }
%>
</body>
</html>
