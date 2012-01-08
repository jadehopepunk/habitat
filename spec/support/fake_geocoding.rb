module FakeGeocoding
  def self.new_york
    result = <<EOF
    {
       "results" : [
          {
             "address_components" : [
                {
                   "long_name" : "New York",
                   "short_name" : "New York",
                   "types" : [ "locality", "political" ]
                },
                {
                   "long_name" : "New York",
                   "short_name" : "New York",
                   "types" : [ "administrative_area_level_2", "political" ]
                },
                {
                   "long_name" : "New York",
                   "short_name" : "NY",
                   "types" : [ "administrative_area_level_1", "political" ]
                },
                {
                   "long_name" : "United States",
                   "short_name" : "US",
                   "types" : [ "country", "political" ]
                }
             ],
             "formatted_address" : "New York, NY, USA",
             "geometry" : {
                "bounds" : {
                   "northeast" : {
                      "lat" : 40.9175770,
                      "lng" : -73.7002720
                   },
                   "southwest" : {
                      "lat" : 40.4959080,
                      "lng" : -74.25908790
                   }
                },
                "location" : {
                   "lat" : 40.71435280,
                   "lng" : -74.00597309999999
                },
                "location_type" : "APPROXIMATE",
                "viewport" : {
                   "northeast" : {
                      "lat" : 40.84953420,
                      "lng" : -73.74985430
                   },
                   "southwest" : {
                      "lat" : 40.57889640,
                      "lng" : -74.26209190
                   }
                }
             },
             "types" : [ "locality", "political" ]
          },
          {
             "address_components" : [
                {
                   "long_name" : "Manhattan",
                   "short_name" : "Manhattan",
                   "types" : [ "sublocality", "political" ]
                },
                {
                   "long_name" : "New York",
                   "short_name" : "New York",
                   "types" : [ "locality", "political" ]
                },
                {
                   "long_name" : "New York",
                   "short_name" : "New York",
                   "types" : [ "administrative_area_level_2", "political" ]
                },
                {
                   "long_name" : "New York",
                   "short_name" : "NY",
                   "types" : [ "administrative_area_level_1", "political" ]
                },
                {
                   "long_name" : "United States",
                   "short_name" : "US",
                   "types" : [ "country", "political" ]
                }
             ],
             "formatted_address" : "Manhattan, New York, NY, USA",
             "geometry" : {
                "bounds" : {
                   "northeast" : {
                      "lat" : 40.8822140,
                      "lng" : -73.9070
                   },
                   "southwest" : {
                      "lat" : 40.67954790,
                      "lng" : -74.0472850
                   }
                },
                "location" : {
                   "lat" : 40.78343450,
                   "lng" : -73.96624950
                },
                "location_type" : "APPROXIMATE",
                "viewport" : {
                   "northeast" : {
                      "lat" : 40.8200450,
                      "lng" : -73.90331300000001
                   },
                   "southwest" : {
                      "lat" : 40.6980780,
                      "lng" : -74.03514899999999
                   }
                }
             },
             "types" : [ "sublocality", "political" ]
          }
       ],
       "status" : "OK"
    }
EOF
  end
end