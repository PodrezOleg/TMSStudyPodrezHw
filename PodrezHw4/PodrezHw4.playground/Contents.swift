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
func squaer (number: Int) {
    let square = number * number
    print("Square of number \(number) is \(square) ")
}
squaer(number: 10)

//4. Создать функции, которые будут суммировать, вычитать, умножать и делить числа sum(num1:num2:).

