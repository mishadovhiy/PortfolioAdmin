//
//  ActivityView.swift
//  portfolioEditor
//
//  Created by Misha Dovhiy on 26.08.2024.
//

import SwiftUI
import UIKit

struct ActivityView: UIViewControllerRepresentable {
    var activityItems: [Any]
    var applicationActivities: [UIActivity]? = nil
    var shared:((_ type:UIActivity.ActivityType?)->())?
    var sourceRect:CGRect? = nil
    
    func makeUIViewController(context: Context) -> UIActivityViewController {
        guard let applicationActivities else {
            return .init(activityItems: activityItems, applicationActivities: applicationActivities)
        }
        let vc = UIActivityViewController(activityItems: applicationActivities, applicationActivities: applicationActivities)
        if let sourceRect {
            vc.popoverPresentationController?.sourceRect = sourceRect
        }
        vc.overrideUserInterfaceStyle = .dark
        vc.completionWithItemsHandler = { type, ok, items, error in
            shared?(type)
        }
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIActivityViewController, context: Context) {
    }
}