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


package org.kuali.mobility.notification.dao;

import java.util.Date;
import java.util.List;

import org.kuali.mobility.notification.entity.Notification;
import org.kuali.mobility.notification.entity.UserNotification;

public interface NotificationDao {

	Notification findNotificationById(Long id);

	Long saveNotification(Notification notification);

	void deleteNotificationById(Long id);

	List<Notification> findAllNotifications();

	List<Notification> findAllValidNotifications(Date date);

	UserNotification findUserNotificationById(Long id);

	UserNotification findUserNotificationByNotificationId(Long id);

	Long saveUserNotification(UserNotification userNotification);

	void deleteUserNotificationById(Long id);

	List<UserNotification> findAllUserNotificationsByDeviceId(String id);

	List<UserNotification> findAllUserNotificationsByPersonId(Long id);

}
