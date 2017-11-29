//
//  ViewController.swift
//  HtmlLabel
//
//  Created by SakuraiYoichiro on 2017/11/27.
//  Copyright © 2017年 Yoichiro Sakurai. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet private var normalLabel: UILabel!
    @IBOutlet private var attributedLabel: UILabel!
    @IBOutlet private var nonCustomHtmlLabel: UILabel!
    @IBOutlet private var customHtmlLabel: UILabel!

    @IBOutlet private var centerNormalLabel: UILabel!
    @IBOutlet private var centerAttributedLabel: UILabel!
    @IBOutlet private var noCenterHtmlLabel: UILabel!
    @IBOutlet private var centerHtmlLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        [
            self.normalLabel,
            self.attributedLabel,
            self.nonCustomHtmlLabel,
            self.customHtmlLabel,
            self.centerNormalLabel,
            self.centerAttributedLabel,
            self.noCenterHtmlLabel,
            self.centerHtmlLabel
            ].forEach { $0?.numberOfLines = 0 }

        // left align label.
        self.normalLabel.text = "sample\nLabelString"
        let mutableAttributedString = NSMutableAttributedString()
        mutableAttributedString.append(NSAttributedString(string: "sample\n"))
        mutableAttributedString.append(NSAttributedString(string: "Label", attributes: [
            .font: UIFont.boldSystemFont(ofSize: self.attributedLabel.font.pointSize),
            .foregroundColor: UIColor.red]))
        mutableAttributedString.append(NSAttributedString(string: "String", attributes: [
            .font: UIFont.italicSystemFont(ofSize: self.attributedLabel.font.pointSize)
            ]))
        self.attributedLabel.attributedText = mutableAttributedString

        self.nonCustomHtmlLabel.attributedText = "sample<br/><span style='font-weight: bold; color:red;'>Label</span><span style='font-style: italic;'>String</>".convertHtml()
        self.customHtmlLabel.attributedText = "<span style='font-size: 17px;'>sample<br/><span style='font-weight: bold; color:red;'>Label</span><span style='font-style: italic;'>String</span></span>".convertHtml(withFont: self.customHtmlLabel.font)

        // center align label
        self.centerHtmlLabel.text = "sample\nLabelString"
        let centerMutableAttributedString = NSMutableAttributedString()
        centerMutableAttributedString.append(NSAttributedString(string: "sample\n"))
        centerMutableAttributedString.append(NSAttributedString(string: "Label", attributes: [
            .font: UIFont.boldSystemFont(ofSize: self.attributedLabel.font.pointSize),
            .foregroundColor: UIColor.red]))
        centerMutableAttributedString.append(NSAttributedString(string: "String", attributes: [
            .font: UIFont.italicSystemFont(ofSize: self.attributedLabel.font.pointSize)
            ]))
        self.centerAttributedLabel.attributedText = centerMutableAttributedString

        self.noCenterHtmlLabel.attributedText = "<span style='font-size: 17px;'>sample<br/><span style='font-weight: bold; color:red;'>Label</span><span style='font-style: italic;'>String</span></span>".convertHtml(withFont: self.centerHtmlLabel.font)
        self.centerHtmlLabel.attributedText = "<span style='font-size: 17px;'>sample<br/><span style='font-weight: bold; color:red;'>Label</span><span style='font-style: italic;'>String</span></span>".convertHtml(withFont: self.centerHtmlLabel.font, align: .center)
    }
}
