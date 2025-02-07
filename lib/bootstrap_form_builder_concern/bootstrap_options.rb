module BootstrapFormBuilderConcern
  class BootstrapOptions
    BUTTON_BASE_CLASS = "btn".freeze
    DEFAULT_BUTTON_COLOR = "primary".freeze

    class << self
      def options_with_button_class(options)
        color = prefixed_option(options, key: :color, prefix: BUTTON_BASE_CLASS, default: DEFAULT_BUTTON_COLOR)
        size = prefixed_option(options, key: :size, prefix: BUTTON_BASE_CLASS)
        options_with_base_class(options, BUTTON_BASE_CLASS, color, size)
      end

      def prefixed_option(options, key:, prefix:, default: nil)
        (options.delete(key) || default)&.then { "#{prefix}-#{_1}" }
      end

      def options_with_base_class(options, *base_class)
        options.merge(
          class: (base_class + [options[:class]]).compact.join(" ")
        )
      end
    end
  end
end
