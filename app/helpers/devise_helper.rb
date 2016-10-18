module DeviseHelper
  def devise_error_messages!
    return '' if resource.errors.empty?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join
    html = <<-HTML
    <div class="alert alert-success">
       <button type="button" aria-hidden="true" class="close">×</button>
       <span><b> #{messages}</span>
   </div>

    HTML

    html.html_safe
  end

  def flash_class_name(name)
    case name
    when 'notice' then 'info'
    when 'alert'  then 'danger'
    else name
    end
end
end
