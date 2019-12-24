//
//  UIFont+Extensions.swift
//  TasksManagerApp
//
//  Created by Mikhail Semerikov on 15.12.2019.
//  Copyright © 2019 Mikhail Semerikov. All rights reserved.
//

import UIKit

extension UIFont {
    class func systemFontOfSize(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Roboto-Regular", size: size) else {
            fatalError("""
                Failed to load the "Roboto-Regular" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return customFont
    }
    
    class func italicSystemFontOfSize(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Roboto-Italic", size: size) else {
            fatalError("""
                Failed to load the "Roboto-Italic" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return customFont
    }
    
    class func boldSystemFontOfSize(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Roboto-Bold", size: size) else {
            fatalError("""
                Failed to load the "Roboto-Bold" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return customFont
    }
    
    class func mediumSystemFontOfSize(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Roboto-Medium", size: size) else {
            fatalError("""
                Failed to load the "Roboto-Medium" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return customFont
    }
    
    class func lightSystemFontOfSize(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Roboto-Light", size: size) else {
            fatalError("""
                Failed to load the "Roboto-Light" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return customFont
    }
    
    class func thinSystemFontOfSize(size: CGFloat) -> UIFont {
        guard let customFont = UIFont(name: "Roboto-Thin", size: size) else {
            fatalError("""
                Failed to load the "Roboto-Thin" font.
                Make sure the font file is included in the project and the font name is spelled correctly.
                """
            )
        }
        return customFont
    }
    
}
