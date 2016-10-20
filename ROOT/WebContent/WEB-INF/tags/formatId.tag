<%@ tag language="java" pageEncoding="EUC-KR"%>

<%@ attribute name="value" required="true" type="java.lang.String" %>
<%@ attribute name="len" type="java.lang.Integer" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>


<c:if test="${len eq null }">
	<c:set var="len" value="2"/>
</c:if>

${fn:substring(fn:substringBefore(value,'@') , 0, len) }
<c:forEach var="i" begin="1" end="${fn:length(fn:substringBefore(value,'@') )-2}">*
</c:forEach>
@${fn:substringAfter(value,'@') } 