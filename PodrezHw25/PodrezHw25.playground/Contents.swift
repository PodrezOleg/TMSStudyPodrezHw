import Cocoa

class PersonBig {
    let name: String
    let sex: String
    let age: Int
   weak var apartment: Apartment?

    init(name: String, sex: String, age: Int, apartment: Apartment? = nil) {
        self.name = name
        self.sex = sex
        self.age = age
        self.apartment = apartment
        print("PersonBig \(name) init")
    }
    
    deinit {
        print ("PersonBig \(name) deinit")
    }
}

class Apartment {
    let address: String
    let number: Int
  weak var resident: PersonBig?
    
    init(address: String, number: Int, resident: PersonBig? = nil) {
        self.address = address
        self.number = number
        self.resident = resident
        print ("Apartment \(address) \(number) initi")
    }
    deinit {
        print("Apartment \(address) \(number) deinit")
    }
}

var manson: PersonBig? = PersonBig(name: "Manson", sex: "Male", age: 55)
var apartment127: Apartment? = Apartment(address: "Lenina 99", number: 101)

manson?.apartment = apartment127
apartment127?.resident = manson

print("\(manson?.name ?? "No name") lives at \(manson?.apartment?.address ?? "No address")")
print("\(apartment127?.resident?.name ?? "No resident") lives in apartment \(apartment127?.number ?? 0)")

manson = nil
apartment127 = nil
