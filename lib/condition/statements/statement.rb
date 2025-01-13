# frozen_string_literal: true

require_relative './edicate'
require_relative './conjunction'
require_relative './disjunction'

module Statement
  module Types
    PREDICATE = 'predicate'
  end

  def self.from_h(data)
    type = data['type']
    data = data['data']

    return Predicate.from_h(data) if type == 'predicate'
    return Conjunction.from_h(data) if type == 'conjunction'
    return Disjunction.from_h(data) if type == 'disjunction'

    raise "Invalid statement type '#{type}'"
  end
end
