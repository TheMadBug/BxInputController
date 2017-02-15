/**
 *	@file BxInputSelectorVariantsRow.swift
 *	@namespace BxInputController
 *
 *	@details Selector Row for choosing one item from variants
 *	@date 13.01.2017
 *	@author Sergey Balalaev
 *
 *	@version last in https://github.com/ByteriX/BxInputController.git
 *	@copyright The MIT License (MIT) https://opensource.org/licenses/MIT
 *	 Copyright (c) 2017 ByteriX. See http://byterix.com
 */

import UIKit

/// Selector Row for choosing one item from variants in selector below this row
/// - parameter: T - is associated data model for variants rows, should be inherited from BxInputStringObject
open class BxInputSelectorVariantsRow<T: BxInputStringObject> : BxInputVariantsRow<T>, BxInputSelectorRow, BxInputStringRow
{
    override open var resourceId : String {
        get { return "BxInputSelectorCell" }
    }
    override open var estimatedHeight : CGFloat {
        get { return 54 }
    }
    
    open var isOpened: Bool = false
    open var timeForAutoselection: TimeInterval = 0.0 // if < 0.5 then autoselection turned off
    
    public var child : BxInputChildSelectorVariantsRow
    public var children: [BxInputChildSelectorRow] {
        get {
            return [child]
        }
    }
    open var stringValue: String? {
        get {
            if let value = value {
                return value.stringValue
            }
            return nil
        }
    }
    
    override public init(title: String? = nil, placeholder: String? = nil, value: T? = nil) {
        child = BxInputChildSelectorVariantsRow()
        super.init(title: title, placeholder: placeholder, value: value)
        child.parent = self
    }
    
}

/// Child Row which show variants selector below parent row
open class BxInputChildSelectorVariantsRow: BxInputChildSelectorRow, BxInputStaticHeight
{
    open var resourceId : String = "BxInputSelectorVariantsCell"
    open var height : CGFloat = 216
    open var estimatedHeight : CGFloat {
        get { return height }
    }
    
    open var title : String? {
        get {
            return parent?.title ?? nil
        }
    }
    open var placeholder : String? {
        get {
            return parent?.placeholder ?? nil
        }
    }
    open var isEnabled : Bool {
        get {
            return parent?.isEnabled ?? false
        }
        set {
            parent?.isEnabled = isEnabled
        }
    }
    
    weak open var parent: BxInputSelectorRow? = nil
}