# frozen_string_literal: true

RSpec.describe GreyNoise::Clients::Meta, :vcr do
  let(:api) { GreyNoise::API.new }

  describe "#metadata" do
    it do
      res = api.meta.metadata
      expect(res).to be_a(Hash)
    end
  end
end
