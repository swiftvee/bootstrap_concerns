module BootstrapConcerns
  module FormBuilder
    FORM_LABEL_BASE_CLASS = "form-label".freeze
    FORM_CHECK_INPUT_BASE_CLASS = "form-check-input".freeze
    FORM_CONTROL_BASE_CLASS = "form-control".freeze
    FORM_CONTROL_PLAIN_TEXT_BASE_CLASS = "form-control-plaintext".freeze
    FORM_SELECT_BASE_CLASS = "form-select".freeze
    REQUIRED_CLASS = "required".freeze

    def bs_button(value = nil, options = {}, &)
      normalized_options = value.is_a?(Hash) ? value : options
      normalized_options.merge!(Option.options_with_button_class(normalized_options))

      button(value, options, &)
    end

    def bs_check_box(method, options = {}, checked_value = "1", unchecked_value = "0")
      check_box(method, options_with_form_check_input_class(options), checked_value, unchecked_value)
    end

    def bs_check_label(method, text = nil, options = {}, &)
      normalized_options = text.is_a?(Hash) ? text : options
      normalized_options.merge!(options_with_form_label_class(normalized_options))

      label(method, text, options, &)
    end

    def bs_color_field(method, options = {})
      color_field(method, options_with_form_control_class(options))
    end

    def bs_collection_select(method, collection, value_method, text_method, options = {}, html_options = {})
      collection_select(
        method,
        collection,
        value_method,
        text_method,
        options,
        options_with_form_select_class(options, html_options)
      )
    end

    def bs_date_field(method, options = {})
      date_field(method, options_with_form_control_class(options))
    end

    def bs_datetime_field(method, options = {})
      datetime_field(method, options_with_form_control_class(options))
    end

    def bs_email_field(method, options = {})
      email_field(method, options_with_form_control_class(options))
    end

    def bs_form_group(method, type, *args)
      options = args.find { it.is_a?(Hash) && it.has_key?(:required) }.to_h

      @template.content_tag(:div, class: ComponentsHelper::MARGIN) do
        @template.concat bs_label(method, options.slice(:required))
        @template.concat public_send("bs_#{type}", method, *args)
      end
    end

    def bs_grouped_collection_select(
      method,
      collection,
      group_method,
      group_label_method,
      option_key_method,
      option_value_method,
      options = {},
      html_options = {}
    )
      grouped_collection_select(
        method,
        collection,
        group_method,
        group_label_method,
        option_key_method,
        option_value_method,
        options,
        options_with_form_select_class(options, html_options)
      )
    end

    def bs_label(method, text = nil, options = {}, &)
      normalized_options = text.is_a?(Hash) ? text : options
      normalized_options.merge!(options_with_form_label_class(normalized_options))

      label(method, text, options, &)
    end

    def bs_file_field(method, options = {})
      file_field(
        method,
        {
          class: FORM_CONTROL_BASE_CLASS,
          direct_upload: true,
          data: {
            controller: "direct-upload-field",
            action: <<~ACTION.squish
              direct-upload:initialize->direct-upload-field#setup
              direct-upload:progress->direct-upload-field#progress
              direct-upload:error->direct-upload-field#error
              direct-upload:end->direct-upload-field#end
            ACTION
          }
        }.merge(options)
      )
    end

    def bs_number_field(method, options = {})
      number_field(method, options_with_form_control_class(options))
    end

    def bs_password_field(method, options = {})
      password_field(method, options_with_form_control_class(options))
    end

    def bs_radio_button(method, tag_value, options = {})
      radio_button(method, tag_value, options_with_form_check_input_class(options))
    end

    def bs_search_field(method, options = {})
      search_field(method, options_with_form_control_class(options))
    end

    def bs_save_submit(options = {})
      bs_submit("Save", options)
    end

    def bs_select(method, choices = nil, options = {}, html_options = {}, &)
      select(method, choices, options, options_with_form_select_class(options, html_options), &)
    end

    def bs_submit(value = nil, options = {})
      normalized_options = value.is_a?(Hash) ? value : options
      normalized_options.merge!(Option.options_with_button_class(normalized_options))

      submit(value, options)
    end

    def bs_phone_field(method, options = {})
      phone_field(method, options_with_form_control_class(options))
    end

    def bs_plain_text_field(method, options = {})
      text_field(
        method,
        Option.options_with_base_class(options, FORM_CONTROL_PLAIN_TEXT_BASE_CLASS).merge(readonly: true)
      )
    end

    def bs_text_field(method, options = {})
      text_field(method, options_with_form_control_class(options))
    end

    def bs_text_area(method, options = {})
      text_area(method, options_with_form_control_class(options))
    end

    def bs_url_field(method, options = {})
      url_field(method, options_with_form_control_class(options))
    end

    private

    def options_with_form_check_input_class(options)
      Option.options_with_base_class(options, FORM_CHECK_INPUT_BASE_CLASS)
    end

    def options_with_form_control_class(options)
      size = Option.prefixed_option(options, key: :size, prefix: FORM_CONTROL_BASE_CLASS)
      Option.options_with_base_class(options, FORM_CONTROL_BASE_CLASS, size)
    end

    def options_with_form_select_class(options, html_options)
      size = Option.prefixed_option(options, key: :size, prefix: FORM_SELECT_BASE_CLASS)
      Option.options_with_base_class(html_options, FORM_SELECT_BASE_CLASS, size)
    end

    def options_with_form_label_class(options)
      required = REQUIRED_CLASS if options.delete(:required)
      Option.options_with_base_class(options, FORM_LABEL_BASE_CLASS, required)
    end
  end
end
