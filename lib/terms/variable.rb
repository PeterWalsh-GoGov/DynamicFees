# frozen_string_literal: true

class Variable

  # @return [String] name
  attr_accessor :name
  # @return [Integer, String, Array, nil]
  attr_accessor :value

  # @param [String] name the name of the variable
  def initialize(name)
    self.name = name
    self.value = nil
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
      type: "variable",
      data: {
        name: self.name,
      }
    }
  end

end
