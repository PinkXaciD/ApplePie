//
//  ClipShape.swift
//
//
//  Created by PinkXaciD on R 5/10/31.
//

import SwiftUI

struct APClipShape: Shape {
    let innerRadius: CGFloat
    
    func path(in rect: CGRect) -> Path {
        Path { p in
            let center = CGPoint(x: rect.midX, y: rect.midY)
            let size = rect.height > rect.width ? rect.width : rect.height
            
            p.addArc(
                center: center,
                radius: size / 4 * (innerRadius * 2),
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 360),
                clockwise: false
            )
            
            p.addArc(
                center: center,
                radius: size / 2.1,
                startAngle: Angle(degrees: 360),
                endAngle: Angle(degrees: 0),
                clockwise: true
            )
        }
    }
    
    init(innerRadius: CGFloat) {
        if innerRadius > 1 {
            self.innerRadius = 1
        } else if innerRadius < 0 {
            self.innerRadius = 0
        } else {
            self.innerRadius = innerRadius
        }
    }
}
