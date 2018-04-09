class Bar

  attr_reader :bar_name, :bar_cash, :bar_drinks, :bar_tabs

  def initialize(bar_name, bar_cash, bar_drinks, bar_tabs)
    @bar_name = bar_name
    @bar_cash = bar_cash
    @bar_drinks = bar_drinks
    @bar_tabs = bar_tabs
  end

  # does guest have tab already?

    def does_guest_have_tab(supplied_guest)
      if @bar_tabs[supplied_guest] != nil
        return true
      else
        return false
      end
    end

  # create tab for guest

    def create_guest_tab(supplied_guest)
      @bar_tabs[supplied_guest] = 0
    end

  # increment tab

    def increment_guest_tab(supplied_guest, fee)
      @bar_tabs[supplied_guest] += fee
    end

  # Increment bar total with fee for room or drink

  def bar_accepts_fee(fee)
    @bar_cash += fee
  end

end
