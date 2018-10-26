# frozen_string_literal: true

RSpec.describe Fuzzier do
  before { Fuzzier.reset! }

  describe '.random' do
    subject(:fuzzier_random) { Fuzzier.random }

    context 'by default' do
      it 'returns the default random generator' do
        expect(fuzzier_random).to be Random::DEFAULT
      end
    end

    context 'when the random generator has been set manually' do
      let(:new_random) { Random.new(123) }

      it 'returns the state that has been set' do
        Fuzzier.random = new_random

        expect(fuzzier_random).to be new_random
      end
    end
  end

  describe '.reseed!' do
    subject(:fuzzier_reseed) { Fuzzier.reseed! }

    it 'updates the random generator' do
      expect { fuzzier_reseed }.to change { Fuzzier.random }
    end
  end

  describe '.sample' do
    subject(:sample) { Fuzzier.sample([1, 2, 3]) }

    it 'returns any element of the array using Fuzzier.random' do
      Fuzzier.random = Random.new(5)

      expect(sample).to eq 3
    end
  end

  describe '.shuffle' do
    subject(:shuffle) { Fuzzier.shuffle([1, 2, 3]) }

    it 'suffles the given array using Fuzzier.random' do
      Fuzzier.random = Random.new(453)

      expect(shuffle).to eq [2, 1, 3]
    end
  end

  describe '.rand' do
    before do
      Fuzzier.random = Random.new(4324)
    end

    subject(:rand) { Fuzzier.rand }

    it 'uses the Fuzzier.random to get a random number' do
      expect(rand).to eq 0.29839415613579345
    end

    context 'when given a range' do
      subject(:rand) { Fuzzier.rand(15..20) }

      it 'uses the Fuzzier.random to get a random number' do
        expect(rand).to eq 17
      end
    end

    context 'when given a max integer' do
      subject(:rand) { Fuzzier.rand(20) }

      it 'uses the Fuzzier.random to get a random number' do
        expect(rand).to eq 4
      end
    end
  end
end
