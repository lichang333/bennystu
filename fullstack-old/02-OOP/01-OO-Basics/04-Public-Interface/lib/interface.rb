
require_relative 'bank_account'
require_relative 'transaction'
my_account = BankAccount.new("Jan", "DE89370400440532013000", 1000, "password")

my_account.transactions_history(password: "password")

# p my_account.name
# p my_account.iban
# p my_account.balance
# p my_account.withdraw(100)
# p my_account.deposit(10000)
# p my_account.to_s
# my_account.deposit(2000)
# my_account.transactions_history(password: "password")
# my_t2 = Transaction.new(200)
# my_t.to_s
