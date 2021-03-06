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
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>


<spring:message code="library.title" var="msgCat_Title" />
<kme:page  title="${msgCat_Title}" 
	id="library-ui"
	backButton="true" 
	homeButton="true"
	cssFilename="library"
	jsFilename="library">

	<kme:content>
		<kme:listView id="contactDetails">
			<kme:listItem dataRole="list-divider">
			${library.name}
			<c:if test="${isAdmin}">
				(<a href="${pageContext.request.contextPath}/library/editContact/${library.id}"><spring:message code="library.edit" /></a>)
			</c:if>
			</kme:listItem>
			
			<%-- Telephone number --%>
			<c:if test="${not empty libraryContactDetail.telephone}">
				<kme:listItem>
					<div class="ui-grid-a">
						<div class="ui-block-a"><spring:message code="library.contact.telephone" /></div>
						<div class="ui-block-b"><a href="tel:${libraryContactDetail.telephone}">${libraryContactDetail.telephone}</a></div>
					</div>
				</kme:listItem>
			</c:if>
			
			<%-- Fax number --%>
			<c:if test="${not empty libraryContactDetail.fax}">
				<kme:listItem>
					<div class="ui-grid-a">
						<div class="ui-block-a"><spring:message code="library.contact.fax" /></div>
						<div class="ui-block-b">${libraryContactDetail.fax}</div>
					</div>
				</kme:listItem>
			</c:if>
			
			<%-- General Information desk number --%>
			<c:if test="${not empty libraryContactDetail.generalInfoDesk}">
				<kme:listItem>
					<div class="ui-grid-a">
						<div class="ui-block-a"><spring:message code="library.contact.general.info.desk" /></div>
						<div class="ui-block-b"><a href="tel:${libraryContactDetail.generalInfoDesk}">${libraryContactDetail.generalInfoDesk}</a></div>
					</div>
				</kme:listItem>
			</c:if>
			
			<%-- Email --%>
			<c:if test="${not empty libraryContactDetail.email}">
				<kme:listItem>
					<div class="ui-grid-a">
						<div class="ui-block-a"><spring:message code="library.contact.email" /></div>
						<div class="ui-block-b"><a href="mailto:${libraryContactDetail.email}">${libraryContactDetail.email}</a></div>
					</div>
				</kme:listItem>
			</c:if>
			
			<%-- Postal Address --%>
			<c:if test="${not empty libraryContactDetail.postalAddress}">
				<kme:listItem>
					<div class="ui-grid-a">
						<div class="ui-block-a"><spring:message code="library.contact.postal.addr" /></div>
						<div class="ui-block-b">${libraryContactDetail.postalAddress}</div>
					</div>
				</kme:listItem>
			</c:if>
			
			<%-- Physical Address --%>
			<c:if test="${not empty libraryContactDetail.physicalAddress}">
				<kme:listItem>
					<div class="ui-grid-a">
						<div class="ui-block-a"><spring:message code="library.contact.physical.addr" /></div>
						<div class="ui-block-b">${libraryContactDetail.physicalAddress}</div>
					</div>
				</kme:listItem>
			</c:if>
			
			<%-- GPS coordinates --%>
			<c:if test="${not empty libraryContactDetail.latitude and not empty libraryContactDetail.longitude}">
				
				<%-- Latitude Address --%>
				<kme:listItem>
					<div class="ui-grid-a">
						<div class="ui-block-a"><spring:message code="library.contact.latitude" /></div>
						<div class="ui-block-b">${libraryContactDetail.latitude}</div>
					</div>
				</kme:listItem>
			
				<%-- Longitude Address --%>
				<kme:listItem>
					<div class="ui-grid-a">
						<div class="ui-block-a"><spring:message code="library.contact.longitude" /></div>
						<div class="ui-block-b">${libraryContactDetail.longitude}</div>
					</div>
				</kme:listItem>
			</c:if>
		
		</kme:listView>
	</kme:content>
</kme:page>