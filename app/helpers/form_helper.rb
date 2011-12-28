module FormHelper
  def form_errors(f)
    if f.error_notification
      content_tag(:div, :class => 'alert-message warning fade in', :'data-alert' => 'alert') do
        link_to(' x ', '#', :class => 'close') +
        content_tag(:p, f.error_notification)
      end
    end
  end
end