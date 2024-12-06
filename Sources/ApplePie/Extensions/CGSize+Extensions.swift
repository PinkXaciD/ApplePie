//
//  CGSize+Extensions.swift
//  ApplePie
//
//  Created by PinkXaciD on 2024/11/29.
//

import Foundation

internal extension CGSize {
    func getMinimalDimension() -> CGFloat {
        return min(self.width, self.height)
    }
}
