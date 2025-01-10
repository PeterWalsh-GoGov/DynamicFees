# frozen_string_literal: true
require 'json'

class Constant

  # @return [Integer, String, Array, Time, nil]
  attr_accessor :value

  # @param [Integer, String, Array, Time, nil] value
  def initialize(value)
    self.value = value
  end

  # @return [nil] constants don't have a name
  def name
    nil
  end

  # @return [String]
  def to_s
    JSON.pretty_generate(self)
  end

  # @return [String]
  def to_json(config)
    self.to_h.to_json(config)
  end

  # @return [Hash]
  def to_h
    {
      type: "constant",
      data: {
        value: self.value
      }
    }
  end

end
