---
title: "google map api"
date: 2013-11-19
tags: google, map, api
---


[Open source js lib for mobile friendly interactive map)[http://leafletjs.com/)
[google places gem](https://github.com/marceldegraaf/google_places)
[google places api](https://developers.google.com/places/documentation/?hl=ja#Authentication)
[google geocoding api](https://developers.google.com/maps/documentation/geocoding/?hl=ja)
[place auth complete](https://developers.google.com/places/documentation/autocomplete?hl=ja)


## Geocoding


<https://developers.google.com/maps/documentation/geocoding/?hl=ja>

ジオコーディングとは住所を地理座標（緯度(いど) 37.423021、経度(けいど) -122.083739 など）に変換する処理のことをいいます。


緯度,lat(latitude)

経度,lng(longitude)

### retty 店舗登録ページrequest

`http://maps.googleapis.com/maps/api/js/GeocodeService.Search?4s1800021&7sJP&9sja&callback=_xdc_._ojq4bl&token=49285`


### geocoding requets(from google)

`http://maps.googleapis.com/maps/api/geocode/output?parameters`

output : [json, xml]

`http://maps.googleapis.com/maps/api/geocode/json?parameters`
`http://maps.googleapis.com/maps/api/geocode/xml?parameters`

*request example(maps api for business)*

`http://maps.googleapis.com/maps/api/geocode/json?address=1600+Amphitheatre+Parkway,+Mountain+View,+CA&sensor=true_or_false&client=gme-YOUR_CLIENT_ID&signature=YOUR_URL_SIGNATURE`

## google place自動完成



### sameple code

``` js
<script type="text/javascript" src="http://maps.googleapis.com/maps/api/js?libraries=places&sensor=false&language=jp"></script>
```


``` js
<input id="searchTextField" type="text" name="city" />

<script type="text/javascript">
function initialize() {
    var input = document.getElementById( 'searchTextField');
    var options = {
        types: ['(cities)'],
    };
    autocomplete = new google.maps.places.Autocomplete( input, options);
}
google.maps.event.addDomListener( window, 'load', initialize);
</script>
```


### Google Maps JavaScript API v3


*ジオコーディング サービス*

ジオコーディングとは、住所（「1600 Amphitheatre Parkway, Mountain View, CA」など）を地理座標（緯度 37.423021、経度 -122.083739 など）に変換する処理のことをいいます

####

https://developers.google.com/maps/documentation/javascript/reference?hl=ja#PlaceSearchRequest