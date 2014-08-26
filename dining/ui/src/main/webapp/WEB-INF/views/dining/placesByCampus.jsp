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
<%@ taglib prefix="kme" uri="http://kuali.org/mobility" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:message code="dining.title" var="title"/>

<kme:page title="${title}" id="diningPlaces" backButton="true" homeButton="true" cssFilename="dining">
	<kme:content>
	<kme:listView id="placelist" dataTheme="c" dataDividerTheme="b" filter="false">
		<div data-role="collapsible-set">		
			<c:choose>
				<c:when test="${not empty placeGroups}">
					<c:forEach items="${placeGroups}" var="placeGroup" varStatus="status">
						<div data-role="collapsible" data-collapsed="false"><h3>${placeGroup.campus}</h3>
							<kme:listView id="placelist" dataTheme="c" dataDividerTheme="b" filter="false">
							<c:forEach items="${placeGroup.placeByTypes}" var="placeByType" varStatus="status">
								<kme:listItem dataTheme="b" dataRole="list-divider">${placeByType.type}</kme:listItem>
								<c:forEach items="${placeByType.places}" var="place" varStatus="status">
									<kme:listItem>
										<a href="${pageContext.request.contextPath}/dining/menus?name=\${place.name}&l=\${place.location}">
										<h3 class="wrap">${place.name}</h3>
										<p class="wrap">${place.location}</p></a>
									</kme:listItem>
								</c:forEach>
							</c:forEach>
							</kme:listView>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<kme:listItem>
						No places
					</kme:listItem>
				</c:otherwise>
			</c:choose> 
		</div>	
		</kme:listView>	
	</kme:content>
</kme:page>
