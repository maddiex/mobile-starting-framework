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
<%@ taglib prefix="kme3" uri="http://kuali.org/mobility/v3.0" %>
<%--
Copyright 2014 The Kuali Foundation Licensed under the Educational
Community License, Version 2.0 (the "License"); you may not use this file
except in compliance with the License. You may obtain a copy of the License
at http://www.osedu.org/licenses/ECL-2.0 Unless required by applicable law or
agreed to in writing, software distributed under the License is distributed
on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
express or implied. See the License for the specific language governing
permissions and limitations under the License.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div ng-controller="EventsController" data-ng-init="init()">
    <div class="list-group">
        <div class="list-group-item event-date-nav">
            <a ng-click="previousDayClick()" class="pull-left kme-nav-back"><span class="glyphicon glyphicon-chevron-left"></span></a>
            <a ng-click="nextDayClick()" class="pull-right kme-nav-menu"><span class="glyphicon glyphicon-chevron-right"></span></a>
            <span class="event-date-label">{{EventsData.date}}</span>
        </div>

        <div class="list-group-item bg-info" ng-hide="EventsData.events">
            Loading events....
        </div>
        <a href="#/detail" class="list-group-item" ng-hide="event.children" ng-click="eventClick(event)" ng-repeat="event in EventsData.events.event">
            <span class="pull-right glyphicon glyphicon-chevron-right black"></span>
            <strong>{{event.title}}</strong>
            <p>{{event.displayStartTime}} - {{event.displayEndTime}} | {{event.location}}</p>
        </a>
    </div>
</div>
