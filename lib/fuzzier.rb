# frozen_string_literal: true

require 'fuzzier/version'

module Fuzzier
  def self.reset!
    remove_instance_variable(:@random) if defined?(@random)
  end

  def self.random
    defined?(@random) && @random || Random::DEFAULT
  end

  def self.random=(random)
    @random = random
  end

  def self.reseed!
    @random = Random.new Random::DEFAULT.rand(10_000)
  end

  def self.sample(array)
    array.sample(random: @random)
  end

  def self.shuffle(array)
    array.shuffle(random: @random)
  end

  def self.rand(max = nil)
    if max.nil?
      @random.rand
    else
      @random.rand(max)
    end
  end
end
