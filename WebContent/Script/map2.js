function initMap() {
	var mapOptions = {
      streetViewControl: false,
      mapTypeControl: false,
      mapTypeId: google.maps.MapTypeId.ROADMAP
   }
   
    map = new google.maps.Map(document.getElementById('map'), mapOptions);
    
	for(var i = 1; i<=count; i++){
		let loca =[];
		var Placename = document.getElementById('pn'+i).value;
		var Latitude = parseFloat(document.getElementById('Latitude'+i).value);
		var Longtiude = parseFloat(document.getElementById('Longtiude'+i).value);
		loca.push(Placename);
		loca.push(Latitude);
		loca.push(Longtiude);
		locations.push(loca);
	}
	
	bounds = new google.maps.LatLngBounds();
	
    for (var i = 0; i < locations.length; i++) {
    		coordinates.push(new google.maps.LatLng(locations[i][1], locations[i][2]));
        var marker = new google.maps.Marker({
            map: map,
            label: locations[i][0],
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        });
    }
    for (var i=0; i < count; i++) {
    	bounds.extend(coordinates[i]);
	}
	map.fitBounds(bounds);
    
}
var map;
var markersArray=[];
const locations = [];
var count= parseInt(document.getElementById('count').value);
coordinates = [];


