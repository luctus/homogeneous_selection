require "homogeneous_selection/version"

class HomogeneousSelection
  DEFAULTS = {
    unique_selection: true, # Avoid selecting 2 or more with same unique_key
    unique_key: :token # Deafult hash key used for uniqueness
  }

  attr_accessor :options, :source

  def initialize(source, options = {})
    @source = source
    @options = DEFAULTS.merge(options)
    raise StandardError, 'Invalid source' unless is_valid_source
  end

  def get(selection_amount = 4)

  end

private

  def is_valid_source
    return false unless source.is_a?(Hash)
    source.all? do |key, value|
      value_is_an_array = value.is_a?(Array)
      array_elements_are_hashes = value.all? do |element|
        # Each element must be a hash with given unique key
        element.is_a?(Hash) && !element[options[:unique_key]].nil?
      end

      value_is_an_array && array_elements_are_hashes
    end
  end
end
