//
//  WatchedModel.swift
//  WhatDidIWatch
//
//  Created by Serdest PALAOĞLU on 8.08.2025.
//

import Foundation

enum WatchedType: Int, Codable {
    case movie = 0
    case series = 1
}

enum WatchedStatus: Int, Codable {
    case continiuous = 0
    case completed = 1
    case leaveWatched = 2
}

struct WatchedModel {
    var imdbID: String
    var name: String
    var type: WatchedType.RawValue
    var status: WatchedStatus.RawValue
    var rate: Int
    var maybeWatch: Bool
}
