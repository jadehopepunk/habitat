module MapHelper
  def site_map(site)
    json = site.to_gmaps4rails    
    gmaps(
      'map_options' => {
        'type' => 'SATELLITE',
        'center_longitude' => site.lng,
        'center_latitude' => site.lat,
        'zoom' => 9,
        'auto_adjust' => false
      },
      'markers' => {'data' => json}
    )
  end
end