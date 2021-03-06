//
//  SwiftForecast.swift
//  SwiftForecast
//
//  Created by Matt on 3/29/15.
//  Copyright (c) 2015 MattNedrich. All rights reserved.
//

import Foundation

public class DarkSkyForecast {
    let apiKey: String
    private let jsonProvider: WeatherJSONProvider
    
    public init(apiKey: String) {
        self.apiKey = apiKey
        self.jsonProvider = WeatherJSONProvider(apiKey: apiKey)
    }
    
  public func getCurrentForecast(_ latitude: String, longitude: String, units: Bool, lang: String) -> ForecastInfo {
      let jsonData = self.jsonProvider.getWeatherJSON(latitude, longitude: longitude, units: units, lang: lang)
        let forecast = ForecastInfo(jsonData: jsonData)
        return forecast
    }
    
    public func getPastForecast(_ latitude: String, longitude: String, atTime: Date) -> ForecastInfo {
        let jsonData = self.jsonProvider.getPastWeatherJSON(latitude, longitude: longitude, time: atTime)
        let forecast = ForecastInfo(jsonData: jsonData)
        return forecast
    }
}
