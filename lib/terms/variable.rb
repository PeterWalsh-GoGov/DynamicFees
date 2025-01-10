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

  # @param [Hash] the hash with the data for the variable
  #
  # @return [Variable] the variable
  def self.from_h(hash)
    name = hash['name']
    raise "Field 'name' not found" if hash == nil
    Variable.new(name)
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
