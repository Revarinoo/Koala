//
//  LineCard.swift
//  LineChart
//
//  Created by András Samu on 2019. 08. 31..
//  Copyright © 2019. András Samu. All rights reserved.
//

import SwiftUI

public struct LineChartView: View {
    @Environment(\.colorScheme) var colorScheme: ColorScheme
    @ObservedObject var data:ChartsData
    public var label: [String]
    public var legend: String?
    public var style: ChartStyle
    public var darkModeStyle: ChartStyle
    
    public var formSize:CGSize
    public var dropShadow: Bool
    public var valueSpecifier:String
    
    @State private var touchLocation:CGPoint = .zero
    @State private var showIndicatorDot: Bool = false
    @State private var currentValue: Double = 2 {
        didSet{
            if (oldValue != self.currentValue && showIndicatorDot) {
                HapticFeedback.playSelection()
            }
            
        }
    }
    var frame = CGSize(width: 180, height: 250)
    private var rateValue: Int?
    
    public init(data: [Double],
                label: [String],
                title: String,
                legend: String? = nil,
                style: ChartStyle = Styles.lineChartStyleOne,
                form: CGSize? = ChartForm.medium,
                rateValue: Int? = 14,
                dropShadow: Bool? = true,
                valueSpecifier: String? = "%.1f") {
        
        self.data = ChartsData(points: data)
        self.label = label
        self.legend = legend
        self.style = style
        self.darkModeStyle = style.darkModeStyle != nil ? style.darkModeStyle! : Styles.lineViewDarkMode
        self.formSize = form!
        frame = CGSize(width: self.formSize.width, height: self.formSize.height)
        self.dropShadow = dropShadow!
        self.valueSpecifier = valueSpecifier!
        self.rateValue = rateValue
    }
    
    public var body: some View {
        GeometryReader { geometry in
            GeometryReader{ geometry in
                VStack {
                    Line(data: self.data,
                         frame: .constant(geometry.frame(in: .local)),
                         touchLocation: self.$touchLocation,
                         showIndicator: self.$showIndicatorDot,
                         minDataValue: .constant(5.0 * -1),
                         maxDataValue: .constant(nil), tooltipText: self.currentValue.thousandsFormatter()
                    )
                    HStack {
                        ForEach(label, id:\.self) { label in
                            Spacer()
                            Text("\(label)")
                                .font(Font.custom(ThemeFont.poppinsMedium, size: 14))
                                .foregroundColor(Color(hex: "A7A7A7"))
                            Spacer()
                        }
                    }
                }
            }
            .frame(width: geometry.size.width)
            .offset(x: 0, y: 0)
            .gesture(DragGesture()
                        .onChanged({ value in
                self.touchLocation = value.location
                self.showIndicatorDot = true
                self.getClosestDataPoint(toPoint: value.location, width: geometry.size.width, height: self.frame.height)
            })
                        .onEnded({ value in
                self.showIndicatorDot = false
            })
            )
        }
    }
    
    @discardableResult func getClosestDataPoint(toPoint: CGPoint, width:CGFloat, height: CGFloat) -> CGPoint {
        let points = self.data.onlyPoints()
        let stepWidth: CGFloat = width / CGFloat(points.count-1)
        let stepHeight: CGFloat = height / CGFloat(points.max()! + points.min()!)
        
        let index:Int = Int(round((toPoint.x)/stepWidth))
        if (index >= 0 && index < points.count){
            self.currentValue = points[index]
            return CGPoint(x: CGFloat(index)*stepWidth, y: CGFloat(points[index])*stepHeight)
        }
        return .zero
    }
}

struct LineChartView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            LineChartView(data: [812, 2332, 5431, 3221, 1249, 378], label: ["Jan", "Feb", "Mar", "Apr", "May", "Jun"], title: "Line chart", legend: "Basic")
                .environment(\.colorScheme, .light)
        }.previewLayout(.sizeThatFits)
    }
}
