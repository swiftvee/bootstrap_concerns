require "bootstrap_form_builder_concern/bootstrap_options"

RSpec.describe BootstrapFormBuilderConcern::BootstrapOptions do
  describe ".options_with_button_class" do
    subject { described_class.options_with_button_class(options) }

    context "without color and size" do
      let(:options) { {class: "ms-1"} }

      it { is_expected.to eq(class: "btn btn-primary ms-1") }
    end

    context "with color" do
      let(:options) { {color: "secondary"} }

      it { is_expected.to eq(class: "btn btn-secondary") }
    end

    context "with size" do
      let(:options) { {class: "me-1", size: "lg"} }

      it { is_expected.to eq(class: "btn btn-primary btn-lg me-1") }
    end
  end

  describe ".prefixed_option" do
    subject { described_class.prefixed_option(options, key:, prefix:, default:) }

    let(:key) { :color }
    let(:prefix) { "btn" }

    context "with option without default" do
      let(:options) { {color: "secondary"} }
      let(:default) { nil }

      it { is_expected.to eq("btn-secondary") }
    end

    context "without option with default" do
      let(:options) { {} }
      let(:default) { "primary" }

      it { is_expected.to eq("btn-primary") }
    end
  end

  describe ".options_with_base_class" do
    subject { described_class.options_with_base_class(options, "form-label") }

    context "without class" do
      let(:options) { {} }

      it { is_expected.to eq(class: "form-label") }
    end

    context "with class" do
      let(:options) { {class: "required"} }

      it { is_expected.to eq(class: "form-label required") }
    end
  end
end
