{
    "type": "FeatureCollection",
    "features": [
        .[] | select(.latitude + .longitude | contains("-") | not) | {
            "type": "Feature",
            "geometry": {
                "type": "Point",
                "coordinates": [
                    (.longitude | tonumber),
                    (.latitude | tonumber)
                ]
            },
            "properties": {
                "youtube_id": (.video_id | gsub("^\\s+|\\s+$"; "")),
                "name": (.stores_name | gsub("^\\s+|\\s+$"; "")),
                "address": (.stores_address | gsub("^\\s+|\\s+$"; "")),
                "youtube_url": (.youtube_url | gsub("^\\s+|\\s+$"; "")),
                "googlemap_url": ("https://www.google.com/maps/search/?api=1&query=" + .latitude + "%2C" + .longitude),
                "latitude": (.latitude | tonumber),
                "longitude": (.longitude | tonumber)
            }
        }
    ]
}
