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
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="kme" uri="http://kuali.org/mobility" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<kme:page title="${title}" id="sections-ui" backButton="true" homeButton="true" cssFilename="academics" jsFilename="academics" backButtonURL="${backButtonURL}">
    <kme:content>
        <kme:listView id="sectionlist" dataTheme="c" dataDividerTheme="b" filter="false">
            <c:choose>
                <c:when test="${not empty sectionsAll}">

                    <c:forEach var="thisSection" items="${sectionsAll}">
                        <kme:listItem>
                            <a href="${pageContext.request.contextPath}/${toolContext}/sectionsDetail?sectionUID=${thisSection.sectionUID}">
                                <c:choose>
                                    <c:when test="${fn:toLowerCase(toolContext)== 'myacademics'}">
                                        <h3><c:out value="${thisSection.subjectId}"/>&nbsp;<c:out value="${thisSection.catalogNumber}"/>&nbsp;<c:out value="${thisSection.number}"/>&nbsp;<c:out value="${thisSection.type}"/></h3>
                                        <c:if test="${not empty thisSection.courseTitle}">
                                            <p class="academics-courseDescription">${thisSection.courseTitle}</p>
                                        </c:if>        
                                        <c:if test="${not empty thisSection.classTopic}">
                                            <p class="academics-courseDescription">${thisSection.classTopic}</p>
                                        </c:if>                                        
                                    </c:when>
                                    <c:otherwise>
                                        <h3>Section&nbsp;<c:out value="${thisSection.number}"/>&nbsp;<c:out value="${thisSection.typeDescription}"/></h3>
                                    </c:otherwise>
                                </c:choose>

                                <c:choose>
                                    <c:when test="${fn:toLowerCase(toolContext)== 'myacademics'}">
                                        <p><span class="academics-grade">${thisSection.grade}</span></p>
                                        <c:if test="${fn:toLowerCase(thisSection.enrollmentStatus) == 'waiting'}">
                                            <p><span class="academics-sectionLeft">Status</span>
                                               <span class="academics-sectionRight font-orange">Wait List / Position: ${thisSection.waitTotal}</span></p>
                                        </c:if>
                                        <c:choose>
                                            <c:when test="${fn:length(thisSection.meetings) == 1}"> 
                                                <c:forEach items="${thisSection.meetings}" var="meeting" varStatus="ctrMts">
                                                    <p><span class="academics-sectionLeft">Start/End</span>
                                                       <span class="academics-sectionRight">${meeting.startDate} - ${meeting.endDate}</span></p>
                                                    <p><span class="academics-sectionLeft">Time</span>
                                                       <span class="academics-sectionRight">${meeting.days} ${meeting.times}</span></p>
                                                    <p><span class="academics-sectionLeft">Location</span>
                                                       <span class="academics-sectionRight">${meeting.location}</span></p>
                                                </c:forEach>
                                            </c:when>
                                            <c:when test="${fn:length(thisSection.meetings) > 1}">
                                                <c:set var="singleStartEnd" value="true"/>
                                                <c:set var="oldStartEnd" value="NONE"/>
                                                <c:forEach items="${thisSection.meetings}" var="meeting" varStatus="count">
                                                    <c:if test="${oldStartEnd eq 'NONE'}">
                                                        <c:set var="oldStartEnd" value="${meeting.startDate} - ${meeting.endDate}"/>
                                                    </c:if>
                                                    <c:set var="newStartEnd" value="${meeting.startDate} - ${meeting.endDate}"/>
                                                    <c:if test="${oldStartEnd != newStartEnd}">
                                                        <c:set var="singleStartEnd" value="false"/>
                                                    </c:if>
                                                    <c:set var="oldStartEnd" value="${newStartEnd}"/>
                                                </c:forEach>
                                                <c:if test="${singleStartEnd eq true}">
                                                    <p><span class="academics-sectionLeft">Start/End</span>
                                                        <span class="academics-sectionRight">${oldStartEnd}</span></p>
                                                </c:if>
                                                <c:forEach items="${thisSection.meetings}" var="meeting" varStatus="ctrMts">
                                                    <c:if test="${singleStartEnd eq false}">
                                                    <p><span class="academics-sectionLeft">Start/End</span>
                                                        <span class="academics-sectionRight">${meeting.startDate} - ${meeting.endDate}</span></p>
                                                    </c:if>
                                                    <p><span class="academics-sectionLeft">Time ${ctrMts.index +1}</span>
                                                       <span class="academics-sectionRight">${meeting.days} ${meeting.times}</span></p>
                                                    <p><span class="academics-sectionLeft">Location ${ctrMts.index +1}</span>
                                                       <span class="academics-sectionRight">${meeting.location}</span></p>
                                                    <c:if test="${ctrMts.index +1 < fn:length(thisSection.meetings)}">
                                                        <p class="smallSpace">&nbsp;</p>
                                                    </c:if>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <p><span class="academics-sectionLeft">Start/End</span>
                                                   <span class="academics-sectionRight">${thisSection.startDate} - ${thisSection.endDate}</span></p>
                                                <p><span class="academics-sectionLeft">Time</span><span class="academics-sectionRight">TBA</span></p>
                                                <p><span class="academics-sectionLeft">Location</span><span class="academics-sectionRight">TBA</span></p>
                                            </c:otherwise>
                                        </c:choose>
                                    </c:when>
                                    <c:otherwise>
                                        <c:choose>
                                            <c:when test="${fn:toLowerCase(thisSection.enrollmentStatus) == 'open'}">
                                                <p><span class="academics-sectionSeats-browseClass font-green"><c:out value="${thisSection.availableSeats}"/>&nbsp;<c:out value="${thisSection.enrollmentStatus}"/></span></p>
                                            </c:when>
                                            <c:when test="${fn:toLowerCase(thisSection.enrollmentStatus) == 'closed'}">
                                                <p><span class="academics-sectionSeats-browseClass font-red"><c:out value="${thisSection.enrollmentStatus}"/></span></p>
                                            </c:when>
                                            <c:when test="${fn:toLowerCase(thisSection.enrollmentStatus) == 'wait list'}">
                                                <p><span class="academics-sectionSeats-browseClass font-orange"><c:out value="${thisSection.enrollmentStatus}"/></span></p>
                                            </c:when>
                                        </c:choose>
                                        <c:if test="${fn:length(thisSection.meetings) == 0}">
                                            <p><span class="academics-sectionLeft">Time</span>
                                               <span class="academics-sectionRight">TBA</span></p>
                                        </c:if>
                                        <c:if test="${fn:length(thisSection.meetings) > 0}">
                                            <p>
                                                <c:forEach items="${thisSection.meetings}" var="meeting" varStatus="ctrMts">
                                                    <c:choose>
                                                        <c:when test="${ctrMts.index eq 1 && fn:length(thisSection.meetings) gt 2}">
                                                            <c:set var="moreText" value="and ${fn:length(thisSection.meetings) - 2} more" />
                                                        </c:when>
                                                        <c:otherwise>
                                                            <c:set var="moreText" value="" />
                                                        </c:otherwise>
                                                    </c:choose>
                                                    <c:if test="${ctrMts.index lt 2}">${meeting.days} ${meeting.times} ${moreText}<br/></c:if>
                                                </c:forEach>
                                            </p>
                                        </c:if>
                                    </c:otherwise>
                                </c:choose> 
                            </a>
                        </kme:listItem>
                    </c:forEach>
                </c:when>
                <c:otherwise>
                    <c:choose>
                        <c:when test="${fn:toLowerCase(toolContext)== 'myacademics'}">
                            <kme:listItem>You are not registered for ${careerId}.</kme:listItem>
                        </c:when>
                        <c:otherwise>
                            <kme:listItem>No class sections found.</kme:listItem>
                        </c:otherwise>
                    </c:choose>
                </c:otherwise>
            </c:choose>
        </kme:listView>
    </kme:content>
</kme:page>