//
//  TranslatorDataRealm.swift
//  PodrezHW32
//
//  Created by Oleg Podrez on 27.10.24.
//

import RealmSwift
import Foundation

class TranslatorDataRealm: Object {
    @objc dynamic var name: String = ""
    @objc dynamic var language: String = ""
    @objc dynamic var rate: Int = 0
    @objc dynamic var status: Bool = true
}
