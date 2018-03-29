class Money
  attr_reader :money

  @@acceptable_cash = {'1p': 0.01, '2p': 0.02, '5p': 0.05, '10p': 0.1, '20p': 0.2, '50p': 0.5, '£1': 1, '£2': 2}

  def initialize(money)
    @money = money
  end

  def self.acceptable_cash
    @@acceptable_cash
  end

  def load_machine(machine)
    machine.money.concat(@money)
  end

  def to_value
    @money.map(&:to_sym).collect{ |denomination| Money.acceptable_cash[denomination] }.compact.sum
  end
end