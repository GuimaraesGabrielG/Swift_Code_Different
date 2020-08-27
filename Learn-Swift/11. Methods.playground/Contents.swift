//MARK: METHODS
//MUTATING -> Structures and enumerations are value types.cannot be modified from within its instance methods.
//->if you need to modify the properties of your structure or enumeration within a particular method, you can opt in to mutating behavior for that method.
//-> only var
//Strucg
struct Point {
    var x = 0.0, y = 0.0
    
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        x += deltaX
        y += deltaY
    }
}
 //OR

struct Point2 {
    var x = 0.0, y = 0.0
    mutating func moveBy(x deltaX: Double, y deltaY: Double) {
        self = Point2(x: x + deltaX, y: y + deltaY)
    }
}

var point2 = Point2(x: 4, y: 10)
point2.moveBy(x: 70, y: 100)
print(point2.x)
//Enum
enum TriStateSwitch {
    case off, low, high
    mutating func next() {
        switch self {
        case .off:
            self = .low
        case .low:
            self = .high
        case .high:
            self = .off
        }
    }
}
var ovenLight = TriStateSwitch.low
ovenLight.next()
// ovenLight is now equal to .high
ovenLight.next()
// ovenLight is now equal to .off
