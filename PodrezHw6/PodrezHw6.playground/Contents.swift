import Cocoa

//1.1 Создайте два массива. Первый от 0 до 14, второй от 14 до 30. Объедините их в один массив.

let Arr = Array(1...14)
let Arr2 = Array(14...30)
    var Arr3 = Array(Set(Arr + Arr2)).sorted()

print(Arr3)

//1.2
var arrArray = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14]
    let arrArray2 = [14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30]

var arrArray3 = Array(Set(arrArray + arrArray2)).sorted()
print(arrArray3)

//1.3

arrArray.insert(contentsOf: arrArray2, at: 13)
arrArray.removeLast()

print(arrArray)



//2. Создать функцию, которая принимает массив int. Возвести все Int в квадрат. Возвратить новый массив.

func intSquare( _ num: [Int]) -> [Int] {
    return num.map { $0 * $0 }
    }
let arrArr = intSquare([1, 2, 3, 15])
print(arrArr)

//3. Создать функцию, которая принимает массив int. Возвратить новый массив с только четными элементами.

func inPairs (arrArray: [Int]) -> [Int] {
    return arrArray.filter({ $0 % 2 == 0})
}
print(inPairs(arrArray: arrArray))
