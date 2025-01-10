# frozen_string_literal: true

class VariableAssignment

  attr_accessor :name
  attr_accessor :value

  def initialize(name, value)
    self.name = name
    self.value = value
  end

end
