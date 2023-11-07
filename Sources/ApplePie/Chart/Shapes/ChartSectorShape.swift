//
//  ChartSectorShape.swift
//
//
//  Created by PinkXaciD on R 5/10/27.
//

import SwiftUI

struct APChartSectorShape: Shape {
    let startDegree, endDegree: Double
    let separators: CGFloat
    
    init(_ startDegree: Double, _ endDegree: Double, separators: CGFloat) {
        self.startDegree = startDegree
        self.endDegree = endDegree
        self.separators = separators
    }
    
    func path(in rect: CGRect) -> Path {
        Path { p in
            var centerRadius: CGFloat = 0
            
            var arcCenter: CGPoint {
                var x: CGFloat = rect.midX
                var y: CGFloat = rect.midY
                
                let angle = endDegree - startDegree
                
                var countAngle: Double {
                    if angle < 180 {
                        return angle
                    } else if angle == 360 {
                        return 1
                    } else {
                        return 360-angle
                    }
                }
                
                var size: CGFloat {
                    if rect.height > rect.width {
                        return rect.width/100
                    } else {
                        return rect.height/100
                    }
                }
                
                let degree = startDegree + (endDegree - startDegree) / 2
                centerRadius = angle != 360 ? (separators * size) * (360 / countAngle) : 0
                
                switch degree {
                case 0..<90:
                    x += (centerRadius * cos(degree * Double.pi / 180))
                    y += (centerRadius * sin(degree * Double.pi / 180))
                case 90..<180:
                    x -= (centerRadius * sin((degree - 90) * Double.pi / 180))
                    y += (centerRadius * cos((degree - 90) * Double.pi / 180))
                case 180..<270:
                    x -= (centerRadius * cos((degree - 180) * Double.pi / 180))
                    y -= (centerRadius * sin((degree - 180) * Double.pi / 180))
                case 270..<360:
                    x += (centerRadius * sin((degree - 270) * Double.pi / 180))
                    y -= (centerRadius * cos((degree - 270) * Double.pi / 180))
                default:
                    x += 0
                    y += 0
                }
                
                return CGPoint(x: x, y: y)
            }
            
            p.addArc(
                center: arcCenter,
                radius: rect.width / 4,
                startAngle: Angle(degrees: startDegree),
                endAngle: Angle(degrees: endDegree),
                clockwise: false
            )
        }
    }
}
