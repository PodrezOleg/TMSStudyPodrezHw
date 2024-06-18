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
    var result = mathMatch(a,b)
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
var result = calculateAreaCircle(radius: 7)

print(result)

//6. Создать функцию, которая принимает логический тип “ночь ли сегодня” и возвращает строку с описанием времени суток.

func isItNight(isNight: Bool) -> String {
    if isNight {
        return "It is Dark"
    } else {
        return "It is Light"
    }
}
print(isItNight(isNight: true))

//6.1
func isItDay(itsDay: Bool) -> String {
    let dayTime: String = itsDay ? "It is light" : "It is Dark"
    return dayTime
}
print(isItDay(itsDay: true))

//7. Создать функцию, принимающую 1 аргумент — число от 0 до 100, и возвращающую true, если оно простое, и false, если сложное.

func numbersTest (number: Int) -> Bool {
    if number <= 0 || number >= 100 {
        print("ERROR")
        return false
    }
    
    if number < 4 {
        return true
    }
    for x in 2...Int(Double(number).squareRoot()) {
        if number % x == 0 {
            return false
        }
    }
    return true
}
    
print(numbersTest(number: 60))

//8. Создать функцию, принимающую 1 аргумент — номер месяца (от 1 до 12), и возвращающую время года, которому этот месяц принадлежит (зима, весна, лето или осень).

func quarter (month: Int) -> String {
    switch month {
    case 12, 1, 2:
    return "Winter"
    case 3, 4, 5:
    return "Spring"
    case 6, 7, 8:
    return "Summer"
    case 9, 10, 11:
    return "Fall"
    default:
    return "wrong quarter"
}
}
print(quarter(month: 7))

//9*. Создать функцию, которая считает факториал введённого числа.

func factorial(number: Int ) -> Int {
    if number == 0 {
       return 1
    } else {
        return (number * factorial(number: number - 1))
    }
}
factorial(number: 10)


//10. Создать функцию, которая выводит все числа последовательности Фибоначчи до введённого индекса. Например fib(n:6) -> 0, 1, 1, 2, 3, 5, 8

func fib(n: Int) -> Int {
    if n == 0 {
        return 0
    } else if n == 1 {
        return 1
    }
    return fib(n: n - 1) + fib(n: n - 2)
}
print(fib(n: 10))


//11*. Создать функцию, которая считает сумму цифр четырехзначного числа, переданного в параметры функции

func calculate(m: Int) -> Int {
    
    
}
