<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.*,
                 com.topcoder.web.common.BaseProcessor" %>
<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.controller.request.internal.EditUserPaymentMethod" %>

<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>

<c:set var="PAYMENT_METHOD" value="<%=EditUserPaymentMethod.PAYMENT_METHOD_PARAM%>"/>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>Edit user payment method</title>
    
    <link type="text/css" rel="stylesheet" href="/js/jscal/skins/aqua/theme.css">
    <script language="javascript" type="text/javascript" src="/js/tcdhtml.js"></script>

</head>
<body>

<h1>PACTS</h1>
<h2>Edit user payment method</h2>

<form name='f' action="<%=PactsConstants.INTERNAL_SERVLET_URL%>" method="post">
  <input type="hidden" name="<%=PactsConstants.USER_ID%>" value="${user.id}"/>
  <input type="hidden" name="module" value="EditUserPaymentMethod"/>
        <table cellpadding="5" cellspacing="5" border="0">
        <tr>
            <td><b>User</b></td>
            <td><a href="${pacts:viewUser(user.id)}"><c:out value="${user.handle}" /></a></td>          
        </tr>
        <tr>        
            <td>
                <b>Payment Method:</b>
                <tc-webtag:errorIterator id="err" name="${PAYMENT_METHOD}">
                    <br/><span style="color: #FF0000;"><c:out value="${err}"/></span>
                </tc-webtag:errorIterator>
            </td>
            <td>
                <c:forEach var="paymentMethod" items="${paymentMethods}">
                    <tc-webtag:radioButton name="${PAYMENT_METHOD}" value="${paymentMethod.id}"/>${paymentMethod.name}<br />
                </c:forEach>
            </td>
        </tr>
</table>

<input type="submit" value="Save payment method">

</form>

<jsp:include page="InternalFooter.jsp" flush="true" />

</body>
</html>
