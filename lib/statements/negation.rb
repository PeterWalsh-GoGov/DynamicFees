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

  def to_s
    JSON.pretty_generate(self)
  end

  def to_json(config)
    self.to_h.to_json(config)
  end

  def to_h
    {
      type: "negation",
      data: {
        statement: self.statement.to_h
      }
    }
  end

end
