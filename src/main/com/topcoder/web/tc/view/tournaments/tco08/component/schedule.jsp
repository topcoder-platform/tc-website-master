<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page contentType="text/html;charset=utf-8" %> 
<%@ page import="com.topcoder.web.common.model.EventType" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>The 2008 TopCoder&reg; Open - Get ready for the Ultimate TopCoder Event!</title>
<link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
<link type="text/css" rel="stylesheet" href="/css/tournaments/tco08.css"/>
<link type="text/css" rel="stylesheet" href="/css/coders.css"/>
<script language="JavaScript" type="text/javascript" src="/js/arena.js"></script>
</head>
<body id="page_sub">

<div id="wrapper">

    <jsp:include page="../nav.jsp" >
    <jsp:param name="tabLev1" value="<%=EventType.COMPONENT_TOURNAMENT_ID%>"/>
    <jsp:param name="tabLev2" value="schedule"/>
    <jsp:param name="tabLev3" value=""/>
    </jsp:include>


        <h2>Component Competition Schedule</h2>
        
        <div class="sub_content">
        
            <h3>Registration</h3>
            <p>Registration for the 2008 TopCoder Open Component Design and Development Competition will open at 9:00 AM EST on Monday, January 14 and will close at 9:00 AM EST on Thursday, February 28, 2008.</p>
            <table width="100%" cellpadding="0" cellspacing="0" class="stat">
                <tr>
                    <th>Schedule</th>
                    <th>Posted On or After</th>
                    <th colspan="2">Submission Deadline On or Before</th>
                </tr>
                <tr class="dark">
                    <td>Online Round</td>
                    <td>January 24, 2008<br />at <a target="_blank" href="<tc-webtag:linkTracking link='http://timeanddate.com/worldclock/fixedtime.html?month=1&day=24&year=2008&hour=9&min=0&sec=0&p1=98' refer='tco08_compSchedule' />">9:00 AM*</a></td>
                    <td colspan="2">March 6, 2008<br />at <a target="_blank" href="<tc-webtag:linkTracking link='http://timeanddate.com/worldclock/fixedtime.html?month=3&day=6&year=2008&hour=9&min=0&sec=0&p1=98' refer='tco08_compSchedule' />">9:00 AM*</a></td>
                </tr>
                <tr>
                    <th>Onsite Rounds</th>
                    <th>Start Time</th>
                    <th># of Participants</th>
                    <th>End Time</th>
                </tr>
                <tr class="dark">
                    <td>Component<br />Design Finals</td>
                    <td>May 12, 2008<br />at <a target="_blank" href="<tc-webtag:linkTracking link='http://timeanddate.com/worldclock/fixedtime.html?month=5&day=12&year=2008&hour=12&min=0&sec=0&p1=127' refer='tco08_compSchedule' />">12:00 PM**</a></td>
                    <td>12</td>
                    <td>May 12, 2008<br />at <a target="_blank" href="<tc-webtag:linkTracking link='http://timeanddate.com/worldclock/fixedtime.html?month=5&day=12&year=2008&hour=18&min=0&sec=0&p1=127' refer='tco08_compSchedule' />">6:00 PM**</a></td>
                </tr>
                <tr class="light">
                    <td>Component<br />Development Finals</td>
                    <td>May 14, 2008<br />at <a target="_blank" href="<tc-webtag:linkTracking link='http://timeanddate.com/worldclock/fixedtime.html?month=5&day=14&year=2008&hour=8&min=30&sec=0&p1=127' refer='tco08_compSchedule' />">8:30 AM**</a></td>
                    <td>12</td>
                    <td>May 14, 2008<br />at <a target="_blank" href="<tc-webtag:linkTracking link='http://timeanddate.com/worldclock/fixedtime.html?month=5&day=14&year=2008&hour=17&min=0&sec=0&p1=127' refer='tco08_compSchedule' />">5:00 PM**</a></td>
                </tr>
            </table>
            <br />
            
            <table width="100%" cellpadding="0" cellspacing="0" class="stat">
                <tr>
                    <th colspan="2">Important Dates</th>
                </tr>
                <tr class="dark">
                    <td>Last day to request a visa letter</td>
                    <td>March 12, 2008 at <a target="_blank" href="<tc-webtag:linkTracking link='http://timeanddate.com/worldclock/fixedtime.html?month=3&day=12&year=2008&hour=17&min=0&sec=0&p1=98' refer='tco08_compSchedule' />">5:00 PM**</a></td>
                </tr>
                <tr class="light">
                    <td>Finalists documents due</td>
                    <td>March 26, 2008 at <a target="_blank" href="<tc-webtag:linkTracking link='http://timeanddate.com/worldclock/fixedtime.html?month=3&day=26&year=2008&hour=17&min=0&sec=0&p1=98' refer='tco08_compSchedule' />">5:00 PM**</a></td>
                </tr>
            </table>
            <br />
            
            <p>*Times listed in Eastern Standard Time (UTC/GMT -5)<br />
            **Times listed in Pacific Daylight Time (UTC/GMT -7)</p>

            
        </div><%-- .sub_content --%>
        
    </div><%-- #content --%>

<jsp:include page="../footer.jsp" />

</div><%-- #wrapper --%>

</body>
</html>
