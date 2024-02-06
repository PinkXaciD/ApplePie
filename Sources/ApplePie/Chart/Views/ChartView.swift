//
//  ChartView.swift
//  
//
//  Created by PinkXaciD on R 5/09/05.
//

import SwiftUI

internal struct APChartView: View {
    private let data: [APChartSectorData]
    private let separators, innerRadius: CGFloat
    private let animation: Animation
    private let animationType: APAppearanceEffect
    
    var body: some View {
        ZStack {
            if !data.isEmpty {
                ForEach(data) { piece in
                    if let startDegree = piece.startDegree,
                       let endDegree = piece.endDegree {
                        APChartSectorView(
                            startDegree: startDegree,
                            endDegree: endDegree,
                            piece: piece,
                            separators: separators,
                            animationType: animationType,
                            animation: animation
                        )
                    }
                }
            } else {
                APChartSectorView(
                    startDegree: 0,
                    endDegree: 360,
                    piece: .init(1, .secondary),
                    separators: 0,
                    animationType: animationType,
                    animation: animation
                )
            }
            
        }
        .rotationEffect(Angle(degrees: 270))
        .scaleEffect(2)
        .clipShape(APClipShape(innerRadius: innerRadius))
    }
}

extension APChartView {
    internal init(
        data: [APChartSectorData],
        separators: CGFloat,
        innerRadius: CGFloat,
        animationType: APAppearanceEffect,
        animation: Animation
    ) {
        var tempData: [APChartSectorData] = data
        let allData: Double = data.map { $0.value }.reduce(0, +)
        self.separators = separators
        self.animationType = animationType
        self.animation = animation
        self.innerRadius = innerRadius
        
        var previousDegree: Double = 0
        var currentDegree: Double = 0
        for index in 0..<tempData.count {
            previousDegree = currentDegree
            currentDegree += tempData[index].value / allData * 360
            tempData[index].startDegree = previousDegree
            tempData[index].endDegree = currentDegree
        }
        
        self.data = tempData
    }
    
    internal init(oldData: APChart, animationType: APAppearanceEffect, animation: Animation) {
        self.init(
            data: oldData.data,
            separators: oldData.separators,
            innerRadius: oldData.innerRadius,
            animationType: animationType,
            animation: animation
        )
    }
}
