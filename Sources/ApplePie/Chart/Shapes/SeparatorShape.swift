//
//  SeparatorShape.swift
//  ApplePie
//
//  Created by PinkXaciD on 2024/11/27.
//

import SwiftUI

struct Separator: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}
