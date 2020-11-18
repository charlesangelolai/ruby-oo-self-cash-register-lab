require 'pry'

class CashRegister
    attr_accessor :title, :total, :discount, :items, :last_transaction
    def initialize(discount = 20)
        @total = 0
        @discount = discount
        @items = []
    end

    def add_item(title, price, quantity = 1)
        @title = title
        @last_transaction = price * quantity
        @total += last_transaction
        
        while quantity != 0
            @items << title
            quantity -= 1
        end
    end

    def apply_discount
        if @total == 0
            return "There is no discount to apply."
        else
            @discount = @total * (@discount / 100.00)
            @total -= @discount
    
            return "After the discount, the total comes to $#{@total.to_i}."
        end
    end

    def items
        @items
    end

    def void_last_transaction
        @total -= last_transaction
    end
end