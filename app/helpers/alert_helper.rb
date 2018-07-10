module AlertHelper
  def build_alert_classes(alert_type)
    classes = ''
    case alert_type.to_sym
    when :alert, :danger, :error, :validation_errors
        classes += 'danger'
    when :warning, :todo
        classes += 'warning'
    when :notice, :success
        classes += 'success'
    else
        classes += 'primary'
    end
  end
end