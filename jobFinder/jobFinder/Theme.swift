//
//  Theme.swift
//  jobFinder
//
//  Created by Adrian on 9/14/24.
//

import Foundation
import SwiftUI

class Theme: ObservableObject {
    public let listJobTitle = TextStyle(fontName: "Avenir-Book", size: 20, lineHeight: 24, foregroundColor: Color.black)
    public let listCompanyName = TextStyle(fontName: "Avenir-Book", size: 18, lineHeight: 18, foregroundColor: Color.gray)
    public let listLocation = TextStyle(fontName: "Avenir-Book", size: 16, lineHeight: 18, foregroundColor: Color.gray)
}

struct TextStyle {
    let fontName: String
    let size: CGFloat
    let letterSpacing: CGFloat
    let lineHeight: CGFloat
    let foregroundColor: Color
    
    init(fontName: String, size: CGFloat, letterSpacing: CGFloat = 0, lineHeight: CGFloat, foregroundColor: Color = .black) {
        self.fontName = fontName
        self.size = size
        self.letterSpacing = letterSpacing
        self.lineHeight = lineHeight
        self.foregroundColor = foregroundColor
    }
}

struct TitleModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
    }
}
extension View {
    func textStyle(_ style: TextStyle) -> some View {
        let customFont = UIFont(name: style.fontName, size: style.size) ?? UIFont()
        return self
            .font(Font(customFont))
            .kerning(style.letterSpacing)
            .lineSpacing(style.lineHeight)
            .foregroundStyle(style.foregroundColor)
            .modifier(TitleModifier())
    }
}
