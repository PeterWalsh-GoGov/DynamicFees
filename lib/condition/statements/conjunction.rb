# frozen_string_literal: true

require 'json'

class Conjunction
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
    statement1.evaluate(terms) && statement2.evaluate(terms)
  end

  # @return [String]
  def to_s
    JSON.pretty_generate(self)
  end

  # @return [String]
  def to_json(config)
    to_h.to_json(config)
  end

  def self.from_h(hash)
    left_operand_data = hash['left_operand']
    left_operand = Statement.from_h(left_operand_data)

    right_operand_data = hash['right_operand']
    right_operand = Statement.from_h(right_operand_data)

    Conjunction.new(left_operand, right_operand)
  end

  # @return [Hash]
  def to_h
    {
      type: 'conjunction',
      data: {
        statement1: statement1.to_h,
        statement2: statement2.to_h
      }
    }
  end
end
