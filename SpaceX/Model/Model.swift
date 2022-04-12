//
//  Model.swift
//  SpaceX
//
//  Created by Мария Филиппова on 12.04.2022.
//

import UIKit

let lineNamesSection0 = ["Первый запуск", "Страна", "Стоимость запуска"]
let lineNamesForStage = ["Количество двигателей", "Количество топлива", "Время сгорания"]

struct Model: Decodable {
    
    static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "d MMMM, yyyy"
        df.locale = Locale(identifier: "ru_MD")
        return df
    }()

    struct RocketModel: Decodable {
        var height: Height?
        var diameter: Diameter?
        var mass: Mass?
        var flickr_images: [String]?
        var name: String?
        var first_stage: First_stage?
        var second_stage: Second_stage?
        var payload_weights: [Payload_weights]? // index 0
        var cost_per_launch: Int?
        var first_flight: String?
        var first_flightString: String {
            return Model.dateFormatter.string(from: first_flight?.toDate() ?? Date())
        }
        var country: String?
    }
    
    var rockets: [RocketModel]
}

struct Height: Decodable {
    var meters: Float?
    var feet: Float?
}

struct Diameter: Decodable {
    var meters: Float?
    var feet: Float?
}

struct Mass: Decodable {
    var kg: Float?
    var lb: Float?
}

struct First_stage: Decodable {
    var engines: Int?
    var fuel_amount_tons: Float?
    var burn_time_sec: Int?
}

struct Second_stage: Decodable {
    var engines: Int?
    var fuel_amount_tons: Float?
    var burn_time_sec: Int?
}

struct Payload_weights: Decodable {
    var kg: Int?
    var lb: Int?
}

var parameters = ["Высота, mt", "Диаметр, mt", "Масса, kg", "Нагрузка, kg"]
