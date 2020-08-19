//MARK: Curiosity

let three = 3
let minusThree = -three
let plusThree = -minusThree

print(minusThree)
print(plusThree)

let minusSix = -6
let alsoMinusSix = +minusSix

//MARK: Compare

// Tuple -> contains the same elements and length, read from left to right
(1, "apple") < (2, "zebra")
(3, "apple") < (3, "bird")
(4, "dog") == (4, "dog")

//MARK: Ternary Conditional Operator

let contentHeight = 40
let hasHeader = true
let rowHeight = contentHeight + (hasHeader ? 50 : 20)

//MARK: Coalescing

//To check if the value is null or not, you can use this form

let defaultColorName = "red"
var userDefinedColorName: String?  //(nil)

var colorNameToUse = userDefinedColorName ?? defaultColorName

//MARK: For and Declare

let names = ["Anna", "Alex", "Brian", "Jack"]

for name in names[2...] {
    print(name)
}

for name in names[...2] {
    print(name)
}

let range = ...5

let numbers = [10, 20, 30, 40, 50, 60, 70]
print(numbers[...3])

