//
//  Notifications.swift
//  Salomat
//
//  Created by Tomiris Negmatova on 19/01/23.
//

import Foundation

struct Notif: Codable {
    var id: String?
    var title: String?
    var body: String?
    var image: String?
    var type: String?
    var created_at: String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, body
        case image, type, created_at
    }
}

typealias NotificationData = [Notif]
