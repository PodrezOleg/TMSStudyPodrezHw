import SwiftUI

//1. Создать enum с временами года.

enum seasons {
    case winter 
    case spring
    case summer
    case fall
}

//2. Написать функцию, которая будет принимать номер месяца (Int) и возвращать enum с временем года этого месяца.

func matchSeasons(month:Int) -> seasons? {
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
print(matchSeasons(month: 15) ?? "Wrong number of month")


//3. Написать метод, который принимает variadic parameter String?. Метод возвращает количество nil объектов и печатает в консоль одну строку всех объединенных не nil объектов.

