<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<div class="content">
    <div class="search-container">
        <form action="/ko-KR/search" method="get">
            <input type="text" name="query" placeholder="책/영화명 입력(Enter)">
        </form>
    </div>
    <div class="classify-container">
        <div class="content-container">
            <div class="container-title">추천 책</div>
            <ul class="inner-container">
                <c:forEach items="${items.bookItems}" var="book">
                    <li class="iterate-container">
                        <div class="img-container"><img src="${book.image}"></div>
                        <div class="text-container">${book.title}</div>
                        <div class="text-container">${book.author}</div>
                        <div class="text-container">${book.price}</div>
                    </li>
                </c:forEach>
            </ul>
        </div>
        <div class="content-container">
            <div class="container-title">추천 영화</div>
            <ul class="inner-container">
                <c:forEach items="${items.movieItems}" var="movie">
                    <li class="iterate-container">
                        <div class="img-container"><img src="${movie.image}"></div>
                        <div class="text-container">${movie.title}</div>
                        <div class="text-container">${movie.director}</div>
                        <!-- <div class="text-container">${movie.actor}</div> -->
                        <div class="text-container">${movie.userRating}</div>
                    </li>
                </c:forEach>
            </ul>
        </div>
    </div>
</div>