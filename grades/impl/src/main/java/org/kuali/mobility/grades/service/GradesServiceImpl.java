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

package org.kuali.mobility.grades.service;

import java.util.Date;
import java.util.List;

import org.kuali.mobility.grades.dao.GradesDao;
import org.kuali.mobility.grades.entity.ModuleResults;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Implementation of the <code>GradesService</code>
 *
 * @author Charl Thiem
 */
@Service("gradesService")
public class GradesServiceImpl implements GradesService {

	/**
	 * Data Access object for grades
	 */
	@Autowired
	private GradesDao gradesDao;

	/* (non-Javadoc)
	 * @see org.kuali.mobility.grades.service.GradesService#setDao(org.kuali.mobility.grades.dao.GradesDao)
	 */
	@Override
	public void setDao(GradesDao dao) {
		this.gradesDao = dao;
	}

	/* (non-Javadoc)
	 * @see org.kuali.mobility.grades.service.GradesService#getDao()
	 */
	@Override
	public GradesDao getDao() {
		return this.gradesDao;
	}

	/* (non-Javadoc)
	 * @see org.kuali.mobility.grades.service.GradesService#getResults(java.sql.Date, java.sql.Date, java.lang.String, java.lang.String)
	 */
	@Override
	public List<ModuleResults> getResults(Date startDate, Date endDate, String username, String locale) {
		return this.gradesDao.getResults(startDate, endDate, username, locale);
	}

}
