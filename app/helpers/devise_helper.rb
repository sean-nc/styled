module DeviseHelper
  def devise_error_messages!
    return "" unless devise_error_messages?

    messages = resource.errors.full_messages.map {
      |msg|
      "<div class='uk-alert-danger' uk-alert>
        <a class='uk-alert-close' uk-close></a>
        #{msg}
      </div>"
    }.join

    sentence = I18n.t("errors.messages.not_saved",
                      :count => resource.errors.count,
                      :resource => resource.class.model_name.human.downcase)

    html = <<-HTML
    <div id="error_explanation">
      <ul>
        #{messages}
      </ul>
    </div>
    HTML

    html.html_safe
  end

  def devise_error_messages?
    !resource.errors.empty?
  end

end