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

<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="kme" uri="http://kuali.org/mobility" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<spring:message code="dining.currencyLabel" var="msgCurrencyLabel"/>

<kme:multiPage title="Menus" id="dining" backButton="true" homeButton="true" cssFilename="dining" jsFilename="dining">
	<kme:childPage title="${name}" id="menus" backButton="true" homeButton="true">
		<kme:content>
			<kme:listView id="menuList" dataTheme="c" dataDividerTheme="b" filter="false" dataInset="false" >
			</kme:listView>
                        <div id="popupLegend" data-role="popup" class="ui-content">
                            <a href="#" data-rel="back" data-role="button" data-theme="a" data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
                            <ul id="legendItems">
                                <li><span class="nutrition-featured">Featured</span></li>
                                <li><span class="nutrition-glutenfree">Gluten-free</span></li>
                                <li><span class="nutrition-halal">Halal</span></li>
                                <li><span class="nutrition-mhealthy">MHealthy</span></li>	
                                <li><span class="nutrition-vegan">Vegan</span></li>
                                <li><span class="nutrition-vegetarian">Vegetarian</span></li>
                            </ul>
                        </div>
		</kme:content>
	</kme:childPage>
	<kme:childPage title="Menus" id="menus1" backButton="true" homeButton="true">
		<kme:content>
			<kme:listView id="menuList1" filter="false" dataTheme="c" dataInset="false" dataDividerTheme="b">
			</kme:listView>
                        <div id="popupLegend" data-role="popup" class="ui-content">
                            <a href="#" data-rel="back" data-role="button" data-theme="a" data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
                            <ul id="legendItems">
                                <li><span class="nutrition-featured">Featured</span></li>
                                <li><span class="nutrition-glutenfree">Gluten-free</span></li>
                                <li><span class="nutrition-halal">Halal</span></li>
                                <li><span class="nutrition-mhealthy">MHealthy</span></li>	
                                <li><span class="nutrition-vegan">Vegan</span></li>
                                <li><span class="nutrition-vegetarian">Vegetarian</span></li>
                            </ul>
                        </div>
		</kme:content>
	</kme:childPage>
	<kme:childPage title="Menus" id="menus2" backButton="true" homeButton="true">
		<kme:content>
			<kme:listView id="menuList2" filter="false" dataTheme="c" dataInset="false" dataDividerTheme="b">
			</kme:listView>
                        <div id="popupLegend" data-role="popup" class="ui-content">
                            <a href="#" data-rel="back" data-role="button" data-theme="a" data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
                            <ul id="legendItems">
                                <li><span class="nutrition-featured">Featured</span></li>
                                <li><span class="nutrition-glutenfree">Gluten-free</span></li>
                                <li><span class="nutrition-halal">Halal</span></li>
                                <li><span class="nutrition-mhealthy">MHealthy</span></li>	
                                <li><span class="nutrition-vegan">Vegan</span></li>
                                <li><span class="nutrition-vegetarian">Vegetarian</span></li>
                            </ul>
                        </div>
		</kme:content>
	</kme:childPage>
	<kme:childPage title="Menus" id="menus3" backButton="true" homeButton="true">
		<kme:content>
			<kme:listView id="menuList3" filter="false" dataTheme="c" dataInset="false" dataDividerTheme="b">
			</kme:listView>
                        <div id="popupLegend" data-role="popup" class="ui-content">
                            <a href="#" data-rel="back" data-role="button" data-theme="a" data-icon="delete" data-iconpos="notext" class="ui-btn-right">Close</a>
                            <ul id="legendItems">
                                <li><span class="nutrition-featured">Featured</span></li>
                                <li><span class="nutrition-glutenfree">Gluten-free</span></li>
                                <li><span class="nutrition-halal">Halal</span></li>
                                <li><span class="nutrition-mhealthy">MHealthy</span></li>	
                                <li><span class="nutrition-vegan">Vegan</span></li>
                                <li><span class="nutrition-vegetarian">Vegetarian</span></li>
                            </ul>
                        </div>
		</kme:content>
	</kme:childPage>
        
    <script type="text/javascript">
        $(document).ready(function()
        {
        
            $.ajax({
				type:'Get',
				url:"${pageContext.request.contextPath}/services/dining/diningHall?name=${name}&_type=json",
				dataType: "json",
				contentType: "application/json;charset=utf-8",
				async: true,
				success:function(data) {
					var mealindex = 0;
					var skipIndex = false;
					if( data.diningHall.menu.length === 1 ) {
						skipIndex=true;
					}
					$(data.diningHall.menu).each(function(index,element){
                        console.log("Menu name is: "+element.name);
                        console.log(element.name+" has "+element.category.length+" categories.");
						mealindex ++;
						if( !skipIndex ) {
							var mealoutput = "<li data-theme=\"c\" data-icon=\"listview\" class=\"ui-btn ui-btn-icon-right ui-li-has-arrow ui-li ui-li-has-icon ui-btn-up-c\">";
							mealoutput += "<div class=\"ui-btn-inner ui-li\"><div class=\"ui-btn-text\">";
							mealoutput += "<a href=\"#menus"+mealindex+"\" id=\"\" class=\"ui-link-inherit\">";
							mealoutput +=  element.name;
							mealoutput +=  "</a></div><span class=\"ui-icon ui-icon-arrow-r ui-icon-shadow\"></span></div></li>";
							$('#menuList').append(mealoutput);
							$('#menus'+mealindex+' data-role$ h1').val(element.name);
						}
						if (element.category===undefined)
						{
							console.log("element.category is undefined");
						}
						else
						{
							var output = "";
							$(element.category).each(function(index,element1){
								if (element1.menuItem===undefined)
								{
								}
								else
								{
									output +=  "<li class=\"contentItem category-" + index + "\" data-role=\"list-divider\" data-theme=\"b\">";
									output +=   element1.name;
									if(element.category.quantities === undefined)
									{
									}
									else
									{
										for(var q in element1.quanities)
										{
											output += "<em> -" + element1.quanities[q] +"</em>";
										}
									}
									output += "</li>";

									$(element1.menuItem).each(function(index,element2)
									{
										var itemindex = 0;
										itemindex++;
										output += "<li class=\"contentItem category-" + itemindex + "\" data-theme=\"c\">";
										output += "<h3 class=\"wrap\">" + element2.name + "</h3>";
										if(element2.price === undefined)
										{
										}
										else
										{
											output += "<p class=\"wrap\">";
											for(var p in element2.price)
											{
												output += "<em>";
												if( p > 0 ) {
													output+= " - ";
												}
                                                output += "${msgCurrencyLabel}";
												output += element2.price[p] +"</em>";
											}
											output += "</p>";
										}
										if(element2.attribute === undefined)
										{
										}
										else
										{
											output += "<div class=\"nutritionIcons\">";
                                            output += "<a href=\"#popupLegend\" data-rel=\"popup\" data-transition=\"slideup\" data-position-to=\"window\">";
											for(var a in element2.attribute)
											{
												output += "<span class=\"nutrition nutrition-" + element2.attribute[a] + "\">";
												output += element2.attribute[a];
												output += "</span>";
											}
                                            output +=  "</a>";
											output +=  "</div>";

										}//element2.attributes
										output += "</li>";
									});//element1.menuItem each
								} //element1.menuItem else
							}); //element.category each
							if( skipIndex ) {
								$('#menuList').append(output);
							} else {
								$('#menuList'+mealindex).append(output);
							}

						}//else end of categories
					});//data.meal each
					try {
						$('#menuList').listview('refresh');
						$('#menuList1').listview('refresh');
						$('#menuList2').listview('refresh');
						$('#menuList3').listview('refresh');
					} catch( err ) {

					}
				},//success end
				error:function(){
					console.log("error fetching data.");
				}
			});
        });

    </script>
</kme:multiPage>