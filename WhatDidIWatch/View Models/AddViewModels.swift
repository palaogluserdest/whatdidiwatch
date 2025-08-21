//
//  AddViewModels.swift
//  WhatDidIWatch
//
//  Created by Serdest on 21.08.2025.
//

import Foundation

class AddViewModel {
    
    
    
    
    // MARK: - Properties
    
    var imdbId: String?
    var watchedName: String?
    var watchedType: WatchedType
    var watchedStatus: WatchedStatus
    var rating: Int?
    var maybeWatched: Bool?
    var defaultConfiguration: Configuration
    
    init( configuration: Configuration) {
        self.imdbId = ""
        self.watchedName = ""
        self.watchedType = configuration.watchedType
        self.watchedStatus = configuration.watchedStatus
        self.rating = configuration.rating
        self.maybeWatched = configuration.maybeWatched
        self.defaultConfiguration = configuration
    }
    
    func validate() throws {
        let patern = #"(?i)^tt\d{7,8}$"#
        
        if imdbId?.range(of: patern, options: .regularExpression) == nil {
            throw AddViewErrors.invalidImdbId
        } else if imdbId == nil || imdbId!.isEmpty {
            throw AddViewErrors.missingImdbId
        } else if watchedName == nil || watchedName!.isEmpty {
            throw AddViewErrors.missingWathedName
        }
    }
    
    func save() {
        
        do {
            try validate()
            
            print("\(imdbId ?? "") \(watchedName ?? "") \(watchedType) \(watchedStatus) \(rating ?? 0) \(maybeWatched ?? false)")
        } catch {
            print("Kayıt edilemedi")
        }
    }
    
    
    func reset() {
        imdbId = ""
        watchedName = ""
        watchedType = defaultConfiguration.watchedType
        watchedStatus = defaultConfiguration.watchedStatus
        rating = defaultConfiguration.rating
        maybeWatched = defaultConfiguration.maybeWatched
        
    }
    
}


extension AddViewModel {
    enum AddViewErrors: Error {
        case missingImdbId
        case invalidImdbId
        case missingWathedName
    }
    
    
    // İstediğimiz yerel bölğeye göre faklı ayarlada başlatmamıza imkan sağlayacak bir yapı
    struct Configuration {
        let watchedType: WatchedType
        let watchedStatus: WatchedStatus
        let rating: Int
        let maybeWatched: Bool
    }
}
