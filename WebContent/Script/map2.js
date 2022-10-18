function initMap() {
    const map = new google.maps.Map(document.getElementById("map"), {
        zoom: 8,
        center: { lat: 36.1676050697, lng: 128.0824067374 },
    });
	for(var i = 1; i<=count; i++){
		let loca =[];
		var Placename = document.getElementById('pn'+i).value;
		var Latitude = parseFloat(document.getElementById('Latitude'+i).value);
		var Longtiude = parseFloat(document.getElementById('Longtiude'+i).value);
		loca.push(Placename);
		loca.push(Latitude);
		loca.push(Longtiude);
		locations.push(loca);
		alert(locations);
	}
    for (var i = 0; i < locations.length; i++) {
        var marker = new google.maps.Marker({
            map: map,
            label: locations[i][0],
            position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        });
    }
    
}
const locations = [];
var count= parseInt(document.getElementById('count').value);


