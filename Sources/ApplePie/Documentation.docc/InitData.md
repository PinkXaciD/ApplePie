# ``APChart/init(separators:innerRadius:data:)-35etn``

@Metadata {
    @DocumentationExtension(mergeBehavior: append)
}

## Overview

Creates a new chart with given parameters

### Example

Let's say you have a collection of bakeries and you want to show how many apple pies each of them has in stock.

```swift
struct Bakery {
    let name: String
    let pieCount: Int
    let color: Color
}

let bakeries: [Bakery] = [
    .init(name: "Bakery 1", pieCount: 3, color: Color.red),
    .init(name: "Bakery 2", pieCount: 1, color: .orange),
    .init(name: "Bakery 3", pieCount: 5, color: .yellow),
    .init(name: "Bakery 4", pieCount: 4, color: .green),
    .init(name: "Bakery 5", pieCount: 2, color: .blue)
]
```

To show this info as a ``APChart`` you first need to create an `Array` of ``APChartSectorData``

```swift
var chartData: [APChartSectorData] = bakeries.map {
    APChartSectorData($0.pieCount, $0.color) 
}
```

Then you can pass your variable to initializer

```swift
APChart(data: chartData)
```

Alternatively, you can do the conversions inside of the initializer with ``APChart/init(separators:innerRadius:data:)-16qxq``

## Topics
