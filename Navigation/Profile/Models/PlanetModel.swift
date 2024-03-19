//
//  PlanetModel.swift
//  Navigation
//
//  Created by Apple Mac Air on 13.12.2023.
//

import Foundation

struct PlanetModel: Decodable {
    let name: String
    let rotationPeriod: String
    let orbitalPeriod: String
    let diameter: String
    let climate, gravity, terrain: String
    let surfaceWater: String
    let population: String
    let residents: [String]
    let films: [String]
    let created, edited, url: String
    
    private enum CodingKeys: String, CodingKey {
        case name
        case rotationPeriod = "rotation_period"
        case orbitalPeriod = "orbital_period"
        case diameter
        case climate, gravity, terrain
        case surfaceWater = "surface_water"
        case population
        case residents
        case films
        case created, edited, url
    }
}
