<%--
 - Author: pulky, isv, pvmagacho
  - Version: 1.7
  - Copyright (C) 2004 - 2010 TopCoder Inc., All Rights Reserved.
  -
  - Description: This page renders studio home page.
  -
  - Version 1.1 (Studio Release Assembly 1) Change notes:
  - * The layout of this page was updated to include several modifications: (among others)
  -    * New banner carousel.
  -    * New Design Showcase section.
  -    * New Thoughts From The Blog section.
  -    * New Contest Chatter section.
  -
  - Version 1.2 (BUGR-2268) Change Notes:
  -    * Added carousal buttons #6 and #7.'Compete' and 'Post a Project' links to external pages.
  -    * Added banner rotation every 5 sec. on carousal.
  -    * Right justified the prize amount.
  -    * Added proper links on RSS feeds for 'Thoughts for blogs' and 'Contest Chatter'.
  -
  - Version 1.3 (BUGR-2786) Change Notes:
  -    * If the checkpoint date has not been reached, use this date to calculate time left 
  -
  - Version 1.4 (Studio Enhancements Release Assembly 1) Change Notes:
  -    * Thoughts From The Blog entry now shows an excerpt from the blog entry
  -    * instead of entire entry.
  -
  - Version 1.5 (Studio Homepage Enhancements Release Assembly - TCCC1819) Change Notes:
  -    * Thoughts From The Blog entry now shows an excerpt from the blog entry
  -    * instead of entire entry. Carousel is removed and replaced with TCO10 logo
  -    * and Compete and Post buttons. Active Contests area shows icon for contests
  -    * eligible for TCO10. Contest Chatter area is replaced with Member Of The Month
  -    * info
  - Version 1.6 (Replatforming Studio Release 1 Assembly) change notes: active contests are filtered based on 
  -    * eligibility constraints.
  - Version 1.7 (Replatforming Studio Release 4 Assembly) change notes: empty active contests control must be shown.  
--%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<%@ page import="com.topcoder.web.studio.Constants" %>
<%@ page import="com.topcoder.web.studio.controller.request.Login" %>
<%@ page import="java.text.NumberFormat" %>
<%@ page import="java.util.Date" %>
<%@ page import="java.util.Map" %>

<% ResultSetContainer activeContests 
        = (ResultSetContainer) ((Map) request.getAttribute("studio_home_data")).get("studio_active_contests");%>

<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="studio.tld" prefix="studio" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="studio_tags" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico" />
        <meta http-equiv="content-type" content="text/html; charset=utf-8"/>
        <title>Welcome to TopCoder Studio</title>

        <jsp:include page="style.jsp">
            <jsp:param name="key" value="tc_studio_home"/>
        </jsp:include>

        <!--[if lt IE 7]>
                <script type="text/javascript" src="js/pngfix/unitpngfix.js"></script>
        <![endif]-->         

        <%-- Javascript code --%>
        <script src="/js/NewStyleHeaderFooter/jquery-1.2.6.min.js" type="text/javascript"></script>
        <script src="/js/NewStyleHeaderFooter/preloadCssImages.jQuery_v5.js" language="javascript"></script>
        <script type="text/javascript">
            $(document).ready(function(){
                //Run the script to preload images from CSS
                $.preloadCssImages();
            });
            
            
            /*
             * Copyright (C) 2013 TopCoder Inc., All Rights Reserved.
             * @author TrePe
             * @version 1.0 (BUGR 9200)
             */
            window.onload = function() {
                var speed = 90; // ms between frames
                var introSpeed = 100; // ms between frames on Intro text
                var step = 0;
                var bgpos = 0;
                var pos, el;
                var displayFrame = function() {
                
                    step++;
                    bgpos++;
                    // explicit white background to save some bytes in merged.jpg
                    if (step == 33 || step == 44) {
                        el = document.getElementById('animation');
                        el.style.background = "#FFF";
                        bgpos--;
                    }
                    if (step == 34 || step == 45) {
                        el = document.getElementById('animation');
                        el.style.background = "url(/i/homeBanner/merged.jpg)";
                    }
                    // intro appears and disappears
                    if (step >= 11 && step <= 31) {
                        el = document.getElementById('intro');
                        pos = 27 - step;
                        if (pos > 0) pos = 0;
                        el.style.backgroundPosition = "117px " + (pos * 36) + "px";
                        el.style.display = 'block';
                    }
                    if (step == 32) {
                        el = document.getElementById('intro');
                        el.style.display = 'none';
                    }
                    // logo appears
                    if (step == 45) {
                        el = document.getElementById('logo');
                        el.style.display = 'block';
                    }
                    // technologies appear
                    if (step >= 45) {
                        el = document.getElementById('tech-overlay');
                        el.style.display = 'block';
                        el = document.getElementById('tech');
                        el.style.display = 'block';
                        pos = step - 45;
                        if (pos > 3) pos = 3;
                        el.style.backgroundPosition = ((step-46) * 10) + "px -" + (pos * 32) + "px";
                    }
                    // background animation stops
                    if (step < 49) {
                        el = document.getElementById('animation');
                        el.style.backgroundPosition = "0 -" + (bgpos * 175) + "px";
                    }
                    // the whole animation stops (or not, if you remove this if)
                    if (step < 70) {
                        setTimeout(displayFrame, step >= 11 && step <= 31 ? introSpeed : speed)
                    }
                };
                setTimeout(displayFrame, speed);
                
                loadHomePageFeeds();
            }
            
        </script>
        <script src="/js/NewStyleHeaderFooter/jquery.hoverIntent.minified.js" type="text/javascript"></script>
        <script src="/js/NewStyleHeaderFooter/scripts.js" type="text/javascript"></script>
        <script type="text/javascript" language="javascript" src="/js/navigation.js"></script>

        <script type="text/JavaScript" src="/js/FeedLoader.js"> </script>
        <script type="text/JavaScript" src="/js/RSSProcessor.js"> </script>
        <script type="text/JavaScript" src="/js/AJAXProcessor.js"> </script>
        <script type="text/javascript" src="/js/jquery.timers.js"> </script> <%-- BUGR-2268: Timers library added --%>
        
        <script type="text/javascript">
	   		(function () { var done = false; var script = document.createElement("script"); script.async = true; script.type = "text/javascript"; script.src = "https://purechat.com/VisitorWidget/WidgetScript"; document.getElementsByTagName('HEAD').item(0).appendChild(script); script.onreadystatechange = script.onload = function (e) { if (!done && (!this.readyState || this.readyState == "loaded" || this.readyState == "complete")) { var w = new PCWidget({ c: '32782020-1040-4f6a-a980-bb27ddb5204a', f: true }); done = true; } }; })();
    	</script>
        
<style type="text/css">
            #animation-container {
                width: 782px;
                height: 175px;
                margin: auto;
                padding: 0;
            }
            #animation {
                background: url('/i/homeBanner/merged.jpg');
                width: 782px;
                height: 175px;
                margin: 0;
            }
            #intro {
                background: url('/i/homeBanner/intro.png');
                background-position: 117px 0;
                background-repeat: no-repeat;
                display: none;
                margin: -104px 0 0 0;
                width: 782px;
                height: 36px;
            }
            #tech {
                background: url('/i/homeBanner/tech.png');
                background-repeat: repeat-x;
                margin: -100px 0 0 0;
                display: none;
                width: 782px;
                height: 32px;
            }
            #tech-overlay {
                background: url('/i/homeBanner/tech-overlay.png');
                background-position: 262px 0;
                background-repeat: no-repeat;
                margin: -32px 0 0 0;
                display: none;
                width: 782px;
                height: 32px;
            }
            #logo {
                background: url('/i/homeBanner/logo.png');
                background-position: 285px 30px;
                background-repeat: no-repeat;
                margin: -108px 0 0 0;
                display: none;
                width: 782px;
                height: 175px;
            }
        </style>

    </head>

    <c:set var="contests" value="<%=activeContests%>"/>
    <c:set var="subAltType" value="<%=Constants.SUBMISSION_ALT_TYPE%>"/>
    <c:set var="subId" value="<%=Constants.SUBMISSION_ID%>"/>
    <c:set var="subFileIdx" value="<%=Constants.SUBMISSION_FILE_INDEX%>"/>

    <body>
        <div id="page-wrap">
            <jsp:include page="top.jsp">
                <jsp:param name="section" value="home"/>
            </jsp:include>

            <br />
            <%--  main content --%>
            <div id="wrapper">
                <div class="home_content">
                    <div id="top_part">
                        <div id="mycarousel" class="jcarousel-skin-tango">
                            <div id="compete_post_buttons">
                                <a href="http://topcoder.com/home/studio/new-member-guide"
                                   class="compete"></a>
                                <a href="${sessionInfo.servletPath}?module=Static&amp;d1=support&amp;d2=getStarted"
                                   class="post_project"></a>
                            </div>
                            <div id="homePageBanner">
                                <div id="animation-container">
                                    <div id="animation"></div>
                                    <div id="intro"></div>
                                    <div id="tech"></div>
                                    <div id="tech-overlay"></div>
                                    <div id="logo"></div>
                                </div>
                                <br/>
                                <br/>
                            </div>
                        </div>
                    </div><%-- End of #top_part --%>
                    <div id="center_content">
                <div id="active_contest">
                                <div id="active_contest_head">
                                    <span class="active_contests_head">&nbsp;</span>
                                    <span class="active_contests_head">ACTIVE CONTESTS</span>
                                    <span class="prize_purse_head">PURSE</span>
                                    <span class="time_left_head">TIME LEFT</span>
                                </div>
                        <c:if test="${empty contests}">                            
                                <div id="active_contest_content">
                </div>
            </div>
                        </c:if>
                        <c:if test="${not empty contests}">
                            <div id="active_contest">
                                <div id="active_contest_content">
                                    <table>
                                        <thead>
                                            <tr>
                                                <th class="event"></th>
                                                <th class="first"></th>
                                                <th class="second"></th>
                                                <th class="last"></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <rsc:iterator list="<%=activeContests%>" id="resultRow" end="6">
                                                <c:set var="contestId" value="<%=new Long(resultRow.getLongItem("contest_id"))%>"/>
           
                                                
                                                <tr>
                                                    <td class="event">
                                                        <% if ("3436".equals(resultRow.getStringItem("event_id"))) { %>
                                                        <a href="http://community.topcoder.com/tco13/studio">
                                                            <img src="/i/tournament/tco13/tco13_small_icon_design.png"
                                                                 alt="Eligible for the TCO13" /></a>
                                                        <% } else if ("3437".equals(resultRow.getStringItem("event_id"))) { %>
                                                        <a href="http://community.topcoder.com/tco14/studio">
                                                            <img src="/i/tournament/tco14/tco14_small_icon_design.png"
                                                                 alt="Eligible for the TCO14" /></a>
                                                        <%} else {%>&nbsp;<%}%>
                                                    </td>
                                                    <td class="first">
                                                        <a href="${sessionInfo.servletPath}?module=ViewContestDetails&amp;<%=Constants.CONTEST_ID%>=${resultRow.map['contest_id']}">
                                                             <rsc:item name="name" row="<%=resultRow%>"/>
                                                        </a>
                                                    </td>
                                                    <td class="second">
                                                        <rsc:item name="prize_total" row="<%=resultRow%>" format="$###,###.00" ifNull="&nbsp;"/>
                                                    </td>
                                                    <td class="last">
                                                        <%
                                                        Date endDate;
                                                        Object checkpointDate = resultRow.getItem("milestone_date").getResultData(); 
                                                        if (checkpointDate != null && (new Date()).before((Date) checkpointDate)) {
                                                            endDate = (Date) checkpointDate;
                                                        } else {
                                                            endDate = (Date)(resultRow.getItem("end_time").getResultData());
                                                        }
                                                        
                                                        int hours = (int)(((endDate).getTime() - 
                                                            System.currentTimeMillis()) / 1000 / 3600);
                                                        if (hours < 24) {
                                                            out.print(hours + " hour");
                                                            if (hours > 1) {
                                                                out.print("s");
                                                            }
                                                        } else {
                                                            out.print((hours / 24) + " Day");
                                                            if (hours >= 48) {
                                                                out.print("s");
                                                            }
                                                        }
                                                        %>
                                                    </td>
                                                </tr>
                       
                                            </rsc:iterator>
                                        </tbody>
                                    </table>
                                    <div id="view_contest_button">
                                        <a href="/?module=ViewActiveContests">View All <%=activeContests.size()%>
                                            Active Contests
                                        </a>
                                    </div>
                                </div><%-- End of #active_contest_content --%>
                            </div><%-- End of #active_contest --%>
                        </div>
                        </c:if>
                        <div id="showcase">
                            <div id="showcase_head">
                                <h1>DESIGN SHOWCASE</h1>
                            </div>
                            <div id="showcase_content">
                            </div><%-- End of #showcase_content --%>
                        </div><%-- End of showcase --%>
                    </div><%-- End of center_content --%>
                </div><%-- End of .home_content --%>
                <div id="bottom_wrapper">
                    <div class="home_content">
                        <div id="bottom_part">
                            <div id="bottom_part_l">
                                <div id="thoughts_from_blog">
                                </div>
                                <div id="post_content">
                                </div>
                            </div>
                            <div id="bottom_part_r">
                                <div class="box_content_container">
                                      <!-- PLEASE ADJUST MEMBER OF THE MONTH PARAMETERS HERE -->
                                    <div id="member_of_the_month">
                                                <img style="margin-bottom:12px;"
                                            src="/i/v5/Member_of_the_month_header.jpg" >
                                    </div>
									
                                    <div class="member_image" style="float:left;">
									<!-- CHANGE THESE BACK TO 140x140 FOR NEXT MONTH -->
                                        <img width="140" height="140" alt="Member of the Month" src="http://community.topcoder.com/i/m/nophoto.jpg">
                                    </div>
                                    <div id="member_content">
                                        <div id="member_month">
                                            May<br />
                                        </div>
                                        <div id="member_greeting">
                                            <span class="member_content special handle">Congratulations <span class="handle-color">picachui</span></span><br/><br/>
                                        </div>
                                        <div id="member_stats">
                                            <span class="member_content special">won $2,125 in 2 contests</span><br/><br/>
                                            <span class="member_content special"><!--<a href="http://www.topcoder.com/news/2010/11/15/meet-the-october-coders-and-designers-of-the-month-2/">Read the interviews here.</a>--></span><br/><br/>
                                        </div>
                                    </div>
								
                                    <!-- member_content -->
                                    <div class="clear"></div>
                                </div>
                            </div>
                            </div>
                        </div>
                        <br class="clear"/>
                    </div><%-- end of home_content of bottom --%>
                </div><%-- end of bottom_wrapper --%>
            </div>

        </div><%-- #page-wrap ends --%>

        <jsp:include page="foot.jsp">
            <jsp:param name="section" value="home"/>
        </jsp:include>

    </body>
</html>
