require 'date'

class Promotion

  attr_reader :start_date, :end_date

  def initialize(start_date = Date.new(0), end_date = nil)
    @start_date = start_date
    @end_date = end_date
  end

  def discount(order)
    0
  end

  def valid?(date)
    start_date && start_date < date && (!end_date || date < end_date)
  end
end
