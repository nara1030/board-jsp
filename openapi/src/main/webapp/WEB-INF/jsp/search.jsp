<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>책/영화 조회</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"></script>
</head>
<body>
    <div class = "container-1">
        <table class = "table table-striped">
            <thead>
                <tr>
                    <th>도서명</th>
                    <th>저자</th>
                    <th>가격</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach items="${items.bookItems}" var="book">
                    <tr>
                        <th>${book.title}</th>
                        <th>${book.author}</th>
                        <th>${book.price}</th>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
    <div>
        <table class = "table table-striped">
            <thead>
            <tr>
                <th>영화명</th>
                <th>감독</th>
                <th>제작년도</th>
                <th>배우</th>
                <th>평점</th>
            </tr>
            </thead>
            <tbody>
                <c:forEach items="${items.movieItems}" var="movie">
                    <tr>
                        <th>${movie.title}</th>
                        <th>${movie.director}</th>
                        <th>${movie.pubDate}</th>
                        <th>${movie.actor}</th>
                        <th>${movie.userRating}</th>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>