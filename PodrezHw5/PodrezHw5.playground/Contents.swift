import SwiftUI

//1. Создать enum с временами года.

enum seasons {
    case winter 
    case spring
    case summer
    case fall
}

//2. Написать функцию, которая будет принимать номер месяца (Int) и возвращать enum с временем года этого месяца.

func matchSeason (month: Int) -> String {
    switch month {
    case 12, 1, 2:
        return "Зима"
    case 3, 4, 5:
        return "Весна"
    case 6, 7, 8:
        return "Лето"
    case 9, 10, 11:
        return "Осень"
    default:
        return "ошибка ввода данных"
    }
}
print(matchSeason(month: 9))

