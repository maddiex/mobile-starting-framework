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
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<div ng-controller="BusMapController" ng-init="init()" id="busContainer">
    <div class="list-group" ng-show="loadingRoutes" ng-init="loadingRoutes=true">
        <div class="list-group-item">Building route list....</div>
    </div>
    <form role="form" ng-submit="changeBusRoute()" ng-hide="loadingRoutes">
        <select name="select-route" id="select-route" class="form-control">
            <%--<option value="{{thisRoute.id}}" ng-repeat="thisRoute in BusData.routes.busRoute">{{thisRoute.name}}</option>--%>
        </select>
    </form>
    <div class="fixed-top">
	    <div class="alert alert-danger" ng-click="clickHideErrors()" ng-repeat="thisError in BusData.errors.error">{{thisError.name}}</div>
	    <div class="alert alert-info" ng-click="clickHideInfos()" ng-repeat="thisInfo in BusData.infos.info">{{thisInfo.name}}</div>
	    <div class="alert alert-success" ng-click="clickHideSuccesses()" ng-repeat="thisSuccess in BusData.successes.success">{{thisSuccess.name}}</div>
	    <div class="alert alert-warning" ng-click="clickHideAlerts()" ng-repeat="thisAlert in BusData.alerts.alert">{{thisAlert.name}}</div>
    </div>
    <div id="map_canvas"></div>
    <script type="text/javascript" src="${pageContext.request.contextPath}/bus/js/busMap.js"></script>
    <bus-tabs></bus-tabs>
</div>