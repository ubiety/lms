# Application helper
module ApplicationHelper
  KLASS = 'alert alert-dismissable fade show'.freeze

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      concat(content_tag(:div, class: "#{class_for(msg_type)} #{KLASS}",
                               role: 'alert') do
               concat content_tag(:button, icon('close'),
                                  class: 'close',
                                  data: { dismiss: 'alert' })
               concat message
             end)
    end
    nil
  end

  def class_for(flash_type)
    {
      success: 'alert-success',
      error: 'alert-danger',
      alert: 'alert-warning',
      notice: 'alert-info'
    }[flash_type.to_sym] || flash_type.to_s
  end
end
