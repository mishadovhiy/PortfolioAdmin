//
//  PDFUnparceModel.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 24.08.2024.
//

import Foundation
import UIKit
import SwiftUICore
import SwiftUI

extension PDFModel {
    class PDFUnparceModel {
        let input:PDFInput
        var results:PDFModel.PDFOutput {
            createResults
        }
        private var resultHeight:CGFloat = 0
        init(input: PDFInput) {
            self.input = input
        }
        
        var pageWidth:CGFloat = {
            PDFModel.pageWidth
        }()
        
        private var createResults:PDFOutput {
            let items = resultItems
            return .init(items: items, height: resultHeight)
        }
    }
}

fileprivate extension PDFModel.PDFUnparceModel {
    var resultItems: [PDFPreviewItem] {
        return [
            .init(contentString: body)
        ]
    }
    
    var body: NSAttributedString {
        if input.dictionary.isEmpty {
            return .init(string: "")
        }
        var str = NSMutableAttributedString(.init())
        str.append(skills)
        resultHeight += 900
        return str
    }
    
    var skills:NSAttributedString {
        let text = """
                .init(width: input.pageWidth, height: 900))
        page.view.backgroundColor = .blue.withAlphaComponent(0.1)
        let attachment = NSTextAttachment(image: page.view.toImage)
        attachment.bounds = .init(origin: .zero, size: page.view.frame.size)
        return .init(attachment: attachment)
"""
        let size:CGFloat = 100
        let attributedString = NSAttributedString(string: text, attributes: [:])
            
            let framesetter = CTFramesetterCreateWithAttributedString(attributedString)
            let suggestedSize = CTFramesetterSuggestFrameSizeWithConstraints(framesetter, CFRange(), nil, CGSize(width: size, height: .greatestFiniteMagnitude), nil)
            
        let targetSize = CGSize(width: size, height: .greatestFiniteMagnitude)
            let path = UIBezierPath(rect: CGRect(origin: .zero, size: targetSize))
            let frame = CTFramesetterCreateFrame(framesetter, CFRange(), path.cgPath, nil)
            
            let mutableAttributedString = NSMutableAttributedString(attributedString: attributedString)
            let lines = CTFrameGetLines(frame) as NSArray
            let lineCount = lines.count
            
            if lineCount > 0 {
                var origins = [CGPoint](repeating: .zero, count: lineCount)
                CTFrameGetLineOrigins(frame, CFRange(), &origins)
                
                for index in 0..<lineCount {
                    let line = lines[index] as! CTLine
                    let lineRange = CTLineGetStringRange(line)
                    
                    let lineOffset = origins[index].y
                    let lineBounds = CTLineGetImageBounds(line, nil)
                    
                    if (lineBounds.origin.x + lineBounds.width) > size {
                        guard let truncatedLine = CTLineCreateTruncatedLine(line, Double(size), .end, nil) else {
                            return .init()
                        }
                        let truncatedLineRange = CTLineGetStringRange(truncatedLine)
                        
                        if truncatedLineRange.length < lineRange.length {
                            let substringRange = NSRange(location: lineRange.location, length: truncatedLineRange.length)
                            mutableAttributedString.replaceCharacters(in: substringRange, with: "...")
                        }
                    }
                }
            }
            
            return NSAttributedString(attributedString: mutableAttributedString)
        
    }
    
}
