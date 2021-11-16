//
//  File.swift
//
//
//  Created by András Samu on 2019. 07. 19..
//

import Foundation
import SwiftUI

public struct Colors {
    public static let OrangeEnd:Color = Color(hex: "#FF782C")
    public static let OrangeStart:Color = Color(hex: "#EC2301")
    public static let LegendColor:Color = Color(hex: "#E8E7EA")
    public static let IndicatorKnob:Color = Color(hex: "#FF57A6")
    public static let GradientPurple:Color = Color(hex: "#7B75FF")
    public static let GradientNeonBlue:Color = Color(hex: "#6FEAFF")
}

public struct GradientColor {
    public let start: Color
    public let end: Color
    
    public init(start: Color, end: Color) {
        self.start = start
        self.end = end
    }
    
    public func getGradient() -> Gradient {
        return Gradient(colors: [start, end])
    }
}

public struct GradientColors {
    public static let orange = GradientColor(start: Colors.OrangeStart, end: Colors.OrangeEnd)
    public static let blue = GradientColor(start: Colors.GradientPurple, end: Colors.GradientNeonBlue)
    public static let green = GradientColor(start: Color(hex: "0BCDF7"), end: Color(hex: "A2FEAE"))
    public static let blu = GradientColor(start: Color(hex: "0591FF"), end: Color(hex: "29D9FE"))
    public static let bluPurpl = GradientColor(start: Color(hex: "4ABBFB"), end: Color(hex: "8C00FF"))
    public static let purple = GradientColor(start: Color(hex: "741DF4"), end: Color(hex: "C501B0"))
    public static let prplPink = GradientColor(start: Color(hex: "BC05AF"), end: Color(hex: "FF1378"))
    public static let prplNeon = GradientColor(start: Color(hex: "FE019A"), end: Color(hex: "FE0BF4"))
    public static let orngPink = GradientColor(start: Color(hex: "FF8E2D"), end: Color(hex: "FF4E7A"))
}

public struct Styles {
    public static let lineChartStyleOne = ChartStyle(
        backgroundColor: Color.white,
        accentColor: Colors.OrangeStart,
        secondGradientColor: Colors.OrangeEnd,
        textColor: Color.black,
        legendTextColor: Color.gray,
        dropShadowColor: Color.gray)
    
    public static let lineViewDarkMode = ChartStyle(
        backgroundColor: Color.black,
        accentColor: Colors.OrangeStart,
        secondGradientColor: Colors.OrangeEnd,
        textColor: Color.white,
        legendTextColor: Color.white,
        dropShadowColor: Color.gray)
}

public struct ChartForm {
    public static let small = CGSize(width:180, height:120)
    public static let medium = CGSize(width:180, height:240)
    public static let large = CGSize(width:360, height:120)
    public static let extraLarge = CGSize(width:360, height:240)
    public static let detail = CGSize(width:180, height:120)
}

public class ChartStyle {
    public var backgroundColor: Color
    public var accentColor: Color
    public var gradientColor: GradientColor
    public var textColor: Color
    public var legendTextColor: Color
    public var dropShadowColor: Color
    public weak var darkModeStyle: ChartStyle?
    
    public init(backgroundColor: Color, accentColor: Color, secondGradientColor: Color, textColor: Color, legendTextColor: Color, dropShadowColor: Color){
        self.backgroundColor = backgroundColor
        self.accentColor = accentColor
        self.gradientColor = GradientColor(start: accentColor, end: secondGradientColor)
        self.textColor = textColor
        self.legendTextColor = legendTextColor
        self.dropShadowColor = dropShadowColor
    }
}

public class ChartsData: ObservableObject, Identifiable {
    @Published var points: [(String,Double)]
    var valuesGiven: Bool = false
    var ID = UUID()
    
    public init<N: BinaryFloatingPoint>(points:[N]) {
        self.points = points.map{("", Double($0))}
    }
    public init<N: BinaryInteger>(values:[(String,N)]){
        self.points = values.map{($0.0, Double($0.1))}
        self.valuesGiven = true
    }
    public init<N: BinaryFloatingPoint>(values:[(String,N)]){
        self.points = values.map{($0.0, Double($0.1))}
        self.valuesGiven = true
    }
    public func onlyPoints() -> [Double] {
        return self.points.map{ $0.1 }
    }
}

class HapticFeedback {
    #if os(iOS)
    let selectionFeedbackGenerator = UISelectionFeedbackGenerator()
    static func playSelection() -> Void {
        UISelectionFeedbackGenerator().selectionChanged()
    }
    #else
    static func playSelection() -> Void {
    }
    #endif
}
