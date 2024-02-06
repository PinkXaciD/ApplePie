//
//  APChart.swift
//
//
//  Created by PinkXaciD on R 5/09/05.
//

import SwiftUI

/// A SwiftUI view that displays an ApplePie chart.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, *)
public struct APChart: View {
    internal let data: [APChartSectorData]
    internal let height, width: CGFloat?
    internal let separators, innerRadius: CGFloat
    private let animationType: APAppearanceEffect
    private let animation: Animation
    
    public var body: some View {
        GeometryReader { geometry in
            let trueWidth: CGFloat = width ?? geometry.size.width
            let trueHeight: CGFloat = height ?? geometry.size.height
            
            APChartView(
                data: data,
                separators: separators,
                innerRadius: innerRadius,
                animationType: animationType,
                animation: animation
            )
            .frame(width: trueWidth, height: trueHeight)
        }
    }
}

extension APChart {
    /// Adds appearance animation to chart view
    /// - Parameters:
    ///   - effect: Effect with which chart will appear.
    ///   - animation: Animation with which the effect will be represented.
    /// - Returns: Chat view with appearance effect.
    public func appearanceEffect(effect: APAppearanceEffect, animation: Animation = .easeInOut) -> Self {
        APChart(
            data: self.data,
            height: self.height,
            width: self.width,
            separators: self.separators,
            innerRadius: self.innerRadius,
            animationType: effect,
            animation: animation
        )
    }
}

extension APChart {
    /// Creates an ApplePie chart with given array of data
    /// - Parameters:
    ///   - size: Frame dimensinons of the chart in CGSize. **Important:** since the chart is a circle, only the smallest frame value will determine the size of the chart itself.
    ///   - separators: Thickness of blank space between chart sections. It is recommended to use values less than 1, otherwise it may lead to unexpected results such as missing sectors.
    ///   - innerRadius: The radius of the inner circle of the chart relative to the chart size in a `CGFloat` value from 0 to 1, where 1 is a radius of entire chart.
    ///   - data: Array of ``APChartSectorData``.
    @available(*, deprecated, message: "Use init(separators:innerRadius:data:) with .frame() modifier instead")
    public init(
        size: CGSize,
        separators: CGFloat = 0,
        innerRadius: CGFloat = 0,
        data: [APChartSectorData]
    ) {
        self.data = data
        self.height = size.height
        self.width = size.width
        self.separators = separators
        self.innerRadius = innerRadius
        self.animationType = .none
        self.animation = .default
    }
    
    /// Creates an ApplePie chart with array of data from given closure
    /// - Parameters:
    ///   - size: Frame dimensinons of the chart in `CGSize`. **Important:** since the chart is a circle, only the smallest frame value will determine the size of the chart itself.
    ///   - separators: Thickness of blank space between chart sections. It is recommended to use values less than 1, otherwise it may lead to unexpected results such as missing sectors.
    ///   - innerRadius: The radius of the inner circle of the chart relative to the chart size in a `CGFloat` value from 0 to 1, where 1 is a radius of entire chart.
    ///   - data: Closure, that returns array of ``APChartSectorData``.
    @available(*, deprecated, message: "Use init(separators:innerRadius:data:) with .frame() modifier instead")
    public init(
        size: CGSize,
        separators: CGFloat = 0,
        innerRadius: CGFloat = 0,
        data: () -> [APChartSectorData]
    ) {
        self.data = data()
        self.height = size.height
        self.width = size.width
        self.separators = separators
        self.innerRadius = innerRadius
        self.animationType = .none
        self.animation = .default
    }
    
    /// Creates an ApplePie chart with given array of data
    /// - Parameters:
    ///   - separators: Thickness of blank space between chart sections. It is recommended to use values less than 1, otherwise it may lead to unexpected results such as missing sectors.
    ///   - innerRadius: The radius of the inner circle of the chart relative to the chart size in a `CGFloat` value from 0 to 1, where 1 is a radius of entire chart.
    ///   - data: Array of ``APChartSectorData``.
    public init(
        separators: CGFloat = 0,
        innerRadius: CGFloat = 0,
        data: [APChartSectorData]
    ) {
        self.data = data
        self.height = nil
        self.width = nil
        self.separators = separators
        self.innerRadius = innerRadius
        self.animationType = .none
        self.animation = .default
    }
    
    /// Creates an ApplePie chart with array of data from given closure
    /// - Parameters:
    ///   - separators: Thickness of blank space between chart sections. It is recommended to use values less than 1, otherwise it may lead to unexpected results such as missing sectors.
    ///   - innerRadius: The radius of the inner circle of the chart relative to the chart size in a `CGFloat` value from 0 to 1, where 1 is a radius of entire chart.
    ///   - data: Closure, that returns array of ``APChartSectorData``.
    public init(
        separators: CGFloat = 0,
        innerRadius: CGFloat = 0,
        data: () -> [APChartSectorData]
    ) {
        self.data = data()
        self.height = nil
        self.width = nil
        self.separators = separators
        self.innerRadius = innerRadius
        self.animationType = .none
        self.animation = .default
    }
}
