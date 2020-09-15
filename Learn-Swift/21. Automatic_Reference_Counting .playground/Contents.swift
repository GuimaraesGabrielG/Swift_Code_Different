//MARK: Manage memory
//Reference counting applies only to instances of classes.
//Every time you create a new instance of a class, ARC allocates a chunk of memory to store information about that instance.

//MARK: Strong Reference Cycles Between Class Instances
//RESOLVE: You resolve strong reference cycles by defining some of the relationships between classes as weak or unowned references instead of as strong references.

//EXEMPLE:
class Person {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment {
    let unit: String
    init(unit: String) { self.unit = unit }
    var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}
//Create Object

var john: Person?
var unit4A: Apartment?
john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")

//We will connection with class attributes
john!.apartment = unit4A
unit4A!.tenant = john

//Problem: Exist four strong connection

//Solution:

john = nil
unit4A = nil

//But there is a connection in the classes
//Two solution: 1. weak references and 2. unowned references


//MARK: 1. Weak Reference
//A weak reference is a reference that does not keep a strong hold on the instance it refers to.

class Person2 {
    let name: String
    init(name: String) { self.name = name }
    var apartment: Apartment?
    deinit { print("\(name) is being deinitialized") }
}

class Apartment2 {
    let unit: String
    init(unit: String) { self.unit = unit }
    weak var tenant: Person?
    deinit { print("Apartment \(unit) is being deinitialized") }
}

var john2: Person2?
var unit4A2: Apartment2?

john2 = Person2(name: "John Appleseed")
unit4A2 = Apartment2(unit: "4A")

john2!.apartment = unit4A
unit4A2!.tenant = john

//when you make the instance nil, you automatically destroy the connection with the apartment and tenant, because of the weak.
john2 = nil
unit4A = nil

//FINISH: Don't exist strong connection

//MARK: 2. Unowned References




