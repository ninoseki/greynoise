# frozen_string_literal: true

RSpec.describe GreyNoise::Clients::Noise, :vcr do
  let(:api) { GreyNoise::API.new }
  let(:ip) { "1.1.1.1" }

  describe "#context" do
    it do
      res = api.noise.context(ip)
      expect(res).to be_a(Hash)
    end
  end

  describe "#quick" do
    it do
      res = api.noise.quick(ip)
      expect(res).to be_a(Hash)
    end
  end

  describe "#multi_quick" do
    it do
      res = api.noise.multi_quick("1.1.1.1", "8.8.8.8")
      expect(res).to be_an(Array)
    end
  end
end
