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
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        }
    }
}
