<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<html>
<head>
    <title>Title</title>
</head>
<%@ include file="../header.jsp" %>
<body>


<div class="container">


    <div class="card o-hidden border-0 shadow-lg my-5">
        <div class="card-body p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
                <div class="col-lg-5 d-none d-lg-block">
                    <div class="p-5">
                        <div>
                            <h3>Danie: ${meal.name}</h3>
                        </div>
                        <div>
                            <h3>Składniki:</h3>
                            <ul>
                                <c:forEach items="${meal.ingredientsMeals}" var="im">
                                    <li>${im.ingredient.name} | ilość ${im.quantity}
                                        <sec:authorize access="hasRole('ADMIN')">|
                                            <a href="<c:url value="/admin/meal/ingredient/edit/${im.id}"/>">Edytuj</a> |
                                            <a href="<c:url value="/admin/meal/ingredient/delete/${im.id}"/>">Usuń</a>
                                        </sec:authorize>
                                    </li>
                                </c:forEach>
                                <a href="<c:url value="/admin/meal/ingredient/add/${meal.id}"/>">Dodaj nowy składnik</a>
                            </ul>
                        </div>
                    </div>
                </div>


                <div class="col-lg-7 d-none d-lg-block">
                    <div class="p-5">
                        <div>
                            <h3>Dieta: ${meal.diet.name}</h3>
                        </div>
                        <div>
                            <h2>Sposób przygotowania</h2>
                            ${meal.description}<br><br>
                            cena: ${meal.price}<br>
                            <a href="<c:url value="/app/meal/list"/>">Powrót do listy</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%@ include file="../footer.jsp" %>
</html>
