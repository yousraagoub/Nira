//
//  Item.swift
//  Nira
//
//  Created by Yousra Abdelrahman on 05/06/1447 AH.
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
