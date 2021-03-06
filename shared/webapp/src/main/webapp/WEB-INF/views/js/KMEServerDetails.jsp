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
<%@ page language="java" contentType="application/javascript; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
/**
 * Copyright 2011-2014 The Kuali Foundation Licensed under the Educational Community
 * License, Version 2.0 (the "License"); you may not use this file except in
 * compliance with the License. You may obtain a copy of the License at
 * http://www.osedu.org/licenses/ECL-2.0 Unless required by applicable law or
 * agreed to in writing, software distributed under the License is distributed
 * on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
 * express or implied. See the License for the specific language governing
 * permissions and limitations under the License.
*/

<c:choose>
	<c:when test="${pageContext.request.scheme eq 'http' and pageContext.request.serverPort eq '80'}">
		<c:set var="portParam" value=""/>
	</c:when>
	<c:when test="${pageContext.request.scheme eq 'https' and pageContext.request.serverPort eq '443'}">
		<c:set var="portParam" value=""/>
	</c:when>
	<c:otherwise>
		<c:set var="portParam" value=":${pageContext.request.serverPort}"/>
	</c:otherwise>
</c:choose>

/**
 * Constructor
 */
function KMEServerDetails(){};

KMEServerDetails.Schemes = {};
KMEServerDetails.Schemes.HTTP = "http";
KMEServerDetails.Schemes.HTTPS = "https";

KMEServerDetails.Ports = {};
KMEServerDetails.Ports.HTTP = "80";
KMEServerDetails.Ports.HTTPS = "443";

/**
 * Gets the page scheme
 */
KMEServerDetails.prototype.getPageScheme = function(){
	return "${pageContext.request.scheme}";
};

/**
 * Gets the name of the server
 */
KMEServerDetails.prototype.getServerName = function(){
	return "${pageContext.request.serverName}";
};

/**
 * Gets the port of the server
 */
KMEServerDetails.prototype.getServerPort = function(){
	return "${pageContext.request.serverPort}";
};


/**
 * Gets the context path to the server
 */
KMEServerDetails.prototype.getContextPath = function(){
	return "${pageContext.request.contextPath}";
};


/**
 * Gets the path to the server, including the context path
 */
KMEServerDetails.prototype.getServerPath = function(){
    <c:choose>
        <c:when test="${not empty kmeBaseUrl}">
    return "${kmeBaseUrl}${pageContext.request.contextPath}"
        </c:when>
        <c:otherwise>
    return "${pageContext.request.scheme}://${pageContext.request.serverName}${portParam}${pageContext.request.contextPath}"
        </c:otherwise>
    </c:choose>
};


/** Add KMEServerDetails to window.kme.serverDetails */
window.kme = window.kme || {};
window.kme.serverDetails = window.kme.serverDetails || new KMEServerDetails();
