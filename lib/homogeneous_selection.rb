require "homogeneous_selection/version"
require 'deep_clone'
require 'set'

class HomogeneousSelection
  DEFAULTS = {
    unique_key: :token # Deafult hash key used for uniqueness
  }

  attr_accessor :options, :source

  def initialize(source, options = {})
    @source = source
    @options = DEFAULTS.merge(options)
    raise StandardError, 'Invalid source' unless is_valid_source
  end

  def get(selection_amount = 4)
    source_copy = DeepClone.clone source

    # Sets a second stop criteria when given a source smaller than selection amount
    source_item_amount = source_copy.values.flatten.uniq.length
    selection = Set.new []

    while selection.length < selection_amount && selection.length < source_item_amount
      source_copy.each do |key, element_array|
        break unless selection.length < selection_amount
        next if element_array.empty?

        selection_item = source_copy[key].shift
        selection.add(selection_item) # Does not add repeats
      end
    end

    selection.to_a.map { |selection_item| selection_item[options[:unique_key]].to_i }
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
