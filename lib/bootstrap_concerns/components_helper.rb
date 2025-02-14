module BootstrapConcerns
  module ComponentsHelper
    def assign_icon
      icon("box-arrow-in-left", "Assign")
    end

    def boolean_false_icon
      content_tag(:i, "", class: "bi bi-x-circle-fill")
    end

    def boolean_true_icon
      content_tag(:i, "", class: "bi bi-check-circle-fill")
    end

    def bs_button_to(name = nil, options = nil, html_options = nil, &)
      bs_link_or_button_to(:button_to, name, options, html_options, &)
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

    def icon(name, text)
      content_tag("i", "", class: "bi bi-#{name}") + content_tag(:span, text, class: "ms-1 d-none d-sm-inline")
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

    def table(&)
      content_tag :div, class: "table-responsive" do
        content_tag(:table, class: "table table-striped table-sm", &)
      end
    end

    def search_icon
      icon("search", "Search")
    end
  end
end
