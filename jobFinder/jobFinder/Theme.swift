//
//  Theme.swift
//  jobFinder
//
//  Created by Adrian on 9/14/24.
//

import Foundation
import SwiftUI

class Theme: ObservableObject {
    public let backgroundColor = Color(red: 0.86, green: 0.92, blue: 0.92)
    public let backgroundComplement = Color(red: 0.99, green: 0.94, blue: 0.94)
    public let foregroundColor = Color(red: 0.44, green: 0.68, blue: 0.68)
    
    public let listJobTitle = TextStyle(fontName: "Avenir-Book", size: 18, foregroundColor: Color.black)
    public let listCompanyName = TextStyle(fontName: "Avenir-Book", size: 16, foregroundColor: Color.gray)
    public let listLocation = TextStyle(fontName: "Avenir-Book", size: 12, foregroundColor: Color.gray)
    public let listTitle = TextStyle(fontName: "Avenir-Medium", size: 18, foregroundColor: Color.gray)
    
    public let detailsJobTitle = TextStyle(fontName: "Avenir-Medium", size: 22, foregroundColor: Color.black)
    public let detailsCompanyName = TextStyle(fontName: "Avenir-Book", size: 18, foregroundColor: Color.gray)
    public let detailsLocation = TextStyle(fontName: "Avenir-Book", size: 18, foregroundColor: Color.gray)
    public let detailsSubtitle = TextStyle(fontName: "Avenir-Book", size: 18, foregroundColor: Color.black)
    public let detailsParagraph = TextStyle(fontName: "Avenir-Book", size: 14, foregroundColor: Color(UIColor.darkGray))
    public let button = TextStyle(fontName: "Avenir-Heavy", size: 20, foregroundColor: Color.black)
}

struct TextStyle {
    let fontName: String
    let size: CGFloat
    let letterSpacing: CGFloat
    let lineHeight: CGFloat
    let foregroundColor: Color
    
    init(fontName: String, size: CGFloat, letterSpacing: CGFloat = 0, lineHeight: CGFloat? = nil, foregroundColor: Color = .black) {
        self.fontName = fontName
        self.size = size
        self.letterSpacing = letterSpacing
        self.lineHeight = lineHeight ?? size
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
