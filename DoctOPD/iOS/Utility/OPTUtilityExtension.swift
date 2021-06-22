//
//  OPTUtilityExtension.swift
//  Optimus-ios
//
//  Created by SIDDHARTH MURUGAIYAN on 10/07/20.
//  Copyright © 2020 Tata Communications Ltd. All rights reserved.
//

import Foundation
import UIKit

extension Encodable {
  var dictionary: [String: Any]? {
    guard let data = try? JSONEncoder().encode(self) else { return nil }
    return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
  }
}
extension UILabel {
    func changeTextColor (fullText: String, changeText: String ) {
        let strNumber: NSString = fullText as NSString
        let range = (strNumber).range(of: changeText)
        let attribute = NSMutableAttributedString(string: fullText)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor(displayP3Red: 234.0 / 255.0, green: 121.0 / 255.0, blue: 38.0 / 255.0, alpha: 1.0), range: range)
        self.attributedText = attribute
    }
    func changeTextColorAndFontSize (originaltext: String, fontChangeTxt: String, colorChangeTxt: String ) {
        let fullStr: NSString = originaltext as NSString
        let range = (fullStr).range(of: fontChangeTxt)
        let colRange = (fullStr).range(of: colorChangeTxt)
        let attribute = NSMutableAttributedString(string: originaltext)
        attribute.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.lightGray, range: range)
        attribute.addAttribute(.font, value: UIFont(name: APPConstants.Font.GOTHAM_BOOK, size: 15.0) ?? UIFont(), range: range)
        attribute.addAttribute(.foregroundColor, value: UIColor(displayP3Red: 234.0 / 255.0, green: 121.0 / 255.0, blue: 38.0 / 255.0, alpha: 1.0), range: colRange)
        self.attributedText = attribute
    }
}
extension UITextView {
    func hyperLink(originalText: String, hyperLink: String, urlString: String) {
        let style = NSMutableParagraphStyle()
        style.alignment = .left
        let attributedOriginalText = NSMutableAttributedString(string: originalText)
        let linkRange = attributedOriginalText.mutableString.range(of: hyperLink)
        let fullRange = NSMakeRange(0, attributedOriginalText.length)
        attributedOriginalText.addAttribute(NSAttributedString.Key.link, value: urlString, range: linkRange)
        attributedOriginalText.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: fullRange)
        attributedOriginalText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.gray, range: fullRange)
        attributedOriginalText.addAttribute(NSAttributedString.Key.foregroundColor, value: UIColor.blue, range: linkRange)
        attributedOriginalText.addAttribute(NSAttributedString.Key.font, value: UIFont(name: APPConstants.Font.GOTHAM_BOOK, size: 15.0) ?? UIFont(), range: fullRange)
        //self.linkTextAttributes = [kCTForegroundColorAttributeName: UIColor.blue] as [NSAttributedString.Key: Any]
        self.attributedText = attributedOriginalText
    }
}
extension String {
    var appendBrackets: String {
        if !self.isEmpty {
            return " " + APPConstants.UploadMandatoryDocs.OPEN_BRACKET + self + APPConstants.UploadMandatoryDocs.CLOSED_BRACKET
        }
        return self
    }
    var htmlToAttributedString: NSAttributedString? {
            guard let data = data(using: .utf8) else { return nil }
            do {
                return try NSAttributedString(data: data, options: [.documentType: NSAttributedString.DocumentType.html, .characterEncoding:String.Encoding.utf8.rawValue], documentAttributes: nil)
            } catch {
                return nil
            }
        }
        var htmlToString: String {
            return htmlToAttributedString?.string ?? ""
        }
}
extension UINavigationItem {
    func setTitle(_ title: String, subtitle: String) {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: -2, width: 0, height: 0))
        titleLabel.backgroundColor = .clear
        titleLabel.textColor = .white
        titleLabel.font = UIFont(name: APPConstants.Font.GOTHAM_MEDIUM, size: 16.0)//.preferredFont(forTextStyle: UIFont.TextStyle.headline)
        titleLabel.text = title
        titleLabel.sizeToFit()
        let subtitleLabel = UILabel(frame: CGRect(x: 0, y: 18, width: 0, height: 0))
        subtitleLabel.backgroundColor = .clear
        subtitleLabel.textColor = .white
        subtitleLabel.font = UIFont(name: APPConstants.Font.GOTHAM_BOOK, size: 15.0)//.preferredFont(forTextStyle: UIFont.TextStyle.subheadline)
        subtitleLabel.text = subtitle
        subtitleLabel.sizeToFit()
        let titleView = UIView(frame: CGRect(x: 0, y: 0, width: max(titleLabel.frame.size.width, subtitleLabel.frame.size.width), height: 30))
        titleView.addSubview(titleLabel)
        titleView.addSubview(subtitleLabel)
        let widthDiff = subtitleLabel.frame.size.width - titleLabel.frame.size.width
        if widthDiff < 0 {
            let newX = widthDiff / 2
            subtitleLabel.frame.origin.x = abs(newX)
        } else {
            let newX = widthDiff / 2
            titleLabel.frame.origin.x = newX
        }
        self.titleView = titleView
    }
}
extension Array {
    func removingDuplicates<T: Hashable>(byKey key: (Element) -> T) -> [Element] {
        var result = [Element]()
        var seen = Set<T>()
        for value in self {
            if seen.insert(key(value)).inserted {
                result.append(value)
            }
        }
        return result
    }
}
class SelfSizedTableView: UITableView {
    var maxHeight: CGFloat = UIScreen.main.bounds.size.height
    override func reloadData() {
        super.reloadData()
        self.invalidateIntrinsicContentSize()
        self.layoutIfNeeded()
    }
    override var intrinsicContentSize: CGSize {
        let height = min(contentSize.height, maxHeight)
        return CGSize(width: contentSize.width, height: height)
    }
}

