module MapHelper
  def project_map(project)
    json = project.to_gmaps4rails    
    gmaps(
      'map_options' => {
        'type' => 'SATELLITE',
        'center_longitude' => project.lng,
        'center_latitude' => project.lat,
        'zoom' => 9,
        'auto_adjust' => false
      },
      'markers' => {'data' => json}
    )
  end
end