//
//  User.swift
//  Login App
//
//  Created by Тимур on 11.03.2022.
//

import Foundation
import UIKit

struct User {
    let userName: String
    let password: String
    let person: Person
    
    static func getUser() -> User {
        User(
            userName: "User",
            password: "password",
            person: Person(
                fullName: "Timur Goryaev",
                aboutPerson: "Нужно продолжить работу с проектом прошлого ДЗ и доработать его, используя схему MVC. Это значит, что для хранения имени пользователя, пароля и прочей информации, которая должна отображаться на экране, нужно создать модель данных.",
                image: "photoEye"
            )
        )
    }
}

struct Person {
    let fullName: String
    let aboutPerson: String
    let image: String
}
