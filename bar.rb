class Bar

  attr_reader :bar_name, :bar_cash, :bar_drinks, :bar_tabs

  def initialize(bar_name, bar_cash, bar_drinks, bar_tabs)
    @bar_name = bar_name
    @bar_cash = bar_cash
    @bar_drinks = bar_drinks
    @bar_tabs = bar_tabs
  end

  # # does guest have tab already?
  #
    # def does_guest_have_tab(supplied_guest)
    #   if @bar_tabs[supplied_guest] != nil
    #     return true
    #   else
    #     return false
    #   end
    # end

  # Increment bar total with fee for room or drink

  def bar_accepts_fee(fee)
    @bar_cash += fee
  end

end
