//MARK: Emun -> Common type for a group of related values

//All Cases
enum Beverage: CaseIterable {
    case coffee, tea, juice
}
let numberOfChoices = Beverage.allCases.count
print("\(numberOfChoices) beverages available")

for beverage in Beverage.allCases {
    print(beverage)
}

//Add Values
enum Barcode {
    case upc(Int, Int, Int, Int)
    case qrCode(String)
}
let type = Barcode.upc(12, 42, 24, 11)
print(type)

switch type {
case .upc(let numberSystem, let manufacturer, let product, let check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case .qrCode(let productCode):
    print("QR code: \(productCode).")
}
//or
switch type {
case let .upc(numberSystem, manufacturer, product, check):
    print("UPC: \(numberSystem), \(manufacturer), \(product), \(check).")
case let .qrCode(productCode):
    print("QR code: \(productCode).")
}

//MARK: Enum type

enum ASCIIControlCharacter: Character {
    case tab = "\t"
    case lineFeed = "\n"
    case carriageReturn = "\r"
}

//add number in type sequence
enum Planet: Int {
    case mercury = 7, venus, earth, mars, jupiter, saturn, uranus, neptune
}

let planet = Planet.earth.rawValue
print(planet)

let possiblePlanet = Planet(rawValue: 9)

switch possiblePlanet {
case .earth:
        print("earth")
    
case .jupiter:
        print("jupiter")
default:
    print("none")
}

enum ArithmeticExpression {
    case number(Int)
    indirect case addition(ArithmeticExpression, ArithmeticExpression)
    indirect case multiplication(ArithmeticExpression, ArithmeticExpression)
}
