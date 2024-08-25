//
//  UIFont.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 25.08.2024.
//

import UIKit

extension UIFont {
//    func calculate(inWindth:CGFloat? = nil, attributedString:NSAttributedString) -> CGSize {
//        calculate(inWindth:inWindth, attributes:attributedString.attributedSubstring(from: 0..<attributedString.length), string:attributedString.string)
//
//    }
//    
    func calculate(inWindth:CGFloat? = nil, attributes:[NSAttributedString.Key: Any]? = nil, string:String) -> CGSize {
        let fontSize = self.pointSize// ?? UIFont.systemFont(ofSize: 16)
        let defaultWidth = UIApplication.shared.keyWindow?.frame.width ?? 100
            //.sceneKeyWindow?.frame.width ?? 100
        var textAttributes: [NSAttributedString.Key: Any] = [.font: fontSize]
        attributes?.forEach({
            textAttributes.updateValue($0.value, forKey: $0.key)
        })
        let attributedText = NSAttributedString(string: string, attributes: textAttributes)
print(attributedText, " calculatecalculatecalculatecalculate")
        print(inWindth ?? defaultWidth, " wefdsa")
//crash
        let boundingRect = attributedText.boundingRect(with: CGSize(width: inWindth ?? defaultWidth, height: CGFloat.greatestFiniteMagnitude), options: .usesLineFragmentOrigin, context: nil)

        return CGSize(width: ceil(boundingRect.size.width), height: ceil(boundingRect.size.height))

    }

}
