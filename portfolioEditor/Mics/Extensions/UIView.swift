//
//  UIView.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 25.08.2024.
//

import UIKit

extension UIView {
    var toImage:UIImage {
        print(frame.size, " gefrwed")
        let targetSize = frame.size//self.intrinsicContentSize
        self.bounds = CGRect(origin: .zero, size: targetSize)
        self.backgroundColor = .green
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
          //  layer.render(in: $0.cgContext)
        self.drawHierarchy(in: self.bounds, afterScreenUpdates: true)
        }
//        let renderer = UIGraphicsImageRenderer(size: bounds.size)
//        let image = renderer.image { (context) in
//            layer.render(in: context.cgContext)
//        }
//        print(#file, #line, image.size)
//        return image
    }
}
