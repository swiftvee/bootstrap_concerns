module BootstrapConcerns
  module ComponentsHelper
    MARGIN = "mb-3".freeze

    def assign_icon
      icon("box-arrow-in-left", "Assign")
    end

    def boolean_false_icon
      icon("x-circle-fill")
    end

    def boolean_true_icon
      icon("check-circle-fill")
    end

    def bs_button_tag(content_or_options = nil, options = nil, &)
      normalized_options =
        if content_or_options.is_a?(Hash)
          content_or_options
        else
          options ||= {}
        end

      normalized_options.merge!(Option.options_with_button_class(normalized_options))

      button_tag(content_or_options, options, &)
    end

    def bs_button_to(name = nil, options = nil, html_options = nil, &)
      bs_link_or_button_to(:button_to, name, options, html_options, &)
    end

    def bs_errors(record)
      return if record.errors.empty?

      content_tag(:div, class: "alert alert-danger alert-dismissible fade show #{MARGIN}") do
        concat content_tag(:h5, "Errors")
        concat(
          content_tag(:ul, class: "mb-0") do
            record.errors.full_messages.each do |message|
              concat content_tag(:li, message)
            end
          end
        )
        concat content_tag(:button, nil, type: "button", class: "btn-close", data: {bs_dismiss: "alert"})
      end
    end

    def bs_form_with(model: false, **options, &)
      form_with(model: model, **options) do |form|
        concat(bs_errors(model)) if model
        concat(
          content_tag(:div, class: "row") do
            content_tag(:div, class: "col-md-6") do
              yield(form)
            end
          end
        )
      end
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

    def bs_link_to(name = nil, options = nil, html_options = nil, &)
      bs_link_or_button_to(:link_to, name, options, html_options, &)
    end

    def bs_search_col(&)
      content_tag(:div, class: "col-12 col-sm #{MARGIN}", &)
    end

    def bs_search_submit_col
      content_tag(:div, class: "col-auto #{MARGIN}") do
        content_tag(:button, BootstrapConcerns::Option.options_with_button_class) do
          search_icon
        end
      end
    end

    def copy_icon
      icon("files", "Copy")
    end

    def delete_icon(text = "Delete")
      icon("trash", text)
    end

    def download_icon
      icon("download", "Download")
    end

    def edit_icon
      icon("pencil-square", "Edit")
    end

    def export_icon(label = "Export")
      icon("filetype-xlsx", label)
    end

    def flash_alert_color(key)
      case key.to_s
      when "notice"
        "success"
      when "alert"
        "danger"
      else
        key
      end
    end

    def icon(name, text = nil)
      i = content_tag("i", nil, class: "bi bi-#{name}")
      text ? i + content_tag(:span, text, class: "ms-1 d-none d-sm-inline") : i
    end

    def import_icon
      icon("box-arrow-in-down", "Import")
    end

    def new_icon(label = "New")
      icon("file-earmark-plus", label)
    end

    def rename_icon
      icon("input-cursor-text", "Rename")
    end

    def bs_table(&)
      content_tag :div, class: "table-responsive" do
        content_tag(:table, class: "table table-striped table-sm align-middle", &)
      end
    end

    def search_icon
      icon("search", "Search")
    end
  end
end
