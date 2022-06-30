<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:import url="../layout/app.jsp">
    <c:param name="content">
        <c:choose>
            <c:when test="${task != null}">
		        <h2>Details for the task (id: ${task.id})</h2>
				<table>
					<tbody>
						<tr>
					        <th>Content</th>
					        <td><c:out value="${task.content}" /></td>
					    </tr>
				        <tr>
				        	<th>Created at</th>
				        	<td><fmt:formatDate value="${task.created_at}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				       	</tr>
				        <tr>
				        	<th>Updated at</th>
				        	<td><fmt:formatDate value="${task.updated_at}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
				       	</tr>
					</tbody>
				</table>
		        <p><a href="${pageContext.request.contextPath}/index">See all tasks</a></p>
		        <p><a href="${pageContext.request.contextPath}/edit?id=${task.id}">Edit this task</a></p>
				<p><a href="#" onclick="confirmDestroy();">Remove this task</a></p>
		        <form method="POST" action="${pageContext.request.contextPath}/destroy">
		            <input type="hidden" name="_token" value="${_token}" />
		        </form>
		        <script>
		        function confirmDestroy() {
		            if(confirm("Are you sure to remove this task?")) {
		                document.forms[0].submit();
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