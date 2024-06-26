import  Foundation

//1. Создать объект “Школа” со свойствами: массив учеников, название школы, адрес (адрес - новый объект с координатами x, y, street name) и директор (у директора новые поля: experience, рейтинг. Директор наследуется от класса Person (name:surname:age)).

enum sex: String{
    case male = "Мужской"
    case female = "Женский"
}

enum rating: String  {
    case poor = "Неудовлетворительно"
    case average = "Средний"
    case good = "Хороший"
    case exellent = "Невозможно хорощий)"
}


struct Address {
    var longitude: Double
    var latitude: Double
    var streetName: String
}

struct School {
    var students: [String]
    var schoolName: String
    var address: Address
    var rating: rating

}

let schoolAddress = Address(longitude: 85.131, latitude: 621.1516, streetName: "Lenina 1")
let school = School(students: ["Ivan", "Kiril", "Inga", "Mark"], schoolName: "Gimnasium 12", address: schoolAddress, rating: rating.exellent)
let students = school.students

print("Полный адрес школы \(schoolAddress)")
//Странно выдает адрес
print("Школа построена на улице \(school.address.streetName)")
print("Студенты \(school.students)")
// А тут имено в ковычках
print(students)


// 1.2 директор (у директора новые поля: experience, рейтинг. Директор наследуется от класса Person (name:surname:age)).

class Person {
    let name: String
    let surname: String
    let age: Int
    let sex: sex
    
    init(name: String,
         surname: String,
         age: Int,
         sex: sex
    ) {
        self.name = name
        self.surname = surname
        self.age = age
        self.sex = sex
    }
}




class Director: Person {
    let expirience: Int
    let rating: rating
    
    init(
        expirience: Int,
        rating: rating,
        name: String,
        surname: String,
        age: Int,
        sex: sex
    ) {
        self.expirience = expirience
        self.rating = rating
        super.init(name: name, surname: surname, age: age, sex: sex)
    }
}

let director = Director(expirience: 10, rating: .average, name: "Ivan", surname: "Ivanovich", age: 50, sex: .male)

let chooseSchool = School(students: ["Кира", "Кейдж", "Мит", "Онага", "Рэйко"], schoolName: "School 1", address:  Address(longitude: 87.465, latitude: 11.1654, streetName: "Lenina 1"), rating: rating.exellent)
                          
print("ФИО диреткора \(director.name) \(director.surname), в возрасте \(director.age) лет, с опытом более \(director.expirience) лет, пол \(sex.male.rawValue)")
print(chooseSchool)


//2.
