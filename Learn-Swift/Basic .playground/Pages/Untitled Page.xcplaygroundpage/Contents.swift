
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
    
    //after compiling
    let index = 10
    precondition(index > 0, "Index must be greater than zero.")
    
    //before compiling
    let age = -3
    assert(age >= 0, "A person's age cannot be less than zero")

}

do {
//    try canThrowAnError()
} catch let error {
    print(error)
}


//Stackoverflow
//
//enum SandwichError: Int {
//    case NotMe = 0
//    case DoItYourself = 1
//}
//
//func makeMeSandwich(names: [String: String]) throws -> String {
//    guard let sandwich = names["sandwich"] else {
//        throw SandwichError.DoItYourself
//    }
//
//    return sandwich
//}
//let kitchen = ["sandwich": "ready", "breakfeast": "not ready"]
//
//do {
//    let sandwich = try makeMeSandwich(names: kitchen)
//    print("i eat it \(sandwich)")
//} catch SandwichError.NotMe {
//    print("Not me error")
//} catch SandwichError.DoItYourself {
//    print("do it error")
//} catch let error {
//    print(error.self)
//}

//enum MyError: ErrorType { case ErrorA, ErrorB }
//
//func myFunctionThatThrows() throws MyError { ...throw .ErrorA...throw .ErrorB... }
//
//do {
//    try myFunctionThatThrows()
//}
//case .ErrorA { ... }
//
//
//enum MyError: ErrorType { case ErrorA, ErrorB, ErrorC }

//
enum SandwichError: Error{
    case outOfCleanDishes
    case missingIngredients
}
func makeASandwich(_ componets: [Int]) throws{
    
    if(componets.count < 3){
        throw SandwichError.missingIngredients
    }
}
do {
    try makeASandwich([2])
    print("OK")
} catch let error {
    print(error)
}



enum StudentError: Error {
    case invalid(String)
    case tooShort
}

class Student {
    var name: String?
    init(name: String?) throws {
        guard let name = name else{
            throw StudentError.invalid("Invalid")
        }
        self.name = name }

    func myName(str: String) throws -> String {

        guard str.count > 5
            else{
                throw StudentError.tooShort
        }

        return "My name is \(str)"
    }
}

do {
    try Student(name: nil)
} catch let error {
    print(error)
}

