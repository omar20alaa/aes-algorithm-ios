//
//  Item.swift
//  AES_Algorithm
//
//  Created by omar alaa eldin ahmed mohamed on 07/10/2026.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}
