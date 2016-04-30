module FlashNotificationHelper
  def flash_notification
    flash_messages = []
    flash.each do |type, message|
      text = if alert
        content_tag(:div, content_tag(:button, raw("&times;"), class: 'close', data: { dismiss: 'alert' })+ raw(message), class: "alert alert-#{type} fade in")
      else
        content_tag(:span, raw(message), class: "text-#{type}")
      end

      flash_messages << text if message
    end
    raw(flash_messages.join("\n"))
  end
end
