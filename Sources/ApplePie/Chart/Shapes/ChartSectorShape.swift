//
//  ChartSectorShape.swift
//
//
//  Created by PinkXaciD on R 5/10/27.
//

import SwiftUI

struct APChartSectorShape: Shape {
    var degree: Double
    var animatableData: Double {
        get { degree }
        set { degree = newValue }
    }
    
    init(_ degree: Double) {
        self.degree = degree
        self.animatableData = degree
    }
    
    func path(in rect: CGRect) -> Path {
        Path { p in
            p.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.width / 4,
                startAngle: Angle(degrees: -90),
                endAngle: Angle(degrees: animatableData - 90),
                clockwise: false
            )
        }
    }
}

extension APChartSectorShape {
    static let full: APChartSectorShape = APChartSectorShape(360)
}
