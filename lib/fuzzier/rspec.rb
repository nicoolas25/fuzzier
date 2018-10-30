RSpec.configure do |config|
  config.around(:each, :fuzzier) do |example|
    if (seed = example.metadata[:fuzzier]).is_a?(Integer)
      Fuzzier.random = Random.new(seed)
    else
      Fuzzier.reseed!
    end

    result = example.run

    if result.is_a?(Exception)
      result.message << <<~EXTRA
        (Fuzzier seed for this example was: #{Fuzzier.random.seed})\n
      EXTRA
    end

    Fuzzier.reset!
  end
end
