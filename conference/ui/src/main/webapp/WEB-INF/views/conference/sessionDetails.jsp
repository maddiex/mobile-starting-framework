<%--
  Copyright 2011 The Kuali Foundation Licensed under the Educational Community
  License, Version 2.0 (the "License"); you may not use this file except in
  compliance with the License. You may obtain a copy of the License at
  http://www.osedu.org/licenses/ECL-2.0 Unless required by applicable law or
  agreed to in writing, software distributed under the License is distributed
  on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
  express or implied. See the License for the specific language governing
  permissions and limitations under the License.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="kme" uri="http://kuali.org/mobility" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>

<spring:message code="sessiondetails.title" var="msgCat_Title"/>
<spring:message code="sessiondetails.about" var="msgCat_About"/>
<spring:message code="sessiondetails.rate" var="msgCat_Rate"/>
<spring:message code="label.location" var="msgCat_Location"/>
<spring:message code="label.comments" var="msgCat_Comments"/>
<spring:message code="label.submit" var="msgCat_Submit"/>
<spring:message code="label.fullsiteurl" var="msgCat_Siteurl"/>
<spring:message code="speakers.title" var="msgCat_Speakers"/>


<kme:page title="${msgCat_Title}" id="sessiondetails" homeButton="true" backButton="true" cssFilename="conference">
	<kme:content>
	    <kme:listView id="sessionList" filter="false" dataTheme="c" dataInset="false" cssClass="sessionDetails">
			<kme:listItem dataRole="list-divider">
	        	${session.title}
	        </kme:listItem>
	        
        	<c:if test="${not empty session.description}" >
        		<kme:listItem>
        			<h3>${msgCat_About}:</h3>
        			<p class="wrap tightPadding">${session.description}</p>
        		</kme:listItem>
        	</c:if>

	        <c:if test="${not empty session.latitude}" >
	        	<kme:listItem cssClass="link-gps">
	        		<a href="${pageContext.request.contextPath}/maps/location?latitude=${session.latitude}&longitude=${session.longitude}"><p class="wrap">${msgCat_Location}: <strong>${session.location}</strong></p></a>
	        	</kme:listItem>
	        </c:if>
	        
	        <c:if test="${!empty session.speakers}">
		        <kme:listItem dataRole="list-divider">${msgCat_Speakers}</kme:listItem>   
		        <c:forEach items="${session.speakers}" var="speaker" varStatus="status">
			    	<kme:listItem>
		    			<h3 class="wrap">
		    				${speaker.firstName} ${speaker.lastName}
		    			</h3>
		    			<p class="wrap">${speaker.email}</p>
		    			<p class="wrap">${speaker.title}</p>
		    			<p class="wrap">${speaker.institution}</p>
			    	</kme:listItem>            
			    </c:forEach>
		    </c:if>
	        
	        <kme:listItem dataRole="list-divider">${msgCat_Rate}:</kme:listItem>
	        <kme:listItem>

				<form:form action="${pageContext.request.contextPath}/conference/sessionFeedback" commandName="sessionFeedback" data-ajax="false" method="post">
					<div>
						<div class="ratingStar" id="star1">1</div>
		        		<div class="ratingStar" id="star2">2</div>
		        		<div class="ratingStar" id="star3">3</div>
		        		<div class="ratingStar" id="star4">4</div>
		        		<div class="ratingStar" id="star5">5</div>
		            </div>
		            
		            <input type="hidden" id="rating" name="rating"/>
		            <input type="hidden" id="sessionId" name="sessionId" value="${session.id}"/>
		            <input type="hidden" id="sessionName" name="sessionName" value="${session.title}"/>
		            
		            <div style="clear:left;">
		            	<fieldset>
		                    <label for="comments">${msgCat_Comments}:</label>
		                    <form:textarea path="comments" cols="40" rows="8" />
		            	</fieldset>
		            </div>
		            
		            <div data-inline="true">
		                <div class="ui-grid-a">
		                    <input data-theme="a" class="submit" type="submit" value="${msgCat_Submit}" />
		                </div>
		            </div>
		        </form:form>
	
        	</kme:listItem>
	        
	        <c:if test="${not empty session.link}" >
	        	<kme:listItem dataRole="list-divider">${msgCat_Siteurl}</kme:listItem>   
	        	<kme:listItem>
	        		<a href="${session.link}"><p>${session.link}</p></a>
	        	</kme:listItem>
	        </c:if>
		</kme:listView>
		
		<script>
		$(function() {
			$('div.ratingStar').click(
				function () {
					clickedRating = parseInt($(this).html());
					if (1 <= clickedRating) { $("div#star1").addClass("starOn"); } else { $("div#star1").removeClass("starOn"); }
					if (2 <= clickedRating) { $("div#star2").addClass("starOn"); } else { $("div#star2").removeClass("starOn"); }
					if (3 <= clickedRating) { $("div#star3").addClass("starOn"); } else { $("div#star3").removeClass("starOn"); }
					if (4 <= clickedRating) { $("div#star4").addClass("starOn"); } else { $("div#star4").removeClass("starOn"); }
					if (5 <= clickedRating) { $("div#star5").addClass("starOn"); } else { $("div#star5").removeClass("starOn"); }				
					$("input#rating").val($(this).html());
				}
			);
		});
		</script>
	</kme:content>
</kme:page>