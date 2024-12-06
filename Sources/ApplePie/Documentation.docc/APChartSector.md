#  ``APChartSector``

### Custom actions

You can provide an action which will be executed when user taps or presses on the sector. By default it will assign the sector's ID to the selection parameter and set selection value to `nil` when user interacts with it again.

If you want to customize this behvior you need to provide a closure that will be executed on interaction. This closure acccepts two parameters: your mutable selection variable, which you need to provide in ``APChart`` and sector's ID.

```swift
@State private var selectedBakery: String? = nil

APChart(bakeries, selection: $selectedBakery) { bakery in
    APChartSector(bakery.pieCount, bakery.color) { selection, sectorID in
        if sectorID == "Bakery 1" {
            // Do custom logic
        }
    
        if selection == sectorID {
            selection = nil 
            return
        }

        selection = sectorID
    }
}
```

- Important: This closure will be executed on main thread.
