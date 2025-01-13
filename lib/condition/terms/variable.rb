# frozen_string_literal: true

class Variable
  # @return [String] the name of the variable
  attr_accessor :name
  # @return [Integer, String, Array, nil] the value assigned tot eh variable
  attr_accessor :value

  # @param [String] name the name of the variable
  def initialize(name)
    self.name = name
    self.value = nil
  end

  # @return [String] the Variable as a pretty-printed stringified JSON object
  def to_s
    JSON.pretty_generate(self)
  end

  # @return [String] the Variable as a stringified JSON object
  def to_json(config)
    to_h.to_json(config)
  end

  # @param [Hash] hash the hash with the data for the variable
  #
  # @return [Variable] the variable
  def self.from_h(hash)
    name = hash['name']
    raise "Field 'name' not found" if hash.nil?

    Variable.new(name)
  end

  # Converts the Variable to a hash
  # @example
  #
  #   {
  #     type: 'variable',
  #     data: {
  #       name: 'age'
  #     }
  #   }
  #
  # @return [Hash] the Variable as a hash
  def to_h
    {
      type: 'variable',
      data: {
        name: name
      }
    }
  end
end
