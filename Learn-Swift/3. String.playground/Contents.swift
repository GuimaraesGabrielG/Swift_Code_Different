//
////MARK: Literal String Multiline
//
//// Add '\' for don't break the line
//let quotation = """
//The White Rabbit put on his spectacles.  "Where shall I begin,
//please your Majesty?" he asked.
//
//"Begin at the beginning," the King said gravely, "and go on
//till you come to the end; then stop."
//"""
//
////MARK: Explain Character
//
//let exclamationMark: Character = "!"
//
//let catCharacters: [Character] = ["C", "a", "t", "!", "🐱"]
//let catString = String(catCharacters)
//
////MARK: Modify String
//
////Search index
//let greeting = "Guten Tag!"
//greeting[greeting.startIndex]
//// G
//greeting[greeting.index(before: greeting.endIndex)]
//// !
//greeting[greeting.index(after: greeting.startIndex)]
//// u
//let index = greeting.index(greeting.startIndex, offsetBy: 7)
//greeting[index]
//// a
//
////Add and Delete
//
//var welcome = "hello"
//welcome.insert("!", at: welcome.endIndex)
//print(welcome)
//
//welcome.insert(contentsOf:" there", at: welcome.index(before: welcome.endIndex))
//print(welcome)
//
//welcome.remove(at: welcome.index(before: welcome.endIndex))
//print(welcome)
//
//let range = welcome.index(welcome.endIndex, offsetBy: -8)..<welcome.endIndex
//welcome.removeSubrange(range)
//print(welcome)


//MARK: SubString
//
//let row = "Hello, world!"
//let indexRow = row.firstIndex(of: ",") ?? row.endIndex
//let beginning = row[..<indexRow]


//let newString = String(beginning)

let quotation = "We're a lot alike, you and I."
let sameQuotation = "We're a lot alike, you and I."
if quotation == sameQuotation {
    print("These two strings are considered equal")
}
// 打印输出“These two strings are considered equal”

//MARK: Suffix and Prefix

let romeoAndJuliet = [
    "Act 1 Scene 1: Verona, A public place",
    "Act 1 Scene 2: Capulet's mansion",
    "Act 1 Scene 3: A room in Capulet's mansion",
    "Act 1 Scene 4: A street outside Capulet's mansion",
    "Act 1 Scene 5: The Great Hall in Capulet's mansion",
    "Act 2 Scene 1: Outside Capulet's mansion",
    "Act 2 Scene 2: Capulet's orchard",
    "Act 2 Scene 3: Outside Friar Lawrence's cell",
    "Act 2 Scene 4: A street in Verona",
    "Act 2 Scene 5: Capulet's mansion",
    "Act 2 Scene 6: Friar Lawrence's cell"
]

for scene in romeoAndJuliet {
    if scene.hasPrefix("Act 1 ") {
        print(scene)
    }
}

for scene in romeoAndJuliet {
    if scene.hasSuffix("Verona") {
        print(scene)
    }
}
