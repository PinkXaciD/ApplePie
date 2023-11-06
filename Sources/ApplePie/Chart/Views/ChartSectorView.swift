//
//  ChartSectorView.swift
//
//
//  Created by PinkXaciD on R 5/10/27.
//

import SwiftUI

internal struct APChartSectorView: View {
    private let startDegree, endDegree: Double
    private let piece: APChartSectorData
    private let separators: CGFloat
    private let animationType: APAppearanceEffect
    private let animation: Animation
    
    @State
    private var trimEnd: CGFloat
    @State
    private var rotate: CGFloat
    @State
    private var animate: Bool = false
    
    var body: some View {
        GeometryReader { geometry in
            let newPiece = APChartSectorShape(startDegree, endDegree, separators: separators)
            let width: CGFloat = geometry.size.width
            
            newPiece
                .trim(from: 0.0, to: trimEnd)
                .rotation(Angle(degrees: rotate))
                .stroke(piece.color, style: StrokeStyle(lineWidth: width / 2))
                .animation(animation, value: animate)
                .onAppear {
                    animate = true
                    trimEnd = 1
                    rotate = 0
                }
        }
    }
    
    init(startDegree: Double, endDegree: Double, piece: APChartSectorData, separators: CGFloat, animationType: APAppearanceEffect, animation: Animation) {
        
        self.startDegree = startDegree
        self.endDegree = endDegree
        self.piece = piece
        self.animationType = animationType
        self.animation = animation
        self.trimEnd = animationType.trimEnd
        self.separators = separators
        
        switch animationType {
        case .rotate:
            self.rotate = -startDegree
        default:
            self.rotate = 0
        }
    }
}
