# frozen_string_literal: true

RSpec.describe GreyNoise::Clients::Experimental, :vcr do
  let(:api) { GreyNoise::API.new }
  let(:query) { 'tags:"3Com OfficeConnect RCE"' }

  describe "#gnql" do
    it do
      res = api.experimental.gnql(query)
      expect(res).to be_a(Hash)
    end
  end

  describe "#gnql_stats" do
    it do
      res = api.experimental.gnql_stats(query)
      expect(res).to be_a(Hash)
    end
  end
end
