module MapHelper
  def project_map(project)
    gmaps(
      'map_options' => {
        'type' => 'SATELLITE',
        'center_longitude' => project.longitude,
        'center_latitude' => project.latitude,
        'zoom' => 9,
        'auto_adjust' => false
      },
      'markers' => {'data' => {:lng => project.longitude, :lat => project.latitude}.to_json}
    )
  end
end