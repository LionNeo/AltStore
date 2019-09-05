//
//  NavigationBar.swift
//  AltStore
//
//  Created by Riley Testut on 7/15/19.
//  Copyright © 2019 Riley Testut. All rights reserved.
//

import UIKit

import Roxas

class NavigationBar: UINavigationBar
{
    private let backgroundColorView = UIView()
    
    override init(frame: CGRect)
    {
        super.init(frame: frame)
        
        self.initialize()
    }
    
    required init?(coder aDecoder: NSCoder)
    {
        super.init(coder: aDecoder)
        
        self.initialize()
    }
    
    private func initialize()
    {
        self.shadowImage = UIImage()
        
        if let tintColor = self.barTintColor
        {
            self.backgroundColorView.backgroundColor = tintColor
            
            // Top = -50 to cover status bar area above navigation bar on any device.
            // Bottom = -1 to prevent a flickering gray line from appearing.
            self.addSubview(self.backgroundColorView, pinningEdgesWith: UIEdgeInsets(top: -50, left: 0, bottom: -1, right: 0))
        }
        else
        {
            self.barTintColor = .white
        }
    }
    
    override func layoutSubviews()
    {
        super.layoutSubviews()
        
        if self.backgroundColorView.superview != nil
        {
            self.insertSubview(self.backgroundColorView, at: 1)
        }
        
        // We can't easily shift just the back button up, so we shift the entire content view slightly.
        for contentView in self.subviews
        {
            guard NSStringFromClass(type(of: contentView)).contains("ContentView") else { continue }
            contentView.center.y -= 2
        }
    }
}
