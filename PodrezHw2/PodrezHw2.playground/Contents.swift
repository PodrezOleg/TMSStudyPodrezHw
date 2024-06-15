import SwiftUI
//1. Создать новый Playground

var greeting = "Hello, playground"

//2. Написать переменные и константы всех базовых типов данных: Int, Bool, Float,Double, String.

var x: Int = 14062024
let xx: Float  = 2.123455
var xyx: Double = 4.599398530958930
var health: Bool = true
var yyy: String = "Mars"

//2.1 У чисел вывести их минимальные и максимальные значения (Int8/16…UInt…), а у строки – количество символов.

print ("IntMax = \(Int.max) , IntMin = \(Int.min)")
print ("Int8Max = \(Int8.max) , Int8Min = \(Int8.min)")
print ("UIntMax = \(UInt.max) , UIntMin = \(UInt.min)")
print ("Int16Max = \(Int16.max) , Int16Min = \(Int16.min)")
print ("Int32Max = \(Int32.max) , Int32Min = \(Int32.min)")
print ("Int64Max = \(Int64.max) , Int64Min = \(Int64.min)")
print ("UInt8Max = \(UInt8.max) , UInt8Min = \(UInt8.min)")
print ("UInt16Max = \(UInt16.max) , UInt16Min = \(UInt16.min)")
print ("UInt32Max = \(UInt32.max) , UInt32Min = \(UInt32.min)")
print ("UInt64Max = \(UInt64.max) , UInt64Min = \(UInt64.min)")

//2.1.1 Количество символов



let countCharacter: String = "30SecondsToMars"
let countCharacter2: String = "Concert"

print("Напиши количество символов \(countCharacter.count) и \(countCharacter2.count) в Испании")

var  str = countCharacter + "  " +  countCharacter2

//3. Написать различные выражения с приведением типа. Минимум 8 выражений.

var organisation: String = "Hospital"
var patient: [String] = ["1 person", "2 person", "3 person"]
var amountOfRooms: Int = 10
var temperature: Double = 36.6
var doctorsSalary: Float = 1023.2345


var inquiry: String = "Всего в \(organisation) в \(amountOfRooms) комнатах лежат  \(patient) и у них средняя температура \(temperature)"
print(inquiry)


var cash: Double = Double(doctorsSalary) + (temperature) / Double(amountOfRooms)
print (cash)

var rooms: Int = amountOfRooms * Int(temperature)
print(rooms)

var docTemp: Float = doctorsSalary / Float(temperature)
print(docTemp)

//4. Произвести различные вычисления с математическими операторами (умножение, деление, сложение, вычитание). Выводить результат в консоль в таком виде: 3 + 2 = 5 (использовать интерполяцию строк).



var pp: Float = 954.84
var uu: Int = 4
var tt: Double = 356.84949933
var rr: Int = 11

var add  = "\(pp) + \(uu) = \(pp + Float(uu))"
print(add)

var remove = "\(uu) - \(tt) = \(Double(uu) - tt)"
print(remove)

var ethernalAdd = "\(rr) * \(tt) = \(Double(rr) * tt)"
print(ethernalAdd)

var ethernalremove = "\(pp) / \(uu) = \(pp / Float(uu))"
print(ethernalremove)


// 5. С помощью if-else необходимо вывести в консоль, ночь ли сегодня (isNight).


let currentHour = 24

let stratNight = 24
let endNight = 06


var isNight: Bool
if currentHour >= stratNight || currentHour < endNight {
    isNight = true
}
else {
    isNight = false
}
print ("isNight: \(isNight)")


// еще отголоски от 3 задания

var conditions: () = if temperature <= 40 {
    print("Is hot \(health)")
}
else {
    print ("It is Cold in \(organisation)")
}


//6. Дана строка, сделать копию этой строки. Вывести копию строки в консоль. Помним,что строка – это коллекция символов, по которым можно "пробегаться". Решение let str2 = str1; print(str2) не принимается.

let str1 = "coffe"
var str2 = ""

for cof in str1 {
    str2.append(cof)
    
    print("Напиток \(str2)")
}
// 7.Сделать проверку: является ли число четным: 13, 2, 20, 21, 76.

let birthaday = [12, 2, 20, 21, 76]
for number in birthaday {
    if number % 2 == 1 {
        print ("День рождение, \(number) нечетного числа")
    }
    else {
        print ("День рождение, \(number) четного числа")
    }
}
//67 дня по знаку зодиака дракон )))


//8. В переменной day лежит какое-то число от 1 до 31 (вы задаете сами любое). Определить, в какую декаду месяца попадает это число (в первую, вторую или третью).

var decade1 = 1...10
var decade2 = 11...20
var decade3 = 21...30

var day = 15

switch day {
case decade1:
    print("1 декада месяца")
case decade2:
    print("2 декада месяца")
case decade3:
    print("3 декада месяца")
default:
    print("введите день")
}
    
//9*. Дана строка, состоящая из символов, например, “bbppeeyy”
//    . Проверить, что первым символом этой строки является буква “a” (или любая другая).
//      Если это так – вывести 'да', в противном случае - ‘нет’
//  Затем поменяйте строку, чтобы условие соблюдалось. Поэкспериментируйте с разными строками.

var text = "bbppeeyy"
for bbppeeyy in text{
    print(bbppeeyy)
        if bbppeeyy == "b" {break}; print("Да")
    }
//не совсем понятен результат мне и задача(


//10. Вывести таблицу умножения в консоль с помощью циклов for in.

var list = 1...9

for rowValue in list {
    for columnValue in list{
        var multiplying = rowValue * columnValue
        print("\(rowValue) * \(columnValue) = \(multiplying)")
    }
    print()
}


