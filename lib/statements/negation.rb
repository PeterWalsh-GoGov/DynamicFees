# frozen_string_literal: true

class Negation

  # @return [#evaluate(*terms)]
  attr_accessor :statement

  def initialize(statement)
    self.statement = statement
  end

  # @param [Array] terms
  #
  # @return [Boolean]
  def evaluate(*terms)
    !self.statement.evaluate(*terms)
  end

  # @return [String] the Negation as a pretty-printed stringified JSON object
  def to_s
    JSON.pretty_generate(self)
  end

  # @return [String] the Negation as a stringified JSON object
  def to_json(config)
    self.to_h.to_json(config)
  end

  # @param [Hash] hash the hash data
  #
  # @return [Negation] the negation generated from the hash data
  def self.from_h(hash)
    statement_data = hash['statement']
    statement = Statement.from_h(statement_data)
    Negation.new(statement)
  end

  # @return [Hash] the negation as a hash
  def to_h
    {
      type: "negation",
      data: {
        statement: self.statement.to_h
      }
    }
  end

end
