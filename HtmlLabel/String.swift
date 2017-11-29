//
//  String.swift
//  HtmlLabel
//
//  Created by SakuraiYoichiro on 2017/11/27.
//  Copyright © 2017年 Yoichiro Sakurai. All rights reserved.
//

import UIKit

extension String {
    func convertHtml(withFont: UIFont? = nil, align: NSTextAlignment = .left) -> NSAttributedString {
        if let data = self.data(using: .utf8, allowLossyConversion: true),
            let attributedText = try? NSAttributedString(
                data: data,
                options: [.documentType: NSAttributedString.DocumentType.html,
                          .characterEncoding: String.Encoding.utf8.rawValue],
                documentAttributes: nil
            ) {
            let style = NSMutableParagraphStyle()
            style.alignment = align

            let fullRange = NSRange(location: 0, length: attributedText.length)
            let mutableAttributeText = NSMutableAttributedString(attributedString: attributedText)

            if let font = withFont {
                mutableAttributeText.addAttribute(.paragraphStyle, value: style, range: fullRange)
                mutableAttributeText.enumerateAttribute(.font, in: fullRange, options: .longestEffectiveRangeNotRequired, using: { attribute, range, _ in
                    if let attributeFont = attribute as? UIFont {
                        let traits: UIFontDescriptorSymbolicTraits = attributeFont.fontDescriptor.symbolicTraits
                        var newDescripter = attributeFont.fontDescriptor.withFamily(font.familyName)
                        if (traits.rawValue & UIFontDescriptorSymbolicTraits.traitBold.rawValue) != 0 {
                            newDescripter = newDescripter.withSymbolicTraits(.traitBold)!
                        }
                        if (traits.rawValue & UIFontDescriptorSymbolicTraits.traitItalic.rawValue) != 0 {
                            newDescripter = newDescripter.withSymbolicTraits(.traitItalic)!
                        }
                        let scaledFont = UIFont(descriptor: newDescripter, size: attributeFont.pointSize)
                        mutableAttributeText.addAttribute(.font, value: scaledFont, range: range)
                    }
                })
            }

            return mutableAttributeText
        }

        return NSAttributedString()
    }
}
