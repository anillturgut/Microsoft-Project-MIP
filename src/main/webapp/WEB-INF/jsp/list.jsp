<%--
  Created by IntelliJ IDEA.
  User: anilturgut
  Date: 1.07.2021
  Time: 15:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List MIP's Page</title>
</head>
<body>
<p style="color: green" >${"MIP_ID, MIP_Name"}</p>

<%
    String[][] data = (String[][]) session.getAttribute("mipData");

    if(data != null){
        for(String [] item : data){

%>
<p> <%
    for(int i = 0; i < item.length-1; i++){%>
    <%=item[i]+" , "%>
    <%
        }
    %>
    <%=item[item.length-1]%>
</p>
<%
        }
    }
%>
<a href="/" >Back to previous page</a>
</body>
</html>
