# frozen_string_literal: true

RSpec.describe GreyNoise::API do
  describe "#initialize" do
    context "when loading key from config" do
      before do
        allow(ENV).to receive(:[]).with("GREYNOISE_API_KEY").and_return(nil)

        path = File.expand_path("~/.config/greynoise/config")
        allow(File).to receive(:exist?).with(path).and_return(true)
        allow(File).to receive(:read).with(path).and_return('{"api_key":"foo"}')
      end

      it do
        api = described_class.new
        expect(api.key).to eq("foo")
      end
    end

    context "when loading key from env" do
      before do
        allow(ENV).to receive(:[]).with("GREYNOISE_API_KEY").and_return("bar")
      end

      it do
        api = described_class.new
        expect(api.key).to eq("bar")
      end
    end
  end
end
