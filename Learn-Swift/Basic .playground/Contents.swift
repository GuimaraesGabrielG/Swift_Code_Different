
// MARK: Type Declaration

let day: String
let year: Int
let size: Double

//MARK: Type Declaration Many in a Row

var red, green, blue: Double

//MARK: Put FloatingPoint

var height = 1.25
print(height)

height = 1.25e+1
print(height)

//MARK: Type Aliases = Use when you want to declare another name for the variable

typealias lotMoney = UInt64

print(lotMoney.max)


//MARK: Tupla = Declare any type and join

let team = ("Lyon", "champions")

print(team.0)
print(team.1)

let spanishChampionship = ("Barcelona", 26)
print(spanishChampionship.0)
print(spanishChampionship.1)

///
let (club,champions) = spanishChampionship

print(club)
print(champions)

//
let (country, _) = spanishChampionship
print(country)
//

let dayNow = (day: 12, month: 8)

print(dayNow.day)
print(dayNow.month)

//MARK: Optional

let possibleNumber = "123"
let convertedNumber = Int(possibleNumber)

print(convertedNumber)

var surveyAnswer: String? //Default nil
print(surveyAnswer)


//When you are sure it has value put "!" to unwrap
print(convertedNumber!)

//Other means to unwrap

if let converted = convertedNumber {
    print(converted)
}

if let firstNumber = Int("4"), let secondNumber = Int("42"), firstNumber < secondNumber && secondNumber < 100 {
    print("\(firstNumber) < \(secondNumber) < 100")
}

if let firstNumber = Int("4") {
    if let secondNumber = Int("42") {
        if firstNumber < secondNumber && secondNumber < 100 {
            print("\(firstNumber) < \(secondNumber) < 100")
        }
    }
}

//MARK: Error Handling & Assert & Precondition

func canThrowAnError() throws {
    let age = -3
    assert(age >= 0, "A person's age cannot be less than zero")

    let index = 10
    precondition(index > 0, "Index must be greater than zero.")
}

do {
    try canThrowAnError()
} catch {
    print("error")
}

func makeASandwich() throws {
    // ...
}

//
//do {
//    try makeASandwich()
//    eatASandwich()
//} catch SandwichError.outOfCleanDishes {
//    try washDishes()
//} catch SandwichError.missingIngredients(let ingredients) {
//    buyGroceries(ingredients)
//}


