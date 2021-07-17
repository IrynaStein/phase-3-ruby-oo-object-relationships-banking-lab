class BankAccount
    attr_reader :name
    attr_accessor :balance, :status #used wrong attribute method

    def initialize(name)
        @name=name
        @balance=1000
        @status= "open"
    end

    def deposit(value)
       self.balance += value
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
    self.balance > 0 && self.status == "open"
    end

    def close_account
        self.status = "closed"
    end
end
