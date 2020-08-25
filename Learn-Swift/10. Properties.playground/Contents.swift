//MARK: PROPERTIES

//MARK: LAZY: initial value is not calculated until the first time it is used.
//Useful when the initial value for a property is dependent on outside factors whose values are not known until after an instance’s initialization is complete.
//Use:
//-var
//-struct and class

//ex:
class DataImporter {
    var fileName = "data.txt"
}

class DataManager {
    lazy var importer = DataImporter()
    var data = [String]()
}

//MARK: Computed Properties -> GET // SET
//not actually store a value. Instead, they provide a getter and an optional setter to retrieve and set other properties and values indirectly.

struct Point {
    var x = 0.0, y = 0.0
}
struct Size {
    var width = 0.0, height = 0.0
}
struct Rect {
    var origin = Point()
    var size = Size()
    var center: Point {
        get {
            let centerX = origin.x + (size.width / 2)
            let centerY = origin.y + (size.height / 2)
            return Point(x: centerX, y: centerY)
        }
        set {
            origin.x = newValue.x - (size.width / 2)
            origin.y = newValue.y - (size.height / 2)
        }
    }
}
var square = Rect(origin: Point(x: 0.0, y: 0.0),
                  size: Size(width: 10.0, height: 10.0))
var initialSquareCenter = square.center

print(initialSquareCenter)

var square2 = Rect(origin: Point(x: 0.0, y: 0.0),
size: Size(width: 20.0, height: 20.0))
initialSquareCenter = square2.center
print(initialSquareCenter)
square.center = Point(x: 15.0, y: 15.0)
print("square.origin is now at (\(square.origin.x), \(square.origin.y))")


//MARK: Read-Only Computed Properties -> It's only GET
//Use:
//-var

struct Cuboid {
    var width = 0.0, height = 0.0, depth = 0.0
    var volume: Double {
        return width * height * depth
    }
}
var fourByFiveByTwo = Cuboid(width: 4.0, height: 5.0, depth: 2.0)
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
fourByFiveByTwo.height = 30
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")
//fourByFiveByTwo.volume = 40 //ERROR
print("the volume of fourByFiveByTwo is \(fourByFiveByTwo.volume)")


//MARK: Property Observers -> called whenever the property is assigned a new value.
//WILLSET is called just before the value is stored.
//DIDSET is called immediately after the new value is stored.

class StepCounter {
    var totalSteps: Int = 0 {
        willSet(newTotalSteps) {
            print("About to set totalSteps to \(newTotalSteps)")
        }
        didSet {
            if totalSteps > oldValue  {
                print("Added \(totalSteps - oldValue) steps")
            }
        }
    }
}
let stepCounter = StepCounter()
print(stepCounter.totalSteps)
stepCounter.totalSteps = 200
// About to set totalSteps to 200
// Added 200 steps
stepCounter.totalSteps = 360
print(stepCounter.totalSteps)

// About to set totalSteps to 360
// Added 160 steps
stepCounter.totalSteps = 896
// About to set totalSteps to 896
// Added 536 steps

//MARK: Property Wrappers
//Define: wrappedValue

@propertyWrapper
struct TwelveOrLess {
    private var number: Int

    init() {

        self.number = 30
        
    }
    var wrappedValue: Int {
          get {
              return number
              
          }
          
          set {
              
              number = min(newValue, 12)
              print(number)
              
          }
      }

}

var twelveorless = TwelveOrLess()
twelveorless.wrappedValue = 9

print(twelveorless.wrappedValue)

struct SmallRectangle {
    @TwelveOrLess var height: Int
    @TwelveOrLess var width: Int
}

var rectangle = SmallRectangle()
print(rectangle.height)
// Prints "0"

rectangle.height = 10
print(rectangle.height)
// Prints "10"

rectangle.height = 24
print(rectangle.height)
// Prints "12"

//OR

struct SmallRectangle2 {
    private var _height = TwelveOrLess()
    private var _width = TwelveOrLess()
    var height: Int {
        get { return _height.wrappedValue }
        set { _height.wrappedValue = newValue }
    }
    var width: Int {
        get { return _width.wrappedValue }
        set { _width.wrappedValue = newValue }
    }
}
var rectangle2 = SmallRectangle2()
print(rectangle2.height)
// Prints "0"

rectangle2.height = 10
print(rectangle2.height)
// Prints "10"

rectangle2.height = 24
print(rectangle2.height)


//Projecting a Value From a Property Wrapper


@propertyWrapper
struct SmallNumber {
    private var number: Int
    var projectedValue: Bool
    init() {
        self.number = 0
        self.projectedValue = false
    }
    var wrappedValue: Int {
        get { return number }
        set {
            if newValue > 12 {
                number = 12
                projectedValue = true
            } else {
                number = newValue
                projectedValue = false
            }
        }
    }
}
struct SomeStructure {
    @SmallNumber var someNumber: Int
}
var someStructure = SomeStructure()

someStructure.someNumber = 4
print(someStructure.$someNumber)
// Prints "false"

someStructure.someNumber = 55
print(someStructure.$someNumber)
// Prints "true"

//Ex:2
enum Size2 {
    case small, large
}

struct SizedRectangle {
    @SmallNumber var height: Int
    @SmallNumber var width: Int

    mutating func resize(to size: Size2) -> Bool {
        switch size {
        case .small:
            height = 10
            width = 20
        case .large:
            height = 100
            width = 100
        }
        return $height || $width
    }
}

var sizedrectangle = SizedRectangle()
let ok = sizedrectangle.resize(to: .small)
