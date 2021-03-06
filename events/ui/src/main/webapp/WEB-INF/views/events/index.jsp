<%--

    The MIT License
    Copyright (c) 2011 Kuali Mobility Team

    Permission is hereby granted, free of charge, to any person obtaining a copy
    of this software and associated documentation files (the "Software"), to deal
    in the Software without restriction, including without limitation the rights
    to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
    copies of the Software, and to permit persons to whom the Software is
    furnished to do so, subject to the following conditions:

    The above copyright notice and this permission notice shall be included in
    all copies or substantial portions of the Software.

    THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
    IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
    FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
    AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
    LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
    OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
    THE SOFTWARE.

--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="kme" uri="http://kuali.org/mobility"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<spring:message code="events.title.byDate" var="msgCat_ToolTitle"/>
<spring:message code="events.previousDay" var="previousDay"/>
<spring:message code="events.nextDay" var="nextDay"/>
<spring:message code="events.noEventsFoundMessage" var="noEventsFoundMessage"/>

<kme:page 
	title="${msgCat_ToolTitle}" 
	id="events" 
	appcacheFilename="kme.appcache" 
	backButton="true" 
	homeButton="true" 
	cssFilename="jqm-datebox,events"
	jsFilename="jqm-datebox.comp.datebox" 
	backButtonURL="${pageContext.request.contextPath}/home">
	<kme:content>
		<script type="text/javascript">
			// Dont use mobile box on fake JQM
			jQuery.extend(jQuery.mobile.datebox.prototype.options.lang, {
				'${pageContext.request.locale.language}': {					
					timeFormat: 24,
					headerFormat: '%A, %B %-d, %Y',
					dateFieldOrder: ['y','m', 'd'],
					timeFieldOrder: ['h', 'i', 'a'],
					slideFieldOrder: ['y', 'm', 'd'],
					dateFormat: "%Y-%m-%d",
					useArabicIndic: false,
					isRTL: false,
					calStartDay: 0,					
					durationOrder: ['d', 'h', 'i', 's'],					
					timeOutput: "%k:%M",
					durationFormat: "%Dd %DA, %Dl:%DM:%DS"
				}
			});			
		</script>
		<kme:listView id="eventslist" dataTheme="c" dataDividerTheme="b" filter="false">
			<div id="dateNavigation">
				<table width="100%">
					<tr>
                                            <td><c:choose>
                                                    <c:when test="${showPreviousDate == true }">
							<a href="" onclick="previousDate()" id="leftArrow">${previousDay}</a>
                                                    </c:when>
                                                    <c:otherwise><span id="leftArrow">${previousDay}</span></c:otherwise>
                                                </c:choose>
						</td>
						<td>
							<h3>${displayDate}</h3>
                                                        <input type="hidden" name="date" id="date" value="${displayDate}"/>
<%--							
        <input name="date" id="date" type="date" value="${displayDate}" data-role="datebox" data-options='{"mode": "datebox","focusMode": true, "numberInputEnhance": true}'>		
--%>
						</td>
						<td>
							<a href="" onclick="nextDate()" id="rightArrow">${nextDay}</a>
						</td>
					</tr>
				</table>
			</div>

			<c:if test="${empty categoryList}">
				<kme:listItem>${noEventsFoundMessage}</kme:listItem>
			</c:if>
			<c:forEach items="${categoryList}" var ="category" varStatus="status">
					<!--							 Category Header							   -->
				<kme:listItem dataRole="list-divider" dataTheme="b">
					<c:out value="${category.title}" />
				</kme:listItem>

				<c:forEach items="${categoryMap[category]}" var ="event" varStatus="status">
					<!--									 Event Information							  -->
					<kme:listItem>
						<c:url var="url" value="/events/viewEvent">
							<c:param name="categoryId" value="${category.categoryId}"></c:param>
							<c:param name="campus" value="${campus}"></c:param>
							<c:param name="eventId" value="${event.eventId}"></c:param>
						</c:url>
						<a href="${url}">
							<h3 class="wrap"><c:out value="${event.title}" /></h3>
							<p style="white-space:pre-wrap"><c:out value="${event.displayStartTime}" /> - <c:out value="${event.displayEndTime}" /> | <c:out value="${event.location}" /></p>
						</a>
					</kme:listItem>
				</c:forEach>
			</c:forEach>
		</kme:listView>
	</kme:content>
	<c:if test="${showCategoryTab == true || showDateRangeTab == true}">
	<kme:tabBar id="tabNav" showIcons="false" footer="true">
		<c:if test="${showCategoryTab == true}">
		<kme:tabBarItem url="${pageContext.request.contextPath}/events/byCategory"><spring:message code="events.byCategory" /></kme:tabBarItem>
		</c:if>
		<kme:tabBarItem url="${pageContext.request.contextPath}/events" selected="true"><spring:message code="events.byDate" /></kme:tabBarItem>
		<c:if test="${showDateRangeTab == true}">
		<kme:tabBarItem url="${pageContext.request.contextPath}/events/byDateRange"><spring:message code="events.byRange" /></kme:tabBarItem>
		</c:if>
	</kme:tabBar>
	</c:if>
<script type="text/javascript">
$("#date").change( function() {
	document.location.href = '${pageContext.request.contextPath}/events?date='+$('input#date').val();
});
function previousDate(){
	document.location.href = '${pageContext.request.contextPath}/events?date='+$('input#date').val()+'&direction=previous';
}
function nextDate(){
	document.location.href = '${pageContext.request.contextPath}/events?date='+$('input#date').val()+'&direction=next';
}
//$("#dateNavigation").swiperight(function() {
//    nextDate();
//});
//$("#dateNavigation").swipeleft(function() {
//    previousDate();
//});
</script>
</kme:page>
