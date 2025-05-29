require "action_view"
require "bootstrap_concerns/components_helper"
require "bootstrap_concerns/option"

RSpec.describe BootstrapConcerns::ComponentsHelper do
  let(:helper) do
    Class
      .new do
        include BootstrapConcerns::ComponentsHelper
        include ActionView::Helpers::UrlHelper
      end
      .new
  end

  describe "#bs_link_to" do
    before do
      allow(helper).to receive(:link_to)

      helper.bs_link_to(name, options, html_options, &block)
    end

    context "with block" do
      let(:name) { "#" }
      let(:html_options) { nil }
      let(:block) { proc { "Click me" } }

      context "with options" do
        let(:options) { {size: "sm"} }

        it "calls link_to with the Bootstrap options" do
          expect(helper).to have_received(:link_to).with(name, {class: "btn btn-primary btn-sm"}, nil)
        end
      end

      context "without options" do
        let(:options) { nil }

        it "calls link_to with the Bootstrap options" do
          expect(helper).to have_received(:link_to).with(name, {class: "btn btn-primary"}, nil)
        end
      end
    end

    context "without block" do
      let(:name) { "Click me" }
      let(:options) { "#" }
      let(:block) { nil }

      context "with html_options" do
        let(:html_options) { {size: "sm"} }

        it "calls link_to with the Bootstrap html_options" do
          expect(helper).to have_received(:link_to).with(name, options, {class: "btn btn-primary btn-sm"})
        end
      end

      context "without html_options" do
        let(:html_options) { nil }

        it "calls link_to with the Bootstrap html_options" do
          expect(helper).to have_received(:link_to).with(name, options, {class: "btn btn-primary"})
        end
      end
    end
  end

  describe "#flash_alert_color" do
    subject(:flash_alert_color) { helper.flash_alert_color(key) }

    context "with notice key" do
      let(:key) { "notice" }

      it { is_expected.to eq "success" }
    end

    context "with alert key" do
      let(:key) { "alert" }

      it { is_expected.to eq "danger" }
    end

    context "with info key" do
      let(:key) { "info" }

      it { is_expected.to eq "info" }
    end
  end
end
