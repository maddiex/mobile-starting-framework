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

package org.kuali.mobility.tours.service;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.QueryParam;

import org.apache.commons.lang3.StringEscapeUtils;
import org.kuali.mobility.configparams.service.ConfigParamService;
import org.kuali.mobility.math.geometry.Point;
import org.kuali.mobility.math.geometry.Spherical;
import org.kuali.mobility.security.user.api.User;
import org.kuali.mobility.tours.dao.ToursDao;
import org.kuali.mobility.tours.entity.POI;
import org.kuali.mobility.tours.entity.Tour;
import org.springframework.beans.factory.annotation.Autowired;

import de.micromata.opengis.kml.v_2_2_0.AltitudeMode;
import de.micromata.opengis.kml.v_2_2_0.Document;
import de.micromata.opengis.kml.v_2_2_0.Folder;
import de.micromata.opengis.kml.v_2_2_0.Kml;
import de.micromata.opengis.kml.v_2_2_0.KmlFactory;
import de.micromata.opengis.kml.v_2_2_0.LineString;
import de.micromata.opengis.kml.v_2_2_0.Style;
import de.micromata.opengis.kml.v_2_2_0.gx.FlyToMode;
import de.micromata.opengis.kml.v_2_2_0.gx.Playlist;

public class ToursServiceImpl implements ToursService {

	private final double FLY_SPEED = 40;//mph

	@Autowired
	private ConfigParamService configParamService;

	public void setConfigParamService(ConfigParamService configParamService) {
		this.configParamService = configParamService;
	}

	@Autowired
	private ToursDao toursDao;

	public void setConfigParamDao(ToursDao toursDao) {
		this.toursDao = toursDao;
	}

	@GET
	@Path("tour/search/byid")
	@Override
	public Tour findTourById(@QueryParam(value = "id") Long id) {
		return toursDao.findTourById(id);
	}

	@GET
	@Path("tour/search/byname")
	@Override
	public Tour findTourByName(@QueryParam(value = "name") String name) {
		return toursDao.findTourByName(name);
	}

	@PUT
	@Path("tour/save")
	@Override
	public Long saveTour(Tour tour) {
		return toursDao.saveTour(tour);
	}

	@GET
	@Path("tour/lookup")
	@Override
	public List<Tour> findAllTours() {
		return toursDao.findAllTours();
	}

	@DELETE
	@Path("tour/delete")
	@Override
	public void deleteTourById(@QueryParam(value = "id") Long id) {
		toursDao.deleteTourById(id);
	}

	@PUT
	@Path("tour/repeat")
	@Override
	public void duplicateTourById(@QueryParam(value = "id") Long id) {
		Tour tour = toursDao.findTourById(id).copy(false);
		tour.setName(tour.getName() + " (copy)");
		toursDao.saveTour(tour);
	}

	@PUT
	@Path("poi/repeat")
	@Override
	public void duplicatePoiById(Long id) {
		POI poi = toursDao.findPoiById(id).copy(false);
		poi.setName(poi.getName() + " (copy)");
		toursDao.savePoi(poi);
	}

	@GET
	@Path("poi/search/byid")
	@Override
	public POI findPoiById(@QueryParam(value = "id") Long id) {
		return toursDao.findPoiById(id);
	}

	@GET
	@Path("poi/search/byorder")
	@Override
	public POI findPoiByOrder(@QueryParam(value = "id") Long tourId, @QueryParam(value = "order") Integer order) {
		return toursDao.findPoiByOrder(tourId, order);
	}

	@PUT
	@Path("poi/save")
	@Override
	public Long savePoi(POI poi) {
		return toursDao.savePoi(poi);
	}

	@DELETE
	@Path("poi/delete")
	@Override
	public void deletePoiById(@QueryParam(value = "id") Long poiId) {
		toursDao.deletePoiById(poiId);
	}

	@GET
	@Path("poi/common")
	@Override
	public List<POI> findAllCommonPOI() {
		return toursDao.findAllCommonPOI();
	}

	@Override
	public boolean hasAccessToEditTour(User user, Tour tour) {
//		if (user.isMember(configParamService.findValueByName("Admin.Group.Name"))) {
//			return true;
//		} else {
//			if (tour.getEditGroups().isEmpty()) {
//				return true;
//			} else {
//				for (String group : tour.getEditGroups()){
//					if (user.isMember(group)) {
//						return true;
//					}
//				}
//			}
//		}
//		
//		return false;
		return true;
	}

	@Override
	public boolean hasAccessToViewTour(User user, Tour tour) {
//		if (user.isMember(configParamService.findValueByName("Admin.Group.Name"))) {
//			return true;
//		} else {
//			if (tour.getViewGroups().isEmpty()){
//				return true;
//			} else {
//				for (String group : tour.getViewGroups()){
//					if (user.isMember(group)) {
//						return true;
//					}
//				}
//			}
//		}
//		
//		return false;
		return true;
	}

	@Override
	public boolean hasAccessToEditPOI(User user, POI poi) {
//		if (user.isMember(configParamService.findValueByName("Admin.Group.Name"))) {
//			return true;
//		} else {
//			for (String group : poi.getEditGroups()){
//				if (user.isMember(group)) {
//					return true;
//				}
//			}
//		}
//		
//		return false;
		return true;
	}

	@Override
	public boolean hasAccessToViewPOI(User user, POI poi) {
//		if (user.isMember(configParamService.findValueByName("Admin.Group.Name"))) {
//			return true;
//		} else {
//			if (poi.getViewGroups().isEmpty()){
//				return true;
//			} else {
//				for (String group : poi.getViewGroups()){
//					if (user.isMember(group)) {
//						return true;
//					}
//				}
//			}
//		}
//		
//		return false;
		return true;
	}

	@Override
	public boolean hasAccessToPublish(User user) {
//		if (user.isMember(configParamService.findValueByName("Admin.Group.Name")) || user.isMember(configParamService.findValueByName("Tours.Publishers.Group"))) {
//			return true;
//		} else {
//			return false;
//		}
		return true;
	}

	@Override
	public Kml createTourKml(Tour tour) {
		Kml kml = KmlFactory.createKml();
		Document document = new Document();
		kml.setFeature(document);

		final Style style = document.createAndAddStyle().withId("PathStyle");
		style.createAndSetLineStyle().withColor("FF0000FF").withWidth(3.0d);

		final Folder folder = document.createAndAddFolder().withName("Points of Interest").withOpen(true).withDescription("The points of interest selected for this tour.");
		int i = 0;
		for (POI poi : tour.getPointsOfInterest()) {
			folder.createAndAddPlacemark()
					.withId("poi" + i).withName(poi.getName()).withDescription(getPoiDescription(poi)).createAndSetPoint().addToCoordinates(poi.getLongitude() + "," + poi.getLatitude() + ",0");
			i++;
		}

		List<Point> polyLine = decodePolyLine(tour.getPath());
		LineString lineString = document.createAndAddPlacemark().withName(tour.getName()).withDescription(tour.getDescription()).withStyleUrl("PathStyle")
				.createAndSetLineString().withTessellate(true).withAltitudeMode(AltitudeMode.CLAMP_TO_GROUND);
		for (Point p : polyLine) {
			lineString.addToCoordinates(p.getLongitude(), p.getLatitude());
		}

		Map<Integer, List<Integer>> poiPathIndices = findPoiTourIndices(polyLine, tour.getPointsOfInterest());
		de.micromata.opengis.kml.v_2_2_0.gx.Tour kmlTour = document.createAndAddTour().withName(StringEscapeUtils.escapeHtml4(tour.getName()));
		Playlist playlist = kmlTour.createAndSetPlaylist();

		double heading = 0;
		double flyTime = 3;
		Point lastPoint = null;
		int index = 0;
		List<POI> pois = tour.getPointsOfInterest();
		for (Point vertex : polyLine) {
			if (lastPoint != null) {
				heading = Spherical.computeHeading(lastPoint, vertex);
				flyTime = computeFlyTime(lastPoint, vertex);
				buildFlyTo(playlist, vertex, heading, FlyToMode.SMOOTH, flyTime);
			} else {
				buildFlyTo(playlist, vertex, heading, FlyToMode.BOUNCE, flyTime);
			}
			lastPoint = vertex;

			if (!poiPathIndices.isEmpty() && poiPathIndices.get(index) != null) {
				List<Integer> poiIndices = poiPathIndices.get(index);
				for (int poiIndex : poiIndices) {
					POI poi = pois.get(poiIndex);
					Point point = new Point(poi.getLatitude(), poi.getLongitude());
					heading = Spherical.computeHeading(lastPoint, point);
					flyTime = computeFlyTime(lastPoint, point);
					buildFlyTo(playlist, point, heading, FlyToMode.SMOOTH, flyTime);
//	        		buildShowHideBalloon(playlist, "poi" + poiIndex, true);
					playlist.createAndAddWait();
//	        		buildShowHideBalloon(playlist, "poi" + poiIndex, false);
					lastPoint = point;
				}
			}
			index++;
		}
		return kml;
	}

	private void buildFlyTo(Playlist playlist, Point point, double heading, FlyToMode mode, double duration) {
		playlist.createAndAddFlyTo()
				.withDuration(duration)
				.withFlyToMode(mode)
				.createAndSetLookAt()
				.withAltitudeMode(AltitudeMode.CLAMP_TO_GROUND)
				.withRange(100)
				.withTilt(45)
				.withHeading(heading)
				.withLatitude(point.getLatitude())
				.withLongitude(point.getLongitude());
	}

//	private void buildShowHideBalloon(Playlist playlist, String placemarkId, boolean show) {
//		//new BalloonVisibility(BalloonVisibility.Visibility.SHOW)
//		List<Object> createOrDeleteOrChange = new ArrayList<Object>();
//		Change change = new Change().addToAbstractObject(new Placemark().withTargetId(placemarkId).addToFeatureObjectExtension(new BalloonVisibility(BalloonVisibility.Visibility.SHOW)));
//		createOrDeleteOrChange.add(change);
//		playlist.createAndAddAnimatedUpdate().createAndSetUpdate(null, createOrDeleteOrChange);
//	}


	private String getPoiDescription(POI poi) {
		String description = StringEscapeUtils.escapeHtml4(poi.getDescription());
		if (poi.getUrl() != null && poi.getUrl().length() > 0) {
			description += "<br /><a href=\"" + poi.getUrl() + "\" target=\"_blank\">" + poi.getUrl() + "</a>";
		}
		return description;
	}

	private double computeFlyTime(Point p1, Point p2) {
		return Spherical.computeDistanceBetween(p1, p2) * 2.2369363 / FLY_SPEED; //convert to meters/second and return seconds
	}

	private Map<Integer, List<Integer>> findPoiTourIndices(List<Point> path, List<POI> pois) {
		Map<Integer, List<Integer>> markerPathIndices = new HashMap<Integer, List<Integer>>(); //markerPathIndices[indexOfPointInPath] = poiMarkerIndexArray;  //will be null if the point is not the closest to a POI
		double shortestVal;
		int shortestIndex;
		Point poiLocation;
		Point pathVertex;
		double distance;
		POI poi;

		for (int m = 0; m < pois.size(); m++) {
			poi = pois.get(m);
			poiLocation = new Point(poi.getLatitude(), poi.getLongitude());
			shortestVal = 999999;
			shortestIndex = 0;
			int index = 0;
			for (Iterator<Point> iter = path.iterator(); iter.hasNext(); ) {
				pathVertex = iter.next();
				distance = Spherical.computeDistanceBetween(pathVertex, poiLocation);
				if (distance < shortestVal) {
					shortestVal = distance;
					shortestIndex = index;
				}
				index++;
			}
			List<Integer> nearbyPois = markerPathIndices.get(shortestIndex);
			if (nearbyPois == null) {
				nearbyPois = new ArrayList<Integer>();
				markerPathIndices.put(shortestIndex, nearbyPois);
			}
			nearbyPois.add(m);
		}

		for (Map.Entry<Integer, List<Integer>> entry : markerPathIndices.entrySet()) {
			List<Integer> nearbyPois = entry.getValue();
			if (nearbyPois.size() > 1) { //no need to sort one item
				pathVertex = path.get(entry.getKey());
				Map<Integer, Double> markerDistMap = new HashMap<Integer, Double>();
				for (int poiIndex : nearbyPois) {
					poi = pois.get(poiIndex);
					poiLocation = new Point(poi.getLatitude(), poi.getLongitude());
					distance = Spherical.computeDistanceBetween(pathVertex, poiLocation);
					markerDistMap.put(poiIndex, distance);
				}
				entry.setValue(sortByValue(markerDistMap));
			}
		}
		return markerPathIndices;
	}

	private static List<Integer> sortByValue(final Map<Integer, Double> m) {
		List<Integer> keys = new ArrayList<Integer>();
		keys.addAll(m.keySet());
		Collections.sort(keys, new Comparator<Integer>() {
			public int compare(Integer o1, Integer o2) {
				Double v1 = m.get(o1);
				Double v2 = m.get(o2);
				if (v1 == null) {
					return (v2 == null) ? 0 : 1;
				}
				return v1.compareTo(v2);
			}
		});
		return keys;
	}

	//http://www.geekyblogger.com/2010/12/decoding-polylines-from-google-maps.html
	private static List<Point> decodePolyLine(String encoded) {
		List<Point> poly = new ArrayList<Point>();
		int index = 0, len = encoded.length();
		int lat = 0, lng = 0;
		while (index < len) {
			int b, shift = 0, result = 0;
			do {
				b = encoded.charAt(index++) - 63;
				result |= (b & 0x1f) << shift;
				shift += 5;
			} while (b >= 0x20);
			int dlat = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
			lat += dlat;
			shift = 0;
			result = 0;
			do {
				b = encoded.charAt(index++) - 63;
				result |= (b & 0x1f) << shift;
				shift += 5;
			} while (b >= 0x20);
			int dlng = ((result & 1) != 0 ? ~(result >> 1) : (result >> 1));
			lng += dlng;
			org.kuali.mobility.math.geometry.Point p = new org.kuali.mobility.math.geometry.Point((((double) lat / 1E5)),
					(((double) lng / 1E5)));
			poly.add(p);
		}
		return poly;
	}
}
