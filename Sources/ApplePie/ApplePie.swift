import SwiftUI

public struct ApplePie {
    
    public init() {}
            
    public func generatePie(_ pcData: ApplePieChartData) -> some View {
        return PieChart(pcData: pcData)
    }
}

public struct ApplePieChartData {
    
    public init(_ piecesData: [ApplePieChartPieceData], backgroundColor: Color, separators: Bool, donut: Bool, size: CGFloat) {
        self.piePieceData = piecesData
        self.backgroundColor = backgroundColor
        self.separators = separators
        self.donut = donut
        self.size = size
    }
    
    let piePieceData: [ApplePieChartPieceData]
    let backgroundColor: Color
    let separators: Bool
    let donut: Bool
    let size: CGFloat
}

public struct ApplePieChartPieceData {
    
    public init(_ percent: Double, _ color: Color) {
        self.percent = percent
        self.color = color
    }
    
    let percent: Double
    let color: Color
}
