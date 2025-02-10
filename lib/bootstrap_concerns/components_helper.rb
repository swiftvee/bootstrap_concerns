module BootstrapConcerns
  module ComponentsHelper
    def bs_button_to(name = nil, options = nil, html_options = nil, &)
      bs_link_or_button_to(:button_to, name, options, html_options, &)
    end

    def bs_link_to(name = nil, options = nil, html_options = nil, &)
      bs_link_or_button_to(:link_to, name, options, html_options, &)
    end

    def bs_link_or_button_to(method_name, name, options, html_options, &)
      normalized_html_options =
        if block_given?
          options ||= {}
        else
          html_options ||= {}
        end

      normalized_html_options.merge!(Option.options_with_button_class(normalized_html_options))

      public_send(
        method_name,
        name,
        options,
        html_options,
        &
      )
    end

    def flash_alert_color(key)
      case key
      when "notice"
        "success"
      when "alert"
        "danger"
      else
        key
      end
    end
  end
end
