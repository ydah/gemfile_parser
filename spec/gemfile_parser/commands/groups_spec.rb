# frozen_string_literal: true

RSpec.describe GemfileParser::Commands::Groups do
  describe ".call" do
    subject do
      described_class.call(
        gem_name: gem_name,
        gemfile_path: "spec/fixtures/dummy_gemfile",
        ignore: ignore,
        delimiter: delimiter
      )
    end

    let(:ignore) { false }
    let(:delimiter) { " " }

    before do
      allow(Kernel).to receive(:abort)
      allow(Kernel).to receive(:puts)
    end

    context "when `gem_name: with_group`" do
      let(:gem_name) { "with_group" }

      xit "puts expected group name" do
        subject
        expect(Kernel).to have_received(:puts).with(
          "development"
        )
      end
    end

    context "when `gem_name: with_some_group`" do
      let(:gem_name) { "with_some_group" }

      xit "puts expected group name" do
        subject
        expect(Kernel).to have_received(:puts).with(
          "development test"
        )
      end
    end

    context "when `gem_name: foo_block`" do
      let(:gem_name) { "foo_block" }

      it "puts expected group name" do
        subject
        expect(Kernel).to have_received(:puts).with(
          "block"
        )
      end
    end

    context "when `gem_name: foo_multiple_block`" do
      let(:gem_name) { "foo_multiple_block" }

      it "puts expected group name" do
        subject
        expect(Kernel).to have_received(:puts).with(
          "development test"
        )
      end
    end

    context "when `delimiter: :`" do
      let(:gem_name) { "foo_multiple_block" }
      let(:delimiter) { ":" }

      it "puts expected group name with delimiter" do
        subject
        expect(Kernel).to have_received(:puts).with(
          "development:test"
        )
      end
    end

    context "when `ignore: true`" do
      let(:gem_name) { "foo_block" }
      let(:ignore) { true }

      it "puts expected group name with delimiter" do
        subject
        expect(Kernel).to have_received(:puts).with(
          "default development test"
        )
      end
    end
  end
end
