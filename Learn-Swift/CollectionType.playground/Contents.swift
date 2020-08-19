//MARK: CollectionType
//- Array: É UM CONJUNTO DE DADOS ORDENADOS, SÃO DO MESMO TIPO
//- Set: É UM CONJUNTO DE DADOS NÃO ORDENADOS E SEM DADOS DUPLICADOS
//- Dictionary: É UM CONJUNTO NÃO ORDENADO DE PARES CHAVE-VALOR'

//Inicializer

//->ARRAY
var someInts = [Int]()
print("someInts is of type [Int] with \(someInts.count) items.")

//->SET
var letters = Set<Character>()
print("letters is of type Set<Character> with \(letters.count) items.")

//->Dictionary
var namesOfIntegers = [Int: String]()

//MARK: TYPE ARRAY

//->repeat
var threeDoubles = Array(repeating: 0.0, count: 3)

//->join array && elements

var anotherThreeDoubles = Array(repeating: 2.5, count: 3)

var sixDoubles = threeDoubles + anotherThreeDoubles

print(sixDoubles)

sixDoubles += [2.0]

//->MODIFIER

sixDoubles[3] = 4.0
print(sixDoubles)

sixDoubles[0...1] = [10.0, 11.0]
print(sixDoubles)

sixDoubles.insert(15.0, at: 3)
print(sixDoubles)

let mapleSyrup = sixDoubles.remove(at: 0)
print(sixDoubles)


//MARK: TYPE SET

//Init with elements
var favoriteGenres: Set<String> = ["Rock", "Classical", "Hip hop"]

//Add && Remove
favoriteGenres.insert("Jazz")

if let removedGenre = favoriteGenres.remove("Rock") {
    print("\(removedGenre)? I'm over it.")
} else {
    print("I never much cared for that.")
}

//Operation

let oddDigits: Set = [1, 3, 5, 7, 9]
let evenDigits: Set = [0, 2, 4, 6, 8]
let singleDigitPrimeNumbers: Set = [2, 3, 5, 7]

oddDigits.union(evenDigits).sorted()
// [0, 1, 2, 3, 4, 5, 6, 7, 8, 9]
oddDigits.intersection(evenDigits).sorted()
// []
oddDigits.subtracting(singleDigitPrimeNumbers).sorted()
// [1, 9]
oddDigits.symmetricDifference(singleDigitPrimeNumbers).sorted()
// [1, 2, 9]

//MARK: DICTIONARY

//Init with elements
namesOfIntegers = [10:"Dez", 11: "Onze"]
namesOfIntegers[16] = "sixteen"

print(namesOfIntegers)

//Convert key and value em Array

let numInt = [Int](namesOfIntegers.keys).sorted()
print(numInt)

let numString = [String](namesOfIntegers.values).sorted()
print(numString)

let finalSquare = 25
var board = [Int](repeating: 0, count: finalSquare + 1)
print(board)

