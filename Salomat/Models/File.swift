//
//  File.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 13/11/22.
//

import Foundation

struct ResponseObject<T: Decodable>: Decodable {
    let form: T    // often the top level key is `data`, but in the case of https://httpbin.org, it echos the submission under the key `form`
}

struct Foo: Decodable {
    var user_id: String?
    var login: String?
    var password: String?
    var name: String?
    var enabled: String?
    var access: String?
    var birth_date: String?
    var address: String?
    var gender: String?
    var email: String?
    var type: String?
    var image: String?
    
    enum CodingKeys: Codable, CodingKey {
        case user_id, login, password, name, enabled
        case access, birth_date, address, gender
        case email, type, image
    }
}
