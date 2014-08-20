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

package org.kuali.mobility.feedback.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;

import org.kuali.mobility.feedback.entity.Feedback;
import org.kuali.mobility.feedback.entity.FeedbackDeviceType;
import org.kuali.mobility.feedback.entity.FeedbackSubject;
import org.springframework.stereotype.Repository;

@Repository
public class FeedbackDeviceTypeDaoImpl implements FeedbackDeviceTypeDao {

    @PersistenceContext
    private EntityManager entityManager;

    public FeedbackDeviceTypeDaoImpl() {}
        
    public EntityManager getEntityManager() {
        return entityManager;
    }

    public void setEntityManager(EntityManager entityManager) {
        this.entityManager = entityManager;
    }

	@Override
	public List<FeedbackDeviceType> getFeedbackDeviceTypes() {
		Query query = entityManager.createQuery("select n from FeedbackDeviceType n");
        try { 
        	List<FeedbackDeviceType> list = ((List<FeedbackDeviceType>) query.getResultList());
			return list;
        } catch (Exception e) {        	
        	return null;
        }
	}
} 