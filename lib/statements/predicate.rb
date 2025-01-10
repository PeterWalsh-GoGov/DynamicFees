# frozen_string_literal: true

class Predicate

  # @return [String]
  attr_accessor :operator
  # @return [Variable, Constant] the first term of the predicate
  attr_accessor :term1
  # @return [Variable, Constant] the second term of the predicate
  attr_accessor :term2

  # @param [String] operator
  # @param [Variable, Constant] term1
  # @param [Variable, Constant] term2
  def initialize(operator, term1, term2)
    self.operator = operator
    self.term1 = term1
    self.term2 = term2
  end

  # @param [Array<VariableAssignment>] terms
  #
  # @return [Boolean]
  def evaluate(*terms)
    term1_assignment = terms.find { |variable| variable.name == term1.name }
    term1.value = term1_assignment.value if term1_assignment != nil

    term2_assignment = terms.find { |variable| variable.name == term2.name }
    term2.value = term2_assignment.value if term2_assignment != nil

    term1_value = term1.value
    term2_value = term2.value

    return Operator.less_than(term1_value, term2_value) if operator == Operator::LESS_THAN
    return Operator.less_than_or_equal(term1_value, term2_value) if operator == Operator::LESS_THAN_OR_EQUAL
    return Operator.greater_than(term1_value, term2_value) if operator == Operator::GREATER_THAN
    return Operator.greater_than_or_equal(term1_value, term2_value) if operator == Operator::GREATER_THAN_OR_EQUAL
    return Operator.contains(term1_value, term2_value) if operator == Operator::CONTAINS
    false
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
      type: "predicate",
      data: {
        operator: self.operator,
        first_term: self.term1.to_h,
        second_term: self.term2.to_h
      }
    }
  end


  module Operator
    LESS_THAN =
    LESS_THAN_OR_EQUAL = "LESS_THAN_OR_EQUAL"
    GREATER_THAN = "GREATER_THAN"
    GREATER_THAN_OR_EQUAL = "GREATER_THAN_OR_EQUAL"
    EQUAL = "EQUAL"
    CONTAINS = "CONTAINS"

    def self.less_than(value1, value2)
      value1 < value2
    end

    def self.less_than_or_equal(value1, value2)
      value1 <= value2
    end

    def self.greater_than(value1, value2)
      value1 > value2
    end

    def self.greater_than_or_equal(value1, value2)
      value1 >= value2
    end

    def self.contains(value1, value2)
      value1.include?(value2)
    end

  end

end




