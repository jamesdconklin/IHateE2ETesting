module ApplicationHelper

  def csrf_token
    html = <<-HTML
      <input type="hidden"
            name="authenticity_token"
            value="#{form_authenticity_token}">
    HTML
    return html.html_safe
  end

  def render_errors
    return '' if flash[:errors].empty?
    html = flash[:errors].join('</li><li>')
    "<ul><li>#{html}</li></ul>".html_safe
  end
end
