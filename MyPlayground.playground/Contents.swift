import Cocoa

// Int parameter
func multiplyByTwo(number: Int) -> Int {
    return number * 2
}

print(multiplyByTwo(number: 10))

// String parameter
func greetPerson(name: String) {
    print("Hello, \(name)!")
}

greetPerson(name: "John")


// Array parameter
func sumArray(numbers: [Int]) -> Int {
    var sum = 0
    for number in numbers {
        sum += number
    }
    return sum
}

let arraySum = sumArray(numbers: [1, 2, 3, 4, 5])
print(arraySum)


// Dictionary parameter
func printDictionary(dictionary: [String: Int]) {
    for (key, value) in dictionary {
        print("\(key): \(value)")
    }
}

let studentGrades = ["Alice": 85, "Bob": 92, "Charlie": 78]
printDictionary(dictionary: studentGrades)

//with parameter and argument labels

func greet(to name:String){
    print("Good moringing \(name)")
}
greet(to: "iroh")

//calling without parameter name : ignoring exteranl labels
func sum(_ a:Int,_ b:Int)-> Int{
    return a + b
}
sum(10, 8)


//return without return type
func doSomething(){
    var array = [1,2,3,4]
    for number in array{
        if number == 3{
            return // can use return eventhough the function not returning values
        }
    }
}


//function composition: creating new function by compaining functions
func addOne(_ number: Int) -> Int {
    return number + 1
}

func double(_ number: Int) -> Int {
    return number * 2
}

func square(_ number: Int) -> Int {
    return number * number
}

let composedFunction = square >>> double >>> addOne
let result = composedFunction(2)
print(result) // Output: 10

precedencegroup CompositionPrecedence {
    associativity: left
}

infix operator >>>: CompositionPrecedence

func >>> <T, U, V>(lhs: @escaping (T) -> U, rhs: @escaping (U) -> V) -> (T) -> V {
    return { rhs(lhs($0)) }
}


//Altering parameter
func increment(number: inout Int) {
    number += 1
}

var count = 5
increment(number: &count)
print(count) 


// returning multiple values using dicitonaries
func calculateMinMax(numbers: [Int]) -> (min: Int, max: Int) {
    var min = Int.max
    var max = Int.min
    
    for number in numbers {
        if number < min {
            min = number
        }
        
        if number > max {
            max = number
        }
        
    }
    
    
    return (min, max)
}

let numbers = [2, 5, 9, 1, 7]
let statistics1 = calculateMinMax(numbers: numbers)

print(statistics1.min)
print(statistics1.max)


let (min,max) = calculateMinMax(numbers: numbers)// splitting tuple values
let (min1,_) = calculateMinMax(numbers: numbers)// disgarding unwanted values
