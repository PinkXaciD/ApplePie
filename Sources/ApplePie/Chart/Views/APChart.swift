//
//  APChart.swift
//
//
//  Created by PinkXaciD on R 5/09/05.
//

import SwiftUI

/// A SwiftUI view that displays an ApplePie chart.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@MainActor
public struct APChart<Data, ID>: View where Data: RandomAccessCollection, ID: Hashable {
    private let data: Data
    private let content: (Data.Element) -> APChartSector<ID>
    private let separators, innerRadius: CGFloat
    private let animation: Animation?
    
    @Binding
    private var selection: ID?
    
    public var body: some View {
        APChartView(
            data: data,
            selection: $selection,
            content: content,
            separators: separators,
            innerRadius: innerRadius,
            animation: animation
        )
        .flipsForRightToLeftLayoutDirection(true)
    }
}

extension APChart {
    /// Creates an ApplePie chart
    /// - Parameters:
    ///   - data: A collection of data.
    ///   - selection: A binding to a property that determines the currently-selected option. 
    ///   - separators: Thickness of blank space between chart sections. It is recommended to use values less than 1, otherwise it may lead to unexpected results such as missing sectors.
    ///   - innerRadius: The radius of the inner circle of the chart relative to the chart size in a `CGFloat` value from 0 to 1, where 1 is a radius of entire chart.
    ///   - animation: Animation with which the content changes would be represented.
    ///   - content: A closure that converts provided data element to the ``APChartSector`` type.
    public init(
        _ data: Data,
        selection: Binding<ID?> = .constant(nil),
        separators: CGFloat = 0,
        innerRadius: CGFloat = 0,
        animation: Animation? = nil,
        content: @escaping (Data.Element) -> APChartSector<ID>
    ) {
        self.data = data
        self.content = content
        self.separators = separators
        self.innerRadius = innerRadius
        self.animation = animation
        self._selection = selection
    }
}
