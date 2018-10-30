RSpec.describe "Fuzzier::RSpec integration" do
  context "when a spec has the fuzzier: true metadata", fuzzier: 1234 do
    before do
      @value = Fuzzier.sample([1, 2, 3])
    end

    it "uses the seed specified in the example metadata" do
      expect(@value).to eq 3 # This should consistently succeed!
    end
  end
end
