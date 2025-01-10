# frozen_string_literal: true
require 'json'

class Disjunction
  # @return [#evaluate(terms)]
  attr_accessor :statement1
  # @return [#evaluate(terms)]
  attr_accessor :statement2

  # @param [#evaluate(terms)] statement1
  # @param [#evaluate(terms)] statement2
  def initialize(statement1, statement2)
    self.statement1 = statement1
    self.statement2 = statement2
  end

  # @return [Boolean]
  def evaluate(*terms)
    self.statement1.evaluate(*terms) || self.statement2.evaluate(*terms)
  end

  # @return [String]
  def to_s
    JSON.pretty_generate(self)
  end

  # @return [String]
  def to_json(config = nil)
    self.to_h.to_json(config)
  end

  # @param [Hash] hash the disjunction data hash
  #
  # @return [Disjunction] the disjunction created from the hash
  def self.from_h(hash)
    left_operand_data = hash['left_operand']
    left_operand = Statement.from_h(left_operand_data)

    right_operand_data = hash['right_operand']
    right_operand = Statement.from_h(right_operand_data)

    Disjunction.new(left_operand, right_operand)
  end

  # @return [Hash]
  def to_h
    {
      type: "disjunction",
      data: {
        left_operand: self.statement1.to_h,
        right_operand: self.statement2.to_h
      }
    }
  end

end
