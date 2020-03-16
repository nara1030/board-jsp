<%@ page import="java.util.Map" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=utf-8"
         pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<style>
    * {box-sizing: border-box;}
    .topnav {
        overflow: hidden;
        background-color: #e9e9e9;
        margin-left: auto;
        margin-right: auto;
        width: 1200px;
    }
    .topnav input[type=text] {
        float: right;
        padding: 3px;
        margin-top: 8px;
        margin-right: 16px;
        border: none;
        font-size: 17px;
    }
    @media screen and (max-width: 600px) {
        .topnav input[type=text] {
            float: none;
            display: block;
            text-align: left;
            width: 100%;
            margin: 0;
            padding: 14px;
        }

        .topnav input[type=text] {
            border: 1px solid #ccc;
        }
    }
    .book-container {
        margin-left: auto;
        margin-right: auto;
        width: 1300px;
        height: 250px;
        border: 1px solid #ccc;
    }
    .movie-container {
        margin-left: auto;
        margin-right: auto;
        width: 1300px;
        height: 275px;
        border: 1px solid #ccc;
    }
    .recommended {
        margin-left: auto;
        margin-right: auto;
        width: 1200px;
        height: 25px;
        border: 1px solid #ccc;
    }
    .inner-container {
        width: 200px;
        height: 100%;
        border: 1px solid #ccc;
    }
    ul li {
        list-style: none;
        float: left;
    }
    .text-container {
        width: 200px;
        height: 25px;
        font-size: 12px;
        overflow: hidden;
    }
    img {
        width: 100%;
        height: 125px;
    }
</style>

<div class="topnav">
    <form action="/ko-KR/search" method="get">
        <input type="text" name="query" placeholder="책/영화명 입력(Enter)">
    </form>
</div>
<div class="book-container">
    <div class="recommended">추천 책</div>
    <div>
        <ul>
            <c:forEach items="${items.bookItems}" var="book">
                <li class="inner-container">
                    <div class="img-container"><img src="${book.image}"></div>
                    <div class="text-container">${book.title}</div>
                    <div class="text-container">${book.author}</div>
                    <div class="text-container">${book.price}</div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
<div class="movie-container">
    <div class="recommended">추천 영화</div>
    <div>
        <ul>
            <c:forEach items="${items.movieItems}" var="movie">
                <li class="inner-container">
                    <div class="img-container"><img src="${movie.image}"></div>
                    <div class="text-container">${movie.title}</div>
                    <div class="text-container">${movie.director}</div>
                    <div class="text-container">${movie.actor}</div>
                    <div class="text-container">${movie.userRating}</div>
                </li>
            </c:forEach>
        </ul>
    </div>
</div>
