require_relative "base"

class StoreSchema::Converter::Boolean < StoreSchema::Converter::Base

  # @return [String] the database representation of a true value.
  #
  DB_TRUE_VALUE = "t"

  # @return [Array] all the values that are considered to be truthy.
  #
  TRUE_VALUES = [true, 1, "1", "t", "T", "true", "TRUE", "on", "ON"]

  # @return [Array] all the values that are considered to be falsy.
  #
  FALSE_VALUES = [false, 0, "0", "f", "F", "false", "FALSE", "off", "OFF"]

  # @return [Object]
  #
  attr_reader :value

  # @param [Object] value
  #
  def initialize(value)
    @value = value
  end

  # Converts the {#value} to a database-storable value.
  #
  # @return [String, false] false if {#value} is an invalid date-type.
  #
  def to_db
    if TRUE_VALUES.include?(value)
      "t"
    elsif FALSE_VALUES.include?(value)
      "f"
    else
      false
    end
  end

  # Converts the {#value} to a Ruby-type value.
  #
  # @return [true, false]
  #
  def from_db
    value == DB_TRUE_VALUE
  end
end
