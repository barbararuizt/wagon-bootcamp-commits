# This is how you define your own custom exception classes

class DepositError < StandardError
end

class BankAccount
  # Contract for the BankAccount class
  # - you can access full owner's name and balance, but partial IBAN *
  # - you cannot access full IBAN
  # - you can print partial account info
  # - you can print transactions only with a password *
  # - you can withdraw or deposit money *
  # - You can see the balance of the account (through the balance variable) *
  attr_reader :name, :balance, :hidden_iban

  MIN_DEPOSIT = 100

  def initialize(name, iban, initial_deposit, password)
    fail DepositError, "Insufficient deposit" unless initial_deposit >= MIN_DEPOSIT

    @password     = password
    @transactions = []
    @balance      = 0
    @name         = name
    @iban         = iban

    add_transaction(initial_deposit)
  end

  def withdraw(amount)
    add_transaction(-amount)
    "You withdrew: #{amount}, your new account balance is #{balance}"
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
  end

  def deposit(amount)
    add_transaction(amount)
    "You deposited: #{amount}, your new account balance is #{balance}"
    # TODO: Call add_transaction with the right argument
    # TODO: returns a string with a message
  end

  def transactions_history(args = {})
    if args.any?
      if args[:password] == @password
        display
      else
        "wrong password"
      end
    else
      "no password given"
    end
    # TODO: Check if there is a password and if so if it is correct
    # TODO: return a string displaying the transactions, BUT NOT return the transaction array!
  end

  def iban
    "#{@iban[0..3]}**************#{@iban[-3..]}"
    # TODO: Hide the middle of the IBAN like FR14**************606 and return it
  end

  def to_s
    "Owner: #{@name} - IBAN: #{iban} - Balance: #{@balance} euros"
    # Method used when printing account object as string (also used for string interpolation)
    # TODO: return a string with the account owner, the hidden iban and the balance of the account
  end

  def display
    disp = String.new
    @transactions.each do |movement|
      if movement.positive?
        disp += "Deposit: #{movement}\n"
      else
        disp += "Withdrawal: #{movement}\n"
      end
    end
    disp
  end

  private

  def add_transaction(amount)
    @transactions << amount
    @balance += @transactions[-1]
    # TODO: add the amount in the transactions array
    # TODO: update the current balance (which represents the balance of the account)
  end
end
