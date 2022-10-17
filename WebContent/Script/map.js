function initMap(){
		var Latitude = parseFloat(document.getElementById('markerLat').value);
		var Longtiude = parseFloat(document.getElementById('markerLon').value);
		// 좌표 설정
		const myLatLng ={
				lat: Latitude,
				lng: Longtiude
		};
			
		//맵 설정 및 생성
		const map=new google.maps.Map(document.getElementById("map"),{
			center: myLatLng,
			zoom: 8
		});
		
	}
	
function markerMap(){
		var Latitude = parseFloat(document.getElementById('markerLat').value);
		var Longtiude = parseFloat(document.getElementById('markerLon').value);
		var placename = document.getElementById('pn').value;
		// 좌표 설정
		const myLatLng ={
				lat: Latitude,
				lng: Longtiude
		};
			
		//맵 설정 및 생성
		const map=new google.maps.Map(document.getElementById("map"),{
			center: myLatLng,
			zoom: 12
		});
			
		// 마커 설정 및 생성
		new google.maps.Marker({
			position: myLatLng,
			map,
			title: placename
		});
	}

function marking1(){
	var Latitude = parseFloat(document.getElementById('Latitude1').value);
	var Longtiude = parseFloat(document.getElementById('Longtiude1').value);
	var Placename = document.getElementById('1').value;
	document.getElementById('markerLat').value = Latitude;
	document.getElementById('markerLon').value = Longtiude;
	document.getElementById('pn').value = Placename;
	markerMap();
}
function marking2(){
	var Latitude = document.getElementById('Latitude2').value;
	var Longtiude = document.getElementById('Longtiude2').value;
	var Placename = document.getElementById('3').value;
	document.getElementById('markerLat').value = Latitude;
	document.getElementById('markerLon').value = Longtiude;
	document.getElementById('pn').value = Placename;
	markerMap();
}
function marking3(){
	var Latitude = document.getElementById('Latitude3').value;
	var Longtiude = document.getElementById('Longtiude3').value;
	var Placename = document.getElementById('5').value;
	document.getElementById('markerLat').value = Latitude;
	document.getElementById('markerLon').value = Longtiude;
	document.getElementById('pn').value = Placename;
	markerMap();
}
function marking4(){
	var Latitude = document.getElementById('Latitude4').value;
	var Longtiude = document.getElementById('Longtiude4').value;
	var Placename = document.getElementById('7').value;
	document.getElementById('markerLat').value = Latitude;
	document.getElementById('markerLon').value = Longtiude;
	document.getElementById('pn').value = Placename;
	markerMap();
}
function marking5(){
	var Latitude = document.getElementById('Latitude5').value;
	var Longtiude = document.getElementById('Longtiude5').value;
	var Placename = document.getElementById('9').value;
	document.getElementById('markerLat').value = Latitude;
	document.getElementById('markerLon').value = Longtiude;
	document.getElementById('pn').value = Placename;
	markerMap();
}
function marking6(){
	var Latitude = document.getElementById('Latitude6').value;
	var Longtiude = document.getElementById('Longtiude6').value;
	var Placename = document.getElementById('11').value;
	document.getElementById('markerLat').value = Latitude;
	document.getElementById('markerLon').value = Longtiude;
	document.getElementById('pn').value = Placename;
	markerMap();
}
function marking7(){
	var Latitude = document.getElementById('Latitude7').value;
	var Longtiude = document.getElementById('Longtiude7').value;
	var Placename = document.getElementById('13').value;
	document.getElementById('markerLat').value = Latitude;
	document.getElementById('markerLon').value = Longtiude;
	document.getElementById('pn').value = Placename;
	markerMap();
}
function marking8(){
	var Latitude = document.getElementById('Latitude8').value;
	var Longtiude = document.getElementById('Longtiude8').value;
	var Placename = document.getElementById('15').value;
	document.getElementById('markerLat').value = Latitude;
	document.getElementById('markerLon').value = Longtiude;
	document.getElementById('pn').value = Placename;
	markerMap();
}
