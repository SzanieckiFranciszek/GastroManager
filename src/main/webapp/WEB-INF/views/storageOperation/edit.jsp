<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
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
                <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
                <div class="col-lg-7">
                    <div class="p-5">
                        <form:form modelAttribute="storageOperation" action="/admin/storageOperation/add" method="post">
                            <div class="text-center">
                                <h1 class="h4 text-gray-900 mb-4"> <spring:message code="app.addStorageOperation"/></h1>
                                <input type="hidden" name="storageOperationItem" value="${storageOperation.storageOperationItem.id}">
                                <form:hidden path="id"/>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <td><spring:message code="add.selectIngrediends"/></td>
                                    <form:select path="ingredient" items="${ingredients}"
                                                 itemLabel="name" itemValue="id"
                                                 class="form-control form-control-user"/>

                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6 mb-3 mb-sm-0">
                                    <td><spring:message code="add.enterQuantity"/></td>
                                    <form:input path="quantity" class="form-control form-control-user"/>

                                </div>
                            </div>
                            <div class="form-group row">
                                <div class="col-sm-6">
                                    <td><spring:message code="add.unitPrice"/></td>
                                    <form:input path="unitPrice" class="form-control form-control-user"/>

                                </div>
                            </div>

                            <button type="submit" class="btn btn-primary btn-user btn-block">
                                <spring:message code="app.edit"/></button>
                            <div style="margin-top: 10px">
                                <a href="/admin/sOi/details/${storageOperation.storageOperationItem.id}" class="btn btn-primary btn-user btn-block">
                                    <spring:message code="app.cancel"/></a>
                            </div>

                        </form:form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
</body>
<%@ include file="../footer.jsp" %>
</html>