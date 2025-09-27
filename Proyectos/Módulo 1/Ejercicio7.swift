//: [Previous](@previous)

struct BankAccount {
    let owner: String
    var balance: Double
    
    mutating func deposit(amount: Double) {
        guard amount > 0 else {
            print("The deposito must be positive")
            return
        }
        balance += amount
    }
    
    mutating func withdraw(amount: Double) {
        guard amount > 0 else {
            print("The withdrawal must be positive")
            return
        }
        
        guard balance >= amount else {
            print("Insufficient funds")
            return
        }
        balance -= amount
    }
    
    mutating func transfer(amount: Double, to otherAccount: inout BankAccount){
        guard amount > 0 else {
            print("The money to transfer must be positive")
            return
        }
        
        guard balance >= amount else {
            print("Insufficient funds")
            return
        }
        
        otherAccount.balance += amount
        balance -= amount
    }
}

extension BankAccount: CustomStringConvertible {
    var description: String {
        return "Owner: \(owner)\n   Balance in the account: \(balance)"
    }
}

var account1 = BankAccount(owner: "Alice", balance: 1000)
var account2 = BankAccount(owner: "Bob", balance: 500)

print("\n---------------------------------------\nAccounts in the bank:")
print(account1)
print("")
print(account2)

account1.withdraw(amount: 200)
print("\n---------------------------------------\nAfter Alice withdraws $200:")
print(account1)

account1.transfer(amount: 300, to: &account2)
print("\n---------------------------------------\nAfter Alice transfers $300 to Bob:")
print(account1)
print("")
print(account2)

account2.deposit(amount: 5000)
print("\n---------------------------------------\nAfter Bob deposits $5000:")
print(account2)

//: [Next](@next)
