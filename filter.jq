{
    "type": "FeatureCollection",
    "features": [
        .[] | {
            "type": "Feature",
            "geometry": {
                "type": "Point",
                "coordinates": [(.longitude | tonumber), (.latitude | tonumber)]
            },
            "properties": {
                "youtube_id": .video_id,
                "name": .stores_name,
                "address": .stores_address,
                "youtube_url": .youtube_url,
                "googlemap_url": ("https://www.google.com/maps/search/?api=1&query=" + .latitude + "%2C" + .longitude),
                "latitude": .latitude,
                "longitude": .longitude
            }
        }
    ]
}
