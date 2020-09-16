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

//An unowned reference is used when the other instance has the same lifetime or a longer lifetime.

//Let's go to the example:

class Customer {
    let name: String
    var card: CreditCard?
    init(name: String) {
        self.name = name
    }
    deinit { print("\(name) is being deinitialized") }
}

class CreditCard {
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit { print("Card #\(number) is being deinitialized") }
}

//DIFFERENCE FROM PAST EXAMPLE: The relationship between Customer and CreditCard is slightly different from the relationship between Apartment and Person seen in the weak reference example above. In this data model, a customer may or may not have a credit card, but a credit card will always be associated with a customer.
//- A CreditCard instance never outlives the Customer that it refers to. To represent this, the Customer class has an optional card property, but the CreditCard class has an unowned (and non-optional) customer property.

var john3: Customer?
john3 = Customer(name: "John Appleseed")
john3!.card = CreditCard(number: 1234_5678_9012_3456, customer: john3!)

//CONCLUSION: The Customer instance now has a strong reference to the CreditCard instance, and the CreditCard instance has an unowned reference to the Customer instance.


john = nil
//CONCLUSION: Because there are no more strong references to the Customer instance, it’s deallocated. After this happens, there are no more strong references to the CreditCard instance, and it too is deallocated:


//MARK: Unowned Optional References

//an unowned optional reference and a weak reference can both be used in the same contexts. The difference is that when you use an unowned optional reference, you’re responsible for making sure it always refers to a valid object or is set to nil.
class Department {
    var name: String
    var courses: [Course]
    init(name: String) {
        self.name = name
        self.courses = []
    }
}

class Course {
    var name: String
    unowned var department: Department
    unowned var nextCourse: Course?
    init(name: String, in department: Department) {
        self.name = name
        self.department = department
        self.nextCourse = nil
    }
}
