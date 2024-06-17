import SwiftUI

//1. Написать функцию, которая:

//- Будет просто выводить в консоль ”Hello, world!”.
func sayHi() -> String {
    return "Hello, world!"
}
print(sayHi())

//- Будет принимать аргумент “имя” и выводить в консоль “Hello, имя” (вызов функции должен быть следующим - printHi(“Misha”)).
func printHi(_ name: String) -> String {
    return ("Hello, \(name)")
}
    printHi("Misha")

//- Будет принимать аргумент имя и возвращать строку приветствия “Hello! имя”.

func sayHello(legend: String) -> String {
    return "Hello " + legend + "!"
}
print (sayHello (legend: "Maradona") )




//2. Написать функцию, которая принимает две строки и возвращает сумму количества символов двух строк.


func sum (numberA: Int, numberB: Int) -> Int {
    return numberA + numberB
}
sum (numberA: 12, numberB: 21)
print (sum(numberA: 6, numberB: 123))


// 2.1 Перепрочитал задание. Выполняю правильный вариант.

func sumWord(word1: String, word2: String) -> Int {
    return word1.count + word2.count
}
sumWord(word1: "United", word2: "Kingdom")

print(sumWord(word1: "Bart", word2: "Simpson"))




//3. Написать функцию, которая выводит в консоль квадрат переданного числа.
func square (x: Int) {
    print("Square of number \(x) is \(x * x) ")
}
square(x: 8)

// 3.1
func square (_ x: Int) {
    print("Square of number \(x) is \(x * x) ")
}
square(8)

//4. Создать функции, которые будут суммировать, вычитать, умножать и делить числа sum(num1:num2:).

func plusNumbers(_ number1: Int, _ number2:Int) -> Int {
    return (number1 + number2)
}

print("Adding numbers results \(plusNumbers(4, 296))")


func minusNumbers(_ number1: Int, _ number2:Int) -> Int {
    return (number1 - number2)
}
print("Substracting numbers results \(minusNumbers(674, 374))")

func multiplyNumbers(_ number1: Int, _ number2:Int) -> Int {
    return (number1 * number2)
}
print("Multiplying numbers results \(multiplyNumbers(100, 3))")


func divideNumbers(_ number1: Int, _ number2:Int) -> Int {
    return (number1 / number2)
}
print("Dividing numbers results \(divideNumbers(7200, 24))")



// 4.1 Короткий
func mathFunc(a: Int, b: Int, mathMatch: (Int, Int) -> Int) {
    let result = mathMatch(a,b)
    print(result)
}
    mathFunc(a: 9, b: 5, mathMatch: { $0 - $1 })
    mathFunc(a: 10, b: 5, mathMatch: { $0 + $1 })
    mathFunc(a: 9, b: 5, mathMatch: { $0 * $1 })
    mathFunc(a: 60, b: 5, mathMatch: { $0 / $1 })

//5. Создать функцию, которая принимает параметры и вычисляет площадь круга.


func calculateAreaCircle(radius: Int, pi: Double = 3.14) -> Double {
    let area: Double = pi * Double(radius)
    return area
}
calculateAreaCircle(radius: 79)




 

