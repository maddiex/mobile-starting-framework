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
<div ng-controller="SocSectionController" data-ng-init="init()">
    <div class="alert alert-danger" ng-repeat="error in SocData.errors.error" ng-click="clickHideErrors()">{{error.name}}</div>
    <div class="list-group">
        <a href="#/sectionDetail" class="list-group-item" ng-click="socSectionClick(thisSection)" ng-repeat="thisSection in SocData.socCurrentCatalogNumber.section | orderBy:number">
            <span class="pull-right glyphicon glyphicon-chevron-right black right-decoration"></span>
            <strong>Section {{thisSection.number}} {{thisSection.typeDescription}}</strong><br/>
            <span ng-if="sectionOpen(thisSection)" class="pull-right green">{{thisSection.availableSeats}} {{thisSection.enrollmentStatus}}</span>
            <span ng-if="sectionClosed(thisSection)" class="pull-right red">{{thisSection.enrollmentStatus}}</span>
            <span ng-if="sectionWaitList(thisSection)" class="pull-right orange">{{thisSection.enrollmentStatus}}</span>
            <p ng-hide="thisSection.meeting && thisSection.meeting.length>0">TBA</p>
            <soc-section-list-meeting ng-repeat="thisMeeting in thisSection.meeting | limitTo:sectionMeetingDisplayLimit | orderBy:number"></soc-section-list-meeting>
        </a>
    </div>
</div>
