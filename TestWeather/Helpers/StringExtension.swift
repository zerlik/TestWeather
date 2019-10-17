//
//  StringExtension.swift
//  TestWeather
//
//  Created by andy.zemlianski on 10/17/19.
//  Copyright © 2019 Home. All rights reserved.
//

import Foundation
import UIKit

public extension String {
   
    func makeAttributedString(font type: UIFont) -> NSMutableAttributedString {
        var attrType: [NSAttributedString.Key: Any]!
        attrType = [NSAttributedString.Key.font: type] as [NSAttributedString.Key: Any]
        return NSMutableAttributedString(string: "\(self)", attributes: attrType)
    }
    
    func localized(withComment comment: String = "") -> String {
        return NSLocalizedString(self, tableName: "Localization", bundle: BundleHelper.bundle() ?? Bundle(), value: "", comment: comment)
    }
    
    func trim() -> String {
        return self.trimmingCharacters(in: .whitespacesAndNewlines)
    }
    
    func widthOfString(usingFont font: UIFont) -> CGFloat {
        let fontAttributes = [NSAttributedString.Key.font: font]
        let size = self.size(withAttributes: fontAttributes)
        return size.width
    }
}

