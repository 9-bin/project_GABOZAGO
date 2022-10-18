function initMap() {
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 8,
        center: { lat: 36.1676050697, lng: 128.0824067374 },
    });

    for (var i = 0; i < locations.length; i++) {
        var marker = new google.maps.Marker({
            map: map,
            label: locations[i].place,
            position: new google.maps.LatLng(locations[i].lat, locations[i].lng),
        });
    }
}
	var Latitude1 = parseFloat(document.getElementById('Latitude1').value);
	var Longtiude1 = parseFloat(document.getElementById('Longtiude1').value);
	var Placename1 = document.getElementById('1').value;
	
	var Latitude2 = parseFloat(document.getElementById('Latitude2').value);
	var Longtiude2 = parseFloat(document.getElementById('Longtiude2').value);
	var Placename2 = document.getElementById('3').value;
	
	var Latitude3 = parseFloat(document.getElementById('Latitude3').value);
	var Longtiude3 = parseFloat(document.getElementById('Longtiude3').value);
	var Placename3 = document.getElementById('5').value;
	
	var Latitude4 = parseFloat(document.getElementById('Latitude4').value);
	var Longtiude4 = parseFloat(document.getElementById('Longtiude4').value);
	var Placename4 = document.getElementById('7').value;
	
	
	var Latitude5 = parseFloat(document.getElementById('Latitude5').value);
	var Longtiude5 = parseFloat(document.getElementById('Longtiude5').value);
	var Placename5 = document.getElementById('9').value;
	
	var Latitude6 = parseFloat(document.getElementById('Latitude6').value);
	var Longtiude6 = parseFloat(document.getElementById('Longtiude6').value);
	var Placename6 = document.getElementById('11').value;
	
	var Latitude7 = parseFloat(document.getElementById('Latitude7').value);
	var Longtiude7 = parseFloat(document.getElementById('Longtiude7').value);
	var Placename7 = document.getElementById('13').value;
	
	var Latitude8 = parseFloat(document.getElementById('Latitude8').value);
	var Longtiude8 = parseFloat(document.getElementById('Longtiude8').value);
	var Placename8 = document.getElementById('15').value;
	
	var Latitude9 = parseFloat(document.getElementById('Latitude9').value);
	var Longtiude9 = parseFloat(document.getElementById('Longtiude9').value);
	var Placename9 = document.getElementById('17').value;
	
const locations = [
    { place:Placename1, lat:Latitude1 , lng:Longtiude1  },
    { place:Placename2, lat:Latitude2 , lng:Longtiude2  },
    { place:Placename3, lat:Latitude3 , lng:Longtiude3  },
    { place:Placename4, lat:Latitude4 , lng:Longtiude4  },
    { place:Placename5, lat:Latitude5 , lng:Longtiude5  },
    { place:Placename6, lat:Latitude6 , lng:Longtiude6  },
    { place:Placename7, lat:Latitude7 , lng:Longtiude7  },
    { place:Placename8, lat:Latitude8 , lng:Longtiude8  },
    { place:Placename9, lat:Latitude9 , lng:Longtiude9  },
];
