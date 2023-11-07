//
//  ChartSectorData.swift
//
//
//  Created by PinkXaciD on R 5/10/26.
//

import SwiftUI

/// ApplePie chart sector data structure
public struct APChartSectorData: Hashable, Identifiable {
    /// Chart sector initializer with value as `Double`
    /// - Parameters:
    ///   - value: Value of chart sector as `Double`
    ///   - color: Color of chart sector fill as SwiftUI `Color`
    ///   - id: Sector identifier
    public init(_ value: Double, _ color: Color, id: UUID? = nil) {
        self.value = value
        self.color = color
        if let id = id {
            self.id = id.uuidString
        } else {
            self.id = UUID().uuidString
        }
        self.startDegree = nil
        self.endDegree = nil
    }
        
    public let value: Double
    public let color: Color
    public let id: String
    internal var startDegree, endDegree: Double?
}

extension APChartSectorData: Equatable, Comparable {
    public static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.value < rhs.value
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.value == rhs.value
    }
}
