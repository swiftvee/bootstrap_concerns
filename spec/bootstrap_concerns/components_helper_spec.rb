require "bootstrap_concerns/components_helper"

RSpec.describe BootstrapConcerns::ComponentsHelper do
  describe "#flash_alert_color" do
    subject(:flash_alert_color) { helper_class.new.flash_alert_color(key) }

    let(:helper_class) do
      Class.new { include BootstrapConcerns::ComponentsHelper }
    end

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
