<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>md绝了</title>
</head>
<body>
<form action="registSerlet"method="get">
    <div align="center">
        <select name="country">
            <option value="China">China</option>
            <option value="китай">китай</option>
            <option value=" 中国 ">中国</option>
            <option value=" 中國 ">中國</option>
        </select>
        <h1 align="center" size="25">
            世界的参差
        </h1>
        <input type="submit" name="button1" value="提交" onclick="location='library.jsp' " />
    </div>
</form>
</body>
</html>