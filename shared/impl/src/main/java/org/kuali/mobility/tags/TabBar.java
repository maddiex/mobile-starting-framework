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

package org.kuali.mobility.tags;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.jsp.JspException;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;
import javax.servlet.jsp.tagext.SimpleTagSupport;

/**
 * @author Kuali Mobility Team <mobility.collab@kuali.org>
 */
public class TabBar extends SimpleTagSupport {

	private static final Logger LOG = LoggerFactory.getLogger(TabBar.class);

	private String id;
	private boolean showIcons;
	private String iconPosition;
	private String cssClass;
	private boolean footer;

	@Override
	public void doTag() throws JspException {
		PageContext pageContext = (PageContext) getJspContext();
		JspWriter out = pageContext.getOut();
		try {
			if (isFooter()) {
				out.println("<div data-role=\"footer\" data-position=\"fixed\" data-tap-toggle=\"false\">");
			}
			out.println("<div data-role=\"navbar\"" + (id != null && !"".equals(id.trim()) ? " id=\"" + id.trim() + "\"" : "") + (cssClass != null && !"".equals(cssClass.trim()) ? " class=\"" + cssClass.trim() + "\"" : "") + (getShowIcons() && null != getIconPosition() ? " data-iconpos=\"" + getIconPosition().trim() + "\"" : "") + "><ul>");
			getJspBody().invoke(out);

			out.println("</ul></div>");
			if (isFooter()) {
				out.println("</div>");
			}
		} catch (Exception e) {
			LOG.error(e.getLocalizedMessage(), e);
		}
	}

	/**
	 * @return the id
	 */
	public String getId() {
		return id;
	}

	/**
	 * @param id the id to set
	 */
	public void setId(String id) {
		this.id = id;
	}

	/**
	 * @return the iconPosition
	 */
	public String getIconPosition() {
		return iconPosition;
	}

	/**
	 * @param iconPosition the iconPosition to set
	 */
	public void setIconPosition(String iconPosition) {
		this.iconPosition = iconPosition;
	}

	/**
	 * @return the cssClass
	 */
	public String getCssClass() {
		return cssClass;
	}

	/**
	 * @param cssClass the cssClass to set
	 */
	public void setCssClass(String cssClass) {
		this.cssClass = cssClass;
	}

	/**
	 * @return the isFooter
	 */
	public boolean isFooter() {
		return footer;
	}

	/**
	 * @param isFooter the isFooter to set
	 */
	public void setFooter(boolean isFooter) {
		this.footer = isFooter;
	}

	/**
	 * @return the showIcons
	 */
	public boolean getShowIcons() {
		return showIcons;
	}

	/**
	 * @param showIcons the showIcons to set
	 */
	public void setShowIcons(boolean showIcons) {
		this.showIcons = showIcons;
	}
}
