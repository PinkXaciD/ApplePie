//
//  AppearanceEffect.swift
//
//
//  Created by PinkXaciD on R 5/10/27.
//

import Foundation

public enum APAppearanceEffect {
    case rotate
    case fillIn
    case none
}

extension APAppearanceEffect {
    var trimEnd: CGFloat {
        switch self {
        case .rotate, .fillIn:
            return 0
        default:
            return 1
        }
    }
}
