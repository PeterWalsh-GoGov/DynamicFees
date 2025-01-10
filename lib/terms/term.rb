# frozen_string_literal: true

module Term

  # @param [Hash] hash the term data
  #
  # @return [Variable, Constant] the term parsed from the hash
  def self.from_h(hash)
    type = hash['type']
    data = hash['data']

    return Constant.from_h(data) if type == 'constant'
    return Variable.from_h(data) if type == 'variable'

    raise "Invalid type '#{type}' for term"
  end
end
