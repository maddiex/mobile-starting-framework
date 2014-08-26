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
<div class="soc-section-header list-group-item">
    <p class="soc-section-header-line1">{{myScheduleData.myCurrentSection.subjectId}} {{myScheduleData.myCurrentSection.catalogNumber}} {{myScheduleData.myCurrentSection.number}} {{myScheduleData.myCurrentSection.type}}</p>
    <p class="soc-section-header-line2" ng-show="myScheduleData.myCurrentSection.courseTitle">{{myScheduleData.myCurrentSection.courseTitle}}</p>
    <p class="soc-section-header-line2" ng-show="myScheduleData.myCurrentSection.classTopic">{{myScheduleData.myCurrentSection.classTopic}}</p>
    <span class="academics-grade" ng-show="myScheduleData.myCurrentSection.grade">{{myScheduleData.myCurrentSection.grade}}</span>
</div>