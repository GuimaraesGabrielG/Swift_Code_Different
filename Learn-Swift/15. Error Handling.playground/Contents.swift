//MARK: ERROR
// Errors are represented by values of types that conform to the Error protocol.

//When an error is thrown, some surrounding piece of code must be responsible for handling the error—for example, by correcting the problem, trying an alternative approach, or informing the user of the failure

//HENDLER:
//1. You can propagate the error from a function to the code that calls that function;
//2. handle the error using a do-catch statement;
//3. handle the error as an optional value;
//4. assert that the error will not occur.

//MARK: FUNCTION:
//write the try keyword—or the try? or try! variation—before a piece of code that calls a function, method, or initializer that can throw an error.

//To indicate that a function, method, or initializer can throw an error, you write the throws keyword in the function’s declaration after its parameters.

//func canThrowErrors() throws -> String
//
//func cannotThrowErrors() -> String

//EX:
//PROTOCOL ERROR
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}

struct Item {
    var price: Int
    var count: Int
}

class VendingMachine {
    var inventory = [
        "Candy Bar": Item(price: 12, count: 7),
        "Chips": Item(price: 10, count: 4),
        "Pretzels": Item(price: 7, count: 11)
    ]
    var coinsDeposited = 0

    func vend(itemNamed name: String) throws {
        guard let item = inventory[name] else {
            throw VendingMachineError.invalidSelection
        }

        guard item.count > 0 else {
            throw VendingMachineError.outOfStock
        }

        guard item.price <= coinsDeposited else {
            throw VendingMachineError.insufficientFunds(coinsNeeded: item.price - coinsDeposited)
        }

        coinsDeposited -= item.price

        var newItem = item
        newItem.count -= 1
        inventory[name] = newItem

        print("Dispensing \(name)")
    }
}

let favoriteSnacks = [
    "Alice": "Chips",
    "Bob": "Licorice",
    "Eve": "Pretzels",
]
func buyFavoriteSnack(person: String, vendingMachine: VendingMachine) throws {
    let snackName = favoriteSnacks[person] ?? "Candy Bar"
    try vendingMachine.vend(itemNamed: snackName)
}

//INIT
struct PurchasedSnack {
    let name: String
    init(name: String, vendingMachine: VendingMachine) throws {
        try vendingMachine.vend(itemNamed: name)
        self.name = name
    }
}

//MARK: Do-Catch -> use a do-catch statement to handle errors by running a block of code.

var vendingMachine = VendingMachine()
vendingMachine.coinsDeposited = 8
do {
    try buyFavoriteSnack(person: "Alice", vendingMachine: vendingMachine)
    print("Success! Yum.")
} catch VendingMachineError.invalidSelection {
    print("Invalid Selection.")
} catch VendingMachineError.outOfStock {
    print("Out of Stock.")
} catch VendingMachineError.insufficientFunds(let coinsNeeded) {
    print("Insufficient funds. Please insert an additional \(coinsNeeded) coins.")
} catch {
    print("Unexpected error: \(error).")
}

//MARK: Converting Errors to Optional Values

func someThrowingFunction() throws -> Int {
    return Int.max
}

let x = try? someThrowingFunction()
print(x)

let y: Int?
do {
    y = try someThrowingFunction()
    print(y)
} catch {
    y = nil
}
//use guard let or if let for unwrap

//MARK: defer -> execute a set of statements just before code execution leaves the current block of code.

func processFile(filename: String) throws {
    defer {
        print("finish?")
    }
    print("right")
    
    for i in 0...10{
        print(i)
    }
}
    
try processFile(filename: "File")
