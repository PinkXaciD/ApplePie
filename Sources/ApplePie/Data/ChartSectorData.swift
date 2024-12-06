//
//  ChartSectorData.swift
//
//
//  Created by PinkXaciD on R 5/10/26.
//

import SwiftUI

/// ApplePie chart sector data structure
public struct APChartSector<ID> where ID: Hashable {
    /// Chart sector initializer with value as `Double`
    /// - Parameters:
    ///   - value: Value of chart sector as `Double`.
    ///   - color: Color of chart sector fill as SwiftUI `Color`.
    ///   - id: Sector identifier.
    ///   - action: Action to perform on tap on the sector. 
    public init(
        _ value: Double,
        color: Color,
        id: ID = UUID(),
        action: ((inout ID?, ID) -> Void)? = nil
    ) {
        self.value = value
        self.color = color
        self.id = id
        
        self.startDegree = nil
        self.endDegree = nil
        self.number = nil
        
        self.action = action ?? { state, value in
            if state == value {
                state = nil
                return
            }
            
            state = value
        }
    }
        
    public let value: Double
    public let color: Color
    public let id: ID
    
    internal var startDegree, endDegree: Double?
    internal var number: Int?
    internal let action: (inout ID?, ID) -> Void
}

extension APChartSector: Identifiable {}

extension APChartSector: Equatable, Comparable {
    public static func < (lhs: Self, rhs: Self) -> Bool {
        return lhs.value < rhs.value
    }
    
    public static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.value == rhs.value
    }
}

extension APChartSector {
    internal mutating func setDegrees(startDegree: CGFloat, endDegree: CGFloat, number: Int) {
        self.startDegree = startDegree
        self.endDegree = endDegree
        self.number = number
    }
}
