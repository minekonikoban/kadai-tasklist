<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${task != null}">
		        <h2>Edit the task (id: ${task.id})</h2>

		        <form method="POST" action="${pageContext.request.contextPath}/update">
		            <c:import url="_form.jsp" />
		        </form>

		        <p><a href="${pageContext.request.contextPath}/index">See all tasks</a></p>
		        <p><a href="#" onclick="confirmDestroy();">Remove this task</a></p>
		        <form method="POST" action="${pageContext.request.contextPath}/destroy">
		            <input type="hidden" name="_token" value="${_token}" />
		        </form>
		        <script>
		        function confirmDestroy() {
		            if(confirm("Are you sure to remove this task?")) {
		                document.forms[1].submit();
		            }
		        }
		        </script>
		    </c:when>
		    <c:otherwise>
		    	<h2>No data found</h2>
		    </c:otherwise>
		</c:choose>
    </c:param>
</c:import>