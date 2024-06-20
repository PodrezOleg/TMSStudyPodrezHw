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

