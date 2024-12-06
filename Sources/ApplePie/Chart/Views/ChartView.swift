//
//  ChartView.swift
//  
//
//  Created by PinkXaciD on R 5/09/05.
//

import SwiftUI

internal struct APChartView<Data, ID>: View where Data: RandomAccessCollection, ID: Hashable {
    private let data: [APChartSector<ID>]
    private let sum: Double
    private let separators, innerRadius, unselectedScale: CGFloat
    private let animation: Animation?
    
    @Binding
    private var selection: ID?
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                ForEach(data) { sector in
                    getSector(sector: sector, size: geometry.size.getMinimalDimension())
                }
                
                if data.count > 1, separators != 0 {
                    ForEach(data) { sector in
                        getSeparator(sector: sector, size: geometry.size.getMinimalDimension())
                    }
                }
                
                if data.isEmpty {
                    getFullSector(size: geometry.size.getMinimalDimension())
                }
            }
            .scaledToFit()
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .compositingGroup()
            .clipShape(APClipShape(innerRadius: innerRadius))
            .animation(animation, value: selection)
            .animation(animation, value: data)
        }
    }
    
    private func getSector(sector: APChartSector<ID>, size: CGFloat) -> some View {
        Button {
            sector.action(&selection, sector.id)
        } label: {
            getSectorLabel(sector: sector, size: size)
        }
        .buttonStyle(ChartSectorButtonStyle())
        .transition(getSectorTransition())
        .zIndex(-Double(sector.number ?? 0))
        .rotationEffect(.degrees(sector.startDegree ?? 0))
    }
    
    private func getSectorLabel(sector: APChartSector<ID>, size: CGFloat) -> some View {
        APChartSectorShape(sector.value / sum * 360)
            .stroke(style: getSectorStrokeStyle(size: size))
            .fill(sector.color)
            .scaleEffect((selection == sector.id || selection == nil) ? 1 : unselectedScale)
    }
    
    private func getSeparator(sector: APChartSector<ID>, size: CGFloat) -> some View {
        Separator()
            .stroke(style: getSeparatorStrokeStyle(size: size))
            .fill(.black)
            .blendMode(.destinationOut)
            .id(sector.id)
            .transition(getSeparatorTransition(sector: sector))
    }
    
    private func getFullSector(size: CGFloat) -> some View {
        APChartSectorShape.full
            .stroke(style: StrokeStyle(lineWidth: size / 2))
            .fill(Color.secondary)
            .transition(.scale(scale: unselectedScale).combined(with: .opacity).animation(animation))
            .zIndex(Double(data.count * 2))
    }
    
    private func getSectorTransition() -> AnyTransition {
        .scale(scale: unselectedScale)
        .combined(with: .opacity)
        .animation(animation)
    }
    
    private func getSeparatorTransition(sector: APChartSector<ID>) -> AnyTransition {
        .rotateWithOpacity(
            from: sector.startDegree == 0 ? 0 : sector.endDegree ?? 0,
            to: sector.startDegree ?? 0
        )
        .animation(animation)
    }
    
    private func getSectorStrokeStyle(size: CGFloat) -> StrokeStyle {
        StrokeStyle(lineWidth: size / 2)
    }
    
    private func getSeparatorStrokeStyle(size: CGFloat) -> StrokeStyle {
        StrokeStyle(lineWidth: size * separators * 0.05, lineCap: .round)
    }
    
    private func countSectorZIndex(sectorNumber: Int?) -> Double {
        if sectorNumber == 0 {
            return Double(data.count)
        }
        
        return Double(data.count - (sectorNumber ?? 0))
    }
}

extension APChartView {
    internal init(
        data: Data,
        selection: Binding<ID?>,
        content: (Data.Element) -> APChartSector<ID>,
        separators: CGFloat,
        innerRadius: CGFloat,
        animation: Animation?
    ) {
        var tempData = [APChartSector<ID>]()
        tempData.reserveCapacity(data.count)
        var allData = Double()
        
        for datum in data {
            let sector = content(datum)
            if sector.value != 0 {
                allData += sector.value
                tempData.append(sector)
            }
        }
        
        var previousDegree: Double = 0
        var currentDegree: Double = 0
        for index in 0..<tempData.count {
            previousDegree = currentDegree
            currentDegree += tempData[index].value / allData * 360
            tempData[index].setDegrees(startDegree: previousDegree, endDegree: currentDegree, number: index)
        }
        
        self.data = tempData
        
        if separators > 1 {
            self.separators = 1
        } else if separators < 0 {
            self.separators = 0
        } else {
            self.separators = separators
        }
        
        var trueInnerRadius: CGFloat {
            if innerRadius > 1 {
                return 1
            } else if innerRadius < 0 {
                return 0
            } else {
                return innerRadius
            }
        }
        
        self.innerRadius = trueInnerRadius
        self._selection = selection
        self.sum = allData
        self.animation = animation
        self.unselectedScale = trueInnerRadius + ((1 - trueInnerRadius) * 0.8)
    }
}
