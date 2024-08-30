//
//  UIView.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 25.08.2024.
//

import UIKit

extension UIView {
    var toImage:UIImage {
        let targetSize = frame.size
        self.bounds = CGRect(origin: .zero, size: targetSize)
        let format = UIGraphicsImageRendererFormat.default()
        format.scale = 2
        format.opaque = true
        let renderer = UIGraphicsImageRenderer(size: targetSize, format: format)
        return renderer.image { _ in
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        }
    }
}
