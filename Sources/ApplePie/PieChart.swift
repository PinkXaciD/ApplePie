//
//  PieChart.swift
//  
//
//  Created by PinkXaciD on R 5/09/05.
//

import SwiftUI

struct PieChart: View {
    
    let colors: [Color]
    let percents: [Double]
    let ifSeparators: Bool
    let isDonut: Bool
    let bgColor: Color
    let pieceCount: Int
    let size: CGFloat
    
    init(pcData: ApplePieChartData) {
        let sorted = pcData.piePieceData.sorted { $0.percent > $1.percent }
        self.colors = sorted.map { $0.color }
        self.percents = sorted.map { $0.percent }
        self.ifSeparators = pcData.separators
        self.isDonut = pcData.donut
        self.bgColor = pcData.backgroundColor
        self.pieceCount = pcData.piePieceData.count
        self.size = pcData.size
    }
    
    @State var scaleAnimation = 0.75
    
    var body: some View {
        
        var degrees: [(Double, Double)] {
            var degrees: [(Double, Double)] = []
            var previousDegree: Double = 0
            var currentDegree: Double = 0
            for percent in percents {
                previousDegree = currentDegree
                currentDegree += percent/100*360
                degrees.append((previousDegree, currentDegree))
            }
            return degrees
        }

        GeometryReader { geometry in
            let width = geometry.size.width
            let height = geometry.size.height
            
            ZStack {
                ForEach(0..<pieceCount, id: \.self) { index in
                    let startDegree = degrees[index].0
                    let endDegree = degrees[index].1
                    let piece = PieChartPiece(startDegree, endDegree)
                    
                    ZStack {
                        piece
                            .stroke(style: StrokeStyle(lineWidth: 4))
                            .fill(ifSeparators ? bgColor : Color.clear)
                            .background(
                                piece
                                    .fill(colors[index])
                            )
                            
                    }
                    .frame(width: width, height: height)
                    .scaleEffect(scaleAnimation)
                }
                .rotationEffect(Angle(degrees: 270))
                
                if isDonut {
                    Circle()
                        .frame(width: width/1.4) // Size to set
                        .foregroundColor(bgColor) // to extract
                }
            }
        } // End of GR
        .frame(width: size, height: size)
        .onAppear(perform: appearActions)
    }
    
    func appearActions() {
        withAnimation(.easeOut(duration: 0.15)) {
            scaleAnimation = 1
        }
    }
}

