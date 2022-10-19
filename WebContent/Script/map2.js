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
	
    const Path = new google.maps.Polyline({
    path: coordinates,
    geodesic: true,
    strokeColor: "#FF0000",
    strokeOpacity: 1.0,
    strokeWeight: 2,
  });

  Path.setMap(map);
}
var map;
var markersArray=[];
const locations = [];
var count= parseInt(document.getElementById('count').value);
coordinates = [];


function center1(){
	var Latitude1 = parseFloat(document.getElementById('Latitude1').value);
	var Longtiude1 = parseFloat(document.getElementById('Longtiude1').value);
	const myLatLng ={
				lat: Latitude1,
				lng: Longtiude1
	};
      var mapOptions = {
      streetViewControl: false,
      mapTypeControl: false,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
	center: myLatLng,
	zoom: 14
   }
   
    map = new google.maps.Map(document.getElementById('map'), mapOptions);
    
    for (var i = 0; i < locations.length; i++) {
        var marker = new google.maps.Marker({
            map: map,
            label: locations[i][0],
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        });
    }

	
    const Path = new google.maps.Polyline({
    path: coordinates,
    geodesic: true,
    strokeColor: "#FF0000",
    strokeOpacity: 1.0,
    strokeWeight: 2,
  });

  Path.setMap(map);
}

function center2(){
	var Latitude1 = parseFloat(document.getElementById('Latitude2').value);
	var Longtiude1 = parseFloat(document.getElementById('Longtiude2').value);
	const myLatLng ={
				lat: Latitude1,
				lng: Longtiude1
	};
      var mapOptions = {
      streetViewControl: false,
      mapTypeControl: false,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
	center: myLatLng,
	zoom: 14
   }
   
    map = new google.maps.Map(document.getElementById('map'), mapOptions);
    
    for (var i = 0; i < locations.length; i++) {
        var marker = new google.maps.Marker({
            map: map,
            label: locations[i][0],
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        });
    }

	
    const Path = new google.maps.Polyline({
    path: coordinates,
    geodesic: true,
    strokeColor: "#FF0000",
    strokeOpacity: 1.0,
    strokeWeight: 2,
  });

  Path.setMap(map);
}

function center3(){
	var Latitude1 = parseFloat(document.getElementById('Latitude3').value);
	var Longtiude1 = parseFloat(document.getElementById('Longtiude3').value);
	const myLatLng ={
				lat: Latitude1,
				lng: Longtiude1
	};
      var mapOptions = {
      streetViewControl: false,
      mapTypeControl: false,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
	center: myLatLng,
	zoom: 14
   }
   
    map = new google.maps.Map(document.getElementById('map'), mapOptions);
    
    for (var i = 0; i < locations.length; i++) {
        var marker = new google.maps.Marker({
            map: map,
            label: locations[i][0],
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        });
    }

	
    const Path = new google.maps.Polyline({
    path: coordinates,
    geodesic: true,
    strokeColor: "#FF0000",
    strokeOpacity: 1.0,
    strokeWeight: 2,
  });

  Path.setMap(map);
}
function center4(){
	var Latitude1 = parseFloat(document.getElementById('Latitude4').value);
	var Longtiude1 = parseFloat(document.getElementById('Longtiude4').value);
	const myLatLng ={
				lat: Latitude1,
				lng: Longtiude1
	};
      var mapOptions = {
      streetViewControl: false,
      mapTypeControl: false,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
	center: myLatLng,
	zoom: 14
   }
   
    map = new google.maps.Map(document.getElementById('map'), mapOptions);
    
    for (var i = 0; i < locations.length; i++) {
        var marker = new google.maps.Marker({
            map: map,
            label: locations[i][0],
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        });
    }

	
    const Path = new google.maps.Polyline({
    path: coordinates,
    geodesic: true,
    strokeColor: "#FF0000",
    strokeOpacity: 1.0,
    strokeWeight: 2,
  });

  Path.setMap(map);
}
function center5(){
	var Latitude1 = parseFloat(document.getElementById('Latitude5').value);
	var Longtiude1 = parseFloat(document.getElementById('Longtiude5').value);
	const myLatLng ={
				lat: Latitude1,
				lng: Longtiude1
	};
      var mapOptions = {
      streetViewControl: false,
      mapTypeControl: false,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
	center: myLatLng,
	zoom: 14
   }
   
    map = new google.maps.Map(document.getElementById('map'), mapOptions);
    
    for (var i = 0; i < locations.length; i++) {
        var marker = new google.maps.Marker({
            map: map,
            label: locations[i][0],
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        });
    }

	
    const Path = new google.maps.Polyline({
    path: coordinates,
    geodesic: true,
    strokeColor: "#FF0000",
    strokeOpacity: 1.0,
    strokeWeight: 2,
  });

  Path.setMap(map);
}
function center6(){
	var Latitude1 = parseFloat(document.getElementById('Latitude6').value);
	var Longtiude1 = parseFloat(document.getElementById('Longtiude6').value);
	const myLatLng ={
				lat: Latitude1,
				lng: Longtiude1
	};
      var mapOptions = {
      streetViewControl: false,
      mapTypeControl: false,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
	center: myLatLng,
	zoom: 14
   }
   
    map = new google.maps.Map(document.getElementById('map'), mapOptions);
    
    for (var i = 0; i < locations.length; i++) {
        var marker = new google.maps.Marker({
            map: map,
            label: locations[i][0],
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        });
    }

	
    const Path = new google.maps.Polyline({
    path: coordinates,
    geodesic: true,
    strokeColor: "#FF0000",
    strokeOpacity: 1.0,
    strokeWeight: 2,
  });

  Path.setMap(map);
}
function center7(){
	var Latitude1 = parseFloat(document.getElementById('Latitude7').value);
	var Longtiude1 = parseFloat(document.getElementById('Longtiude7').value);
	const myLatLng ={
				lat: Latitude1,
				lng: Longtiude1
	};
      var mapOptions = {
      streetViewControl: false,
      mapTypeControl: false,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
	center: myLatLng,
	zoom: 14
   }
   
    map = new google.maps.Map(document.getElementById('map'), mapOptions);
    
    for (var i = 0; i < locations.length; i++) {
        var marker = new google.maps.Marker({
            map: map,
            label: locations[i][0],
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        });
    }

	
    const Path = new google.maps.Polyline({
    path: coordinates,
    geodesic: true,
    strokeColor: "#FF0000",
    strokeOpacity: 1.0,
    strokeWeight: 2,
  });

  Path.setMap(map);
}
function center8(){
	var Latitude1 = parseFloat(document.getElementById('Latitude8').value);
	var Longtiude1 = parseFloat(document.getElementById('Longtiude8').value);
	const myLatLng ={
				lat: Latitude1,
				lng: Longtiude1
	};
      var mapOptions = {
      streetViewControl: false,
      mapTypeControl: false,
      mapTypeId: google.maps.MapTypeId.ROADMAP,
	center: myLatLng,
	zoom: 14
   }
   
    map = new google.maps.Map(document.getElementById('map'), mapOptions);
    
    for (var i = 0; i < locations.length; i++) {
        var marker = new google.maps.Marker({
            map: map,
            label: locations[i][0],
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        });
    }

	
    const Path = new google.maps.Polyline({
    path: coordinates,
    geodesic: true,
    strokeColor: "#FF0000",
    strokeOpacity: 1.0,
    strokeWeight: 2,
  });

  Path.setMap(map);
}