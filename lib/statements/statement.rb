# frozen_string_literal: true


module Statement

  module Types
    PREDICATE = 'predicate'

  end

  def self.from_h(data)
    type = data['type']
    data = data['data']

    return Predicate.from_h(data) if type == 'predicate'
    retun

    raise "Invalid statement type '#{type}'"
  end

end
