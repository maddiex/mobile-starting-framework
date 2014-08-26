/**
 * The MIT License
 * Copyright (c) 2011 Kuali Mobility Team
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

package org.kuali.mobility.admin.controllers;

import javax.servlet.http.HttpServletRequest;

import org.kuali.mobility.admin.service.AdminService;
import org.kuali.mobility.shared.controllers.AbstractMobilityController;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping("/admin")
public class AdminController extends AbstractMobilityController {

	@Autowired
	private AdminService adminService;

	@RequestMapping(value = "index", method = RequestMethod.GET)
	public String index(HttpServletRequest request, Model uiModel) {
		String viewName;
		if (!isAllowedAccess("KME-ADMINISTRATOR", request)) {
			viewName = "redirect:/errors/404";
		} else {
			viewName = "admin/index";
		}
		return viewName;
	}

	@RequestMapping(value = "node", method = RequestMethod.GET)
	public String tool(HttpServletRequest request, Model uiModel) {
		String viewName;
		if (!isAllowedAccess("KME-ADMINISTRATOR", request)) {
			viewName = "redirect:/errors/404";
		} else {
			viewName = "admin/node";
		}
		return viewName;
	}

	@RequestMapping(value = "nodelayout", method = RequestMethod.GET)
	public String layout(HttpServletRequest request, Model uiModel) {
		String viewName;
		if (!isAllowedAccess("KME-ADMINISTRATOR", request)) {
			viewName = "redirect:/errors/404";
		} else {
			viewName = "admin/nodelayout";
		}
		return viewName;
	}
}
