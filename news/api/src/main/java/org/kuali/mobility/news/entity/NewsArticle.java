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

package org.kuali.mobility.news.entity;


import java.util.Date;

import javax.xml.bind.annotation.XmlRootElement;

public interface NewsArticle {

	public NewsArticle copy();

	/**
	 * @return the publish date formatted for display (EEEE, MMMM dd, yyyy h:mm a)
	 */
	public String getPublishDateDisplay();

	public int compareTo(NewsArticle arg0);

	/**
	 * @return the title
	 */
	public String getTitle();

	/**
	 * @param title the title to set
	 */
	public void setTitle(String title);

	/**
	 * @return the URL to the full article
	 */
	public String getLink();

	/**
	 * @param link the URL to the full article
	 */
	public void setLink(String link);

	/**
	 * @return the body text of the article
	 */
	public String getDescription();

	/**
	 * @param description the body text to set
	 */
	public void setDescription(String description);

	/**
	 * @return the publish date
	 */
	public Date getPublishDate();

	/**
	 * @param publishDate the publish date to set
	 */
	public void setPublishDate(Date publishDate);

	/**
	 * @return the article id
	 */
	public String getArticleId();

	/**
	 * @param articleId the article id to set
	 */
	public void setArticleId(String articleId);

	/**
	 * @return the id of the NewsSource to which this article belongs
	 */
	public long getSourceId();

	/**
	 * @param sourceId the id of the NewsSource to which this article belongs
	 */
	public void setSourceId(long sourceId);

}
