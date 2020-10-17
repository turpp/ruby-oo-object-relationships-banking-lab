class BankAccount
attr_accessor :balance, :status
attr_reader :name

    def initialize(name,balance = 1000, status = "open")
        @name=name
        @balance = balance
        @status = status
    end

    def deposit(amount)
        self.balance=(@balance + amount)
    end

    def display_balance
        "Your balance is $#{@balance}."
    end

    def valid?
        #check the status and balance of the account
        #if balance is > 0 true
        #if status == open true
        #if not the above then not valid
        bal_good = @balance > 0
        status_good = @status =="open"

        if bal_good == status_good
            true
        else
            false
        end
    end

    def close_account
        self.status=("closed")
    end





end
