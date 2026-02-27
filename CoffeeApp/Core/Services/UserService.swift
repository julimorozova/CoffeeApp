//
//  UserService.swift
//  CoffeeApp
//
//  Created by Julia Morozova on 27. 2. 2026..
//

import Foundation

protocol UserServiceProtocol {
    func fetchCurrentUser() async throws -> User
}

final class UserService: UserServiceProtocol {
    func fetchCurrentUser() async throws -> User {
        User.mock
    }
}
