import SwiftUI

//1. Создать enum с временами года.

enum Seasons: String {
    case winter = "Зима"
    case spring = "Весна"
    case summer = "Лето"
    case fall = "Осень"
}
var a: Seasons = .fall
print(a.rawValue)


//2. Написать функцию, которая будет принимать номер месяца (Int) и возвращать enum с временем года этого месяца.

func matchSeasons(month:Int) -> Seasons? {
    switch month {
    case 12, 1, 2:
        return.winter
    case 3, 4, 5:
        return.spring
    case 6, 7, 8:
        return.summer
    case 9, 10, 11:
        return.fall
    default:
        return nil
    }
}
print(matchSeasons(month: 9) ?? "Wrong number of month")


      
      
      
//3. Написать метод, который принимает variadic parameter String?. Метод возвращает количество nil объектов и печатает в консоль одну строку всех объединенных не nil объектов.
func varidicParameterString (arrString: String?...) -> Int {
    var count: Int = 0
    var listOfString: [String] = []
    for string in arrString {
        if string != nil {
            if let string {
                listOfString.append(string)
            }
        } else {
            count += 1
        }
    }
    return count
}
//print(varidicParameterString(arrString: "Balu", "Maugli", nil, "Sharhan", nil, "Baghira", nil, "Tabaki"))
print("Количество Nil составило \(varidicParameterString(arrString: "Maugli", nil, "Sharhan", "Tabaki", nil, nil)) шт.")



//4 Написать мини конспект по работе с optional и зачем он нужен. Конспект должен содержать все способы извлечения опционала со своими примерами.
// Optional - что это и засем он?
//Опционалы это значение переменых, которые имеют значение( в String это стороки и символы, пишуться через "", в Int это целое числло, обозначается через (1,2,3...),  либо нет (nil)

//Как раскрыть опционалы?

//1. Принулительно извлечение ( саоме опасное) через !
//      Может ( скорее всего обязательно) приведет к критической ошибки


let name: String = "Plunder and Flee Inc."
    var employees: Int?
 
print(name)
//print(income!)

// 1.1. Сразу распакованный опционал

var field: String! = "АйТи"
var income: Double!

print(field)
print(income)


// 2. Извлечение через if. Используем его для сравнения опционала с nil ( есть ли у него значение, если нету выдаем nilб если есть, выдем значение)

var budget: Int?
if budget != nil {
    print ("We have some money \(budget)")
} else {
        print("Call your parents")
}


// 2.1. Извлечение через if let. Почти такое же, как и в извлечение через if, только тут мы используем временную переменную для хранения.

var budget2: Int?
budget2 = 19
if let bank = budget2 {
    print("We have some money \(bank)")
} else {
    print("Call your parents")
}

// 3. извлечение опционала через guard
func anualBudget() {
var budget3: Int? = 854
guard let bank = budget3 else {
    return
}
print("We have some money \(bank)")
}

anualBudget()


// 4. Оператор ??  Очень простое и приятное решение.

var budget3:Int?
let sendMoney = 1
let budgetToSpend:Int = budget3 ?? sendMoney
print(budgetToSpend)

