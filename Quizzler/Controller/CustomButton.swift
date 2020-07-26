//
//  CustomButton.swift
//  CustomButtonImplementation
//
//  Created by Laura Garcia Cano on 10/06/2020.
//  Copyright © 2020 LauDecked Devs. All rights reserved.
//

import UIKit

@IBDesignable
    
    class CustomButton: UIButton {
    
    //MARK: - ButtonCornerRadius

        @IBInspectable var cornerRadius: CGFloat = 0{
            didSet{
                self.layer.cornerRadius = cornerRadius
            }
        }
    
    //MARK: - ButtonBorder

        @IBInspectable var borderWidth: CGFloat = 0{
            didSet{
                self.layer.borderWidth = borderWidth
            }
        }

        @IBInspectable var borderColor: UIColor = UIColor.clear{
            didSet{
                self.layer.borderColor = borderColor.cgColor
        }
    }
    
        //MARK: - ButtonShadow
    
        @IBInspectable var shadowColor: UIColor = UIColor.gray {
            didSet {
                layer.shadowColor = shadowColor.cgColor
        }
    }
        @IBInspectable var shadowOpacity: Float = 1.0 {
            didSet {
                layer.shadowOpacity = shadowOpacity
            }
        }

        @IBInspectable var shadowRadius: CGFloat = 1.0 {
            didSet {
                layer.shadowRadius = shadowRadius
            }
        }

        @IBInspectable var masksToBounds: Bool = true {
            didSet {
                layer.masksToBounds = masksToBounds
            }
        }

        @IBInspectable var shadowOffset: CGSize = CGSize(width: 12, height: 12) {
            didSet {
                layer.shadowOffset = shadowOffset
        }
    }
}
