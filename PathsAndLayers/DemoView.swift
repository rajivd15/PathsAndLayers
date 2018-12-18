//
//  DemoView.swift
//  PathsAndLayers
//
//  Created by Rajiv Deshmukh on 12/16/18.
//  Copyright © 2018 Rajiv Deshmukh. All rights reserved.
//

import UIKit

class DemoView: UIView {

    var path: UIBezierPath!

    override init(frame: CGRect) {
        super.init(frame: frame)
//        self.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        //self.createRectangle()
        //self.createTriangle()
        
        // MARK: -  Default Oval
        //self.path = UIBezierPath(ovalIn: self.bounds)

        // MARK: -  Circle
        //self.path = UIBezierPath(ovalIn: CGRect(x: self.frame.size.width/2 - self.frame.size.height/2, y: 0.0, width: self.frame.size.height, height: self.frame.size.height))
        
        // MARK: - Rectangles with all Rounded corners
        //path = UIBezierPath(roundedRect: self.bounds, cornerRadius: 15.0)
        
        // MARK: - Rectangles with specific Rounded corners
        //path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: [.topLeft, .bottomRight], cornerRadii: CGSize(width: 15.0, height: 0.0))
        
        // MARK: - Making Arcs
        path = UIBezierPath(arcCenter: CGPoint(x: self.frame.size.width/2, y: self.frame.size.height/2), radius: self.frame.size.height/2, startAngle: CGFloat(90.0).degreesToRadians, endAngle: CGFloat(270.0).degreesToRadians, clockwise: true)
        
        // Specify the fill color and apply it to the path.
        UIColor.orange.setFill()
        path.fill()
        
        // Specify a border (stroke) color.
        UIColor.blue.setStroke()
        path.stroke()
    }

    func createRectangle() {
        // MARK: - Initialize Bezier Path
        path = UIBezierPath()

        // Add a point to start of the view - top left
        path.move(to: CGPoint(x: 0.0, y: 0.0))
        // Add line from top left -> left bottom
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        // Add line from left bottom left -> bottom right
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        // Add line from bottom right -> top right
        path.addLine(to: CGPoint(x: self.frame.size.width, y: 0.0))
        // Auto close the last line
        path.close()
    }

    func createTriangle() {
        path = UIBezierPath()

        path.move(to: CGPoint(x: self.frame.width/2, y: 0.0))
        path.addLine(to: CGPoint(x: 0.0, y: self.frame.size.height))
        path.addLine(to: CGPoint(x: self.frame.size.width, y: self.frame.size.height))
        path.close()
    }
}

extension FloatingPoint {
    var degreesToRadians: Self { return self * .pi / 180 }
    var radiansToDegrees: Self { return self * 180 / .pi }
}
