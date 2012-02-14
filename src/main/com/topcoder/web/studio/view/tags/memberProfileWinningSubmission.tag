<%--
  - Author: isv
  - Version: 1.0 (TopCoder Studio Member Profile Assembly)
  - Copyright (C) 2012 TopCoder Inc., All Rights Reserved.
  -
  - Description: This tag renders a single winning submission on Member Profile page
--%>
<%@ tag body-content="empty" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<%@ tag import="com.topcoder.web.studio.Constants" %>
<c:set var="CONTEST_ID" value="<%=Constants.CONTEST_ID%>"/>

<%@ attribute name="submission" required="true" rtexprvalue="true"
              type="com.topcoder.web.studio.dto.MemberProfileSubmission" %>
<%@ attribute name="selected" required="true" rtexprvalue="true" type="java.lang.Boolean" %>

<li id="ws${submission.submissionId}">
    <a href="javascript:;" class="rank${submission.placement}" title="${submission.submissionId}">
        <c:choose>
            <c:when test="${not submission.locked}">
                <img alt="smallThumbPlaceholder"
                     src="http://studio.topcoder.com?module=DownloadSubmission&amp;sbmid=${submission.submissionId}&amp;sbt=tiny"/>
            </c:when>
            <c:otherwise>
                <img src="/i/lockedThumb.png" alt="locked"/>
            </c:otherwise>
        </c:choose>
    </a>
    <span id="xxx_1_${submission.submissionId}" class="hide"><fmt:formatDate value="${submission.submissionTime}" pattern="MM.dd.yyyy"/> at <fmt:formatDate
            value="${submission.submissionTime}" pattern="HH:mm"/> EST</span>
    <span id="xxx_2_${submission.submissionId}" class="hide">$<fmt:formatNumber value="${submission.contestPrizePurse}" pattern="#,##0.00"/></span>
    <span id="xxx_3_${submission.submissionId}" class="hide"><c:out value="${submission.contestName}"/></span>
    <span id="xxx_3_1_${submission.submissionId}" class="hide"><c:out value="${submission.contestId}"/></span>
    <c:if test="${not submission.locked}">
        <span id="xxx_4_${submission.submissionId}" class="hide">http://studio.topcoder.com/?module=DownloadSubmission&sbmid=${submission.submissionId}&sbt=small</span>
    </c:if>
</li>