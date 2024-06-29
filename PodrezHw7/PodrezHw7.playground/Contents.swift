import Cocoa


enum Rating: String {
    case poor = "Неудовлитворително"
    case average = "Средний"
    case good = "Хороший"
    case excellent = "Иделаьный"
}

enum SchoolSubject: String {
    case math = "Математика"
    case chemistry = "Химия"
    case law = "Право"
    case psyhology = "Психология"
}

class Person {
    let name: String
    let surname: String
    let age: Int
    
    init(name: String, surname: String, age: Int) {
        self.name = name
        self.surname = surname
        self.age = age
    }
}

class Director: Person {
    let experience: Int
    let rating: Rating
    
    init(experience: Int, rating: Rating, name: String, surname: String, age: Int) {
        self.experience = experience
        self.rating = rating
        super.init(name: name, surname: surname, age: age)
    }
}

struct Address {
    var longitude: Double
    var latitude: Double
    var street: String
    
    var description: String {
        return "Улица \(street), Долгота \(longitude), Широта \(latitude)"
    }
}

class School {
    var students: [String]
    var schoolName: String
    var address: Address
    var director: Director
    
    init(students: [String], schoolName: String, address: Address, director: Director) {
        self.students = students
        self.schoolName = schoolName
        self.address = address
        self.director = director
    }
}

let director = Director(experience: 10, rating: .excellent, name: "Ivan", surname: "Ivanovich", age: 50)
let address = Address(longitude: 85.131, latitude: 621.1516, street: "Lenina 1")
let school = School(students: ["Ivan", "Kiril", "Inga", "Mark"], schoolName: "Gimnasium 12", address: address, director: director)


print("Школа построена на улице \(school.address.street)")
print("Студенты \(school.students)")
print(address.description)


class Student: Person {
    let grade: Int
    var subjects: [(SchoolSubject, Int)]
    
    init(grade: Int, subjects: [(SchoolSubject, Int)]) {
        self.grade = grade
        self.subjects = subjects
        super.init(name: name, surname: surname, age: age)
    }
}
