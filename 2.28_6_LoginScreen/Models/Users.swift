//
//  Users.swift
//  2.28_6_LoginScreen
//
//  Created by Dimondr on 06.07.2022.
//

import Foundation


let loginName = "Dim"
let loginPassword = "123"

struct Person {
    let Name: String
    let Surname: String
    let birthYear: Int?
    let description: String?
    
    static func getPerson() {
        
    }
}

//let persons = [Person(Name: "Dmitry", Surname: "Karikh", birthYear: 1983)]


struct User {
    let userID: Int
    let login: String
    let password: String
    let person: Person?
    
    static func getUsers() -> [User] {
        [
            User(
                userID: 1,
                login: "Dim",
                password: "123",
                person:
                    Person(
                    Name: "Dmitry",
                    Surname: "Karikh",
                    birthYear: 1983,
                    description: "Привет, мой друг! Я вырос в Зеленограде (30 км от МСК). Женат. Трое детей (2/2/4). Имею два высших образования: радиотехника и экономика. 15 лет опыта в экономике и финансах. Сейчас 3й год как project менеджер на проектах 1С ЕРП. Всегда интересовало программирование. Swift пока мне очень нравится! Надеюсь, что это будет взаимно 🙈"
                    )
                )
        ]
    }
    
}
