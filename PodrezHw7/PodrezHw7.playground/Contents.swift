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

class Student: Person {
  private var grade: Int
    var subjects: [(SchoolSubject, Int)]
    
    init(name: String, surname: String, age: Int, grade: Int, subjects: [(SchoolSubject, Int)] = []) {
        self.grade = grade
        self.subjects = subjects
        super.init(name: name, surname: surname, age: age)
    }
        func getGrade() -> Int {
            return grade
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
print("Директор \(school.director.name) \(school.director.surname) \(school.director.experience) лет опыта \(Rating.poor.rawValue) ")




//2.1 У ученика хранить имя, фамилию, номер класса, кортеж “название предмета - оценка”. Ученик наследуется от Person.
let studentMasha = Student(name: "Masha",
                           surname: "Smith",
                           age: 19, 
                           grade: 5,
                           subjects: [(.math, 10), (.law, 6)]
)
let studentIhar = Student(name: "Ihar",
                          surname: "Alexovich",
                          age: 20,
                          grade: 6,
                          subjects: [(SchoolSubject.law, 10), (SchoolSubject.math, 10), (SchoolSubject.psyhology, 10)]
)

let gradeMasha = studentMasha.getGrade()
let gradeIhar = studentIhar.getGrade()


print("Студент \(studentMasha.name) \(studentMasha.surname) на \(studentMasha.grade) курс в возрасте \(studentMasha.age) лет и получила следующие оценки:")
for subject in studentMasha.subjects {
    switch subject.0 {
    case .math:
        print(" \(SchoolSubject.math.rawValue) - оценка \(subject.1)")
    case.law:
        print(" \(SchoolSubject.law.rawValue) - оценка \(subject.1)")
    default:
        break
    }
}

print("Студент \(studentIhar.name) \(studentIhar.surname) перевелся на \(studentIhar.grade) курс в возрасте \(studentIhar.age)")


