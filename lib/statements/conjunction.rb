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
    self.statement1.evaluate(terms) && self.statement2.evaluate(terms)
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
      type: "conjunction",
      data: {
        statement1: self.statement1.to_h,
        statement2: self.statement2.to_h
      }
    }
  end

end
