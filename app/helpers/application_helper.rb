# Application helper
module ApplicationHelper
  KLASS = 'alert alert-dismissable fade show'.freeze

  def flash_messages(_opts = {})
    flash.each do |msg_type, message|
      render partial: 'shared/flash', locals: { classes: "#{class_for(msg_type)} #{KLASS}",
                                                message: message }
    end
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
