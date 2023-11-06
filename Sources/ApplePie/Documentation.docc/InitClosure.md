# ``APChart/init(size:separators:innerRadius:data:)-7vg13``

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
    .init(name: "Bakery 1", pieCount: 3, color: .red),
    .init(name: "Bakery 2", pieCount: 1, color: .orange),
    .init(name: "Bakery 3", pieCount: 5, color: .yellow),
    .init(name: "Bakery 4", pieCount: 4, color: .green),
    .init(name: "Bakery 5", pieCount: 2, color: .blue)
]
```

Now you can map your data inside an initializer

```swift
APChart(size: CGSize(height: 300, width: 300)) {
    bakeries.map { APChartSectorData($0.pieCount, $0.color }
}
```

Alternatively, you can do the conversions outside of the initializer with ``APChart/init(size:separators:innerRadius:data:)-8xqn7``

## Topics
