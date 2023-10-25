import SwiftUI

public struct ApplePie {
    
    public init() {}
    
    /// Generates pie chart
    /// - Parameter pcData: Data to generate pie chart
    /// - Returns: Pie chart view
    public func generatePie(_ pcData: ApplePieChartData) -> some View {
        return PieChart(pcData: pcData)
    }
    
    public func generateDonut(_ dcData: ApplePieChartData) -> some View {
        return PieChart(pcData: dcData)
    }
}

/// Chart data
public struct ApplePieChartData {
    
    /// Chart data default initializer
    /// - Parameters:
    ///   - piecesData: Array of ApplePieChartPieceData with color and percentage
    ///   - backgroundColor: Color of the background of the view, where chart is presented
    ///   - separators: Turn on/off separators between sections of pie/donut (turned off by default)
    ///   - size: Frame of generated chart in points
    public init(_ piecesData: [ApplePieChartPieceData], backgroundColor: Color, separators: Bool = false, donut: Bool, size: CGFloat) {
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
    
    /// Chart piece default initializer
    /// - Parameters:
    ///   - percent: Persentage of a sector in percents, where 100 is 100%
    ///   - color: Color of chart piece in SwiftUI Color
    public init(_ percent: Double, _ color: Color) {
        self.percent = percent
        self.color = color
    }
    
    let percent: Double
    let color: Color
}
