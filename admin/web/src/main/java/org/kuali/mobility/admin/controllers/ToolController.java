/*
  The MIT License (MIT)
  
  Copyright (C) 2014 by Kuali Foundation

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
*/

package org.kuali.mobility.admin.controllers;

import javax.servlet.http.HttpServletRequest;

import org.kuali.mobility.admin.service.MembershipService;
import org.kuali.mobility.shared.controllers.AbstractMobilityController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/tool")
public class ToolController extends AbstractMobilityController {

	@Autowired
	private MembershipService membershipService;

	@RequestMapping(value = "/js/tool.js")
	public String getJavaScript(HttpServletRequest request, Model uiModel) {
		String viewName;
		if (!isAllowedAccess("KME-ADMINISTRATOR", request)) {
			viewName = "redirect:/errors/404";
		} else {
			viewName = "ui3/tool/js/tool";
		}
		return viewName;

	}

	@RequestMapping(value = "/templates/{key}")
	public String getAngularTemplates(@PathVariable("key") String key,
			HttpServletRequest request, Model uiModel) {
		String viewName;
		if (!isAllowedAccess("KME-ADMINISTRATOR", request)) {
			viewName = "redirect:/errors/404";
		} else {
			viewName = "ui3/tool/templates/" + key;
		}
		return viewName;
	}

	@RequestMapping(method = RequestMethod.GET)
	public String homePage(HttpServletRequest request, Model uiModel) {
		String viewName;
		if (!isAllowedAccess("KME-ADMINISTRATOR", request)) {
			viewName = "redirect:/errors/404";
		} else {
			viewName = "ui3/tool/index";
		}
		return viewName;
	}
}