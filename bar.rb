class Bar

  attr_reader :bar_name, :bar_cash, :bar_drinks, :bar_tabs

  def initialize(bar_name, bar_cash, bar_drinks, bar_tabs)
    @bar_name = bar_name
    @bar_cash = bar_cash
    @bar_drinks = bar_drinks
    @bar_tabs = bar_tabs
  end

  # def does_guest_have_tab(guest_with_tab)
  #   # @bar_tabs[guest_with_tab] != nil ? true : false
  #   @bar_tab.index { |x| x.include?(guest_with_tab) }
  # end


  def bar_accepts_fee(fee)
    @bar_cash += fee
  end

end
