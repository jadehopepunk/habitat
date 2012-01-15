module MediaHelper
  def single_image_grid(image, options = {})
    default_size = '330x230#'
    
    if image
      content_tag(:ul, :class => 'media-grid') do
        content_tag(:li) do
          link_to image.url do
            image_tag image.thumb(options[:size] || default_size).url
          end
        end
      end
    end
  end
end