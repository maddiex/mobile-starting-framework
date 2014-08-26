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

package org.kuali.mobility.writer.dao;

import org.kuali.mobility.writer.entity.Topic;

import java.util.List;

/**
 * Topic Data Access Object
 *
 * @author Kuali Mobility Team (mobility.collab@kuali.org)
 * @since 3.0.0
 */
public interface TopicDao {

	/**
	 * Gets all topics
	 *
	 * @return
	 */
	public List<Topic> getTopics();

	/**
	 * Gets a specific topic
	 *
	 * @param topicId
	 * @return
	 */
	public Topic getTopic(long topicId);


	/**
	 * Persists a topic
	 *
	 * @param topic Topic to be persisted.
	 */
	public Topic saveTopic(Topic topic);
}
