import Cocoa

//1.1 Создайте два массива. Первый от 0 до 14, второй от 14 до 30. Объедините их в один массив.

let Arr = Array(1...14)
let Arr2 = Array(15...30)

var Arr3 = Arr + Arr2

print(Arr3)

//1.2
var ArrArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
let ArrArray2 = [15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]

var ArrArray3 = ArrArray + ArrArray2
print(ArrArray3)

//1.3

ArrArray.insert(contentsOf: ArrArray2, at: 14)

print(ArrArray)



//2. Создать функцию, которая принимает массив int. Возвести все Int в квадрат. Возвратить новый массив.

func intSquare