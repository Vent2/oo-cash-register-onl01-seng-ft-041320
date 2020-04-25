class CashRegister
  attr_accessor :total, :discount, :price

  def initialize(discount=0)
    @total = 0
    @discount = discount
    @cart = []
  end

  def add_item(item, price, quantity=1)
    @price = price
    item_price = price * quantity
    item_qty= [item] * quantity
    @cart << [item_qty, item_price]
    @total += item_price
  end

  def apply_discount
    @total -= @total*@discount/100
    if self.discount == 0
       "There is no discount to apply."
    else
      "After the discount, the total comes to $#{@total}."
    end
  end

  def items
    @cart.collect {|item, price| item}.flatten
  end

  def void_last_transaction
    @cart.pop()
    @total -= @price
    if @cart == []
      @total = 0
    end
    @total
  end
end
