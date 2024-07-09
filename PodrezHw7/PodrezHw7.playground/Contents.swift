import  Foundation

//1. Создать объект “Школа” со свойствами: массив учеников, название школы, адрес (адрес - новый объект с координатами x, y, street name) и директор (у директора новые поля: experience, рейтинг. Директор наследуется от класса Person (name:surname:age)).

enum Sex: String{
    case male = "Мужской"
    case female = "Женский"
}

enum Rating: String  {
    case poor = "Неудовлетворительно"
    case average = "Средний"
    case good = "Хороший"
    case exellent = "Невозможно хорощий)"
}


struct Address: CustomStringConvertible {
    var longitude: Double
    var latitude: Double
    var streetName: String
    
    var description: String {
        return "Улица \(streetName), Долгота: \(longitude), Широта: \(latitude)"
    }
}

struct School {
    var students: [String]
    var schoolName: String
    var address: Address
    var rating: Rating

}

let schoolAddress = Address(longitude: 85.131, latitude: 621.1516, streetName: "Lenina 1")
let school = School(students: ["Ivan", "Kiril", "Inga", "Mark"], schoolName: "Gimnasium 12", address: schoolAddress, rating: Rating.exellent)
let students = school.students

print("Полный адрес школы \(schoolAddress)")

print("Школа построена на улице \(school.address.streetName)")
print("Студенты \(school.students)")
print("Студенты \(school.students.joined(separator: ","))")


// 1.2 директор (у директора новые поля: experience, рейтинг. Директор наследуется от класса Person (name:surname:age)).

class Person {
    let name: String
    let surname: String
    let age: Int
    let sex: Sex
    
    init(name: String,
         surname: String,
         age: Int,
         sex: Sex
    ) {
        self.name = name
        self.surname = surname
        self.age = age
        self.sex = sex
    }
}




class Director: Person {
    let expirience: Int
    let rating: Rating
    
    init(
        expirience: Int,
        rating: Rating,
        name: String,
        surname: String,
        age: Int,
        sex: Sex
    ) {
        self.expirience = expirience
        self.rating = rating
        super.init(name: name, surname: surname, age: age, sex: sex)
    }
}

let director = Director(expirience: 10, rating: Rating.exellent, name: "Ivan", surname: "Ivanovich", age: 50, sex: .male)
let chooseSchool = School(students: ["Кира", "Кейдж", "Мит", "Онага", "Рэйко"], schoolName: "School 1", address:  Address(longitude: 87.465, latitude: 11.1654, streetName: "Lenina 1"), rating: Rating.exellent)

                          
print("ФИО диреткора \(director.name) \(director.surname), в возрасте \(director.age) лет, с опытом более \(director.expirience) лет, пол \(Sex.male.rawValue)")
print("Выбирая школу мы учитывали: опыт \(director.expirience) лет и его рейтинг \(director.rating), а так же близость к школе,  \(Address(longitude: 21.123, latitude: 555.555, streetName: "Lenina 4"))")


//2.
