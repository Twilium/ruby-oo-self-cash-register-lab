class CashRegister
    attr_accessor :discount

    def initialize(discount = 0, total = 0)
        @item = []
        @total = total
        @discount = discount
    end

    def total=(total)
        @total = total
    end

    def total
        @total
    end

    def add_item(item, price, quantity = 1)
        counter = 0
        while counter < quantity
            @item << item
            counter += 1
        end
        @item.flatten!
        @price = price
        @total += price * quantity
        @last_item = price * quantity
    end

    def apply_discount
        if @discount != 0
            @total = total - (total * (discount/100.0))
            "After the discount, the total comes to $#{@total.round}."
        else
            "There is no discount to apply."
        end
    end

    def items
        @item
    end

    def void_last_transaction
        @item.pop()
        @total = @total - @last_item
    end
end
