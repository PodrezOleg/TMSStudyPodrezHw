import Cocoa

//1. Создать объект “Школа” со свойствами: массив учеников, название школы, адрес (адрес - новый объект с координатами x, y, street name) и директор (у директора новые поля: experience, рейтинг. Директор наследуется от класса Person (name:surname:age)).

struct School {
    var students: String
    var schoolName: String
    var addres: Double

}

let school = School(students: "VAnia", schoolName: "Scgool 15", addres: 21.548)


class Person {
    let name: String
    let surname: String
    let age: Int
    let sex: String
    
    init(name: String,
         surname: String,
         age: Int,
         sex: String
    ) {
        self.name = name
        self.surname = surname
        self.age = age
        self.sex = sex
    }
    func fullNameAgeSex() {
        print(self.name, self.surname, self.sex, self.age)
        
    }
}

let director: Person = .init(name: "Ivan", surname: "Ivanov", age: 58, sex: "Male")
//print(director.name, director.surname, director.age, director.sex)
print(director.fullNameAgeSex())

