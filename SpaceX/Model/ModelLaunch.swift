//
//  ModelLaunch.swift
//  SpaceX
//
//  Created by Мария Филиппова on 14.04.2022.
//

import Foundation

struct ModelLaunch: Decodable{
    static let dateFormatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "d MMMM, yyyy"
        df.locale = Locale(identifier: "ru_MD")
        return df
    }()
    
    struct Launch: Decodable{
        var name: String?
        var rocket: String?
        var success: Bool?
        var static_fire_date_utc: String?
        var static_fire_date_utcString: String {
            return ModelLaunch.dateFormatter.string(from: static_fire_date_utc?.toDateForLaunch() ?? Date())
        }
    }
}
