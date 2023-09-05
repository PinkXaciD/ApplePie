//
//  PieChartPiece.swift
//
//
//  Created by PinkXaciD on R 5/09/04.
//

import SwiftUI

struct PieChartPiece: Shape {
    let startDegree: Double
    let endDegree: Double
    
    init(_ startDegree: Double, _ endDegree: Double) {
        self.startDegree = startDegree
        self.endDegree = endDegree
    }
    
    func path(in rect: CGRect) -> Path {
        Path { p in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            p.move(to: center)
            p.addArc(
                center: center,
                radius: rect.width / 2,
                startAngle: Angle(degrees: startDegree),
                endAngle: Angle(degrees: endDegree),
                clockwise: false
            )
            p.closeSubpath()
        }
    }
}

