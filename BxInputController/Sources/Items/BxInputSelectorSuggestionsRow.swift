//
//  BxInputSelectorSuggestionsRow.swift
//  BxInputController
//
//  Created by Sergey Balalaev on 12/01/17.
//  Copyright © 2017 Byterix. All rights reserved.
//

import Foundation


open class BxInputSelectorSuggestionsRow : BxInputStringRow, BxInputSelectorRow
{
    
    open var resourceId = "BxInputSelectorCell"
    
    open var title : String?
    open var placeholder : String?
    open var isEnabled : Bool = true
    open var stringValue: String? {
        get {
            if let item = value as? BxInputStringRow {
                return item.stringValue
            }
            return nil
        }
    }
    
    open var value: BxInputChildSelectorRow? = nil
    open var isOpened: Bool = false
    public var children: [BxInputChildSelectorRow] = []
    {
        didSet {
            for chield in children {
                chield.parent = self
            }
        }
    }
    
    public init(title: String? = nil, placeholder: String? = nil) {
        self.title = title
        self.placeholder = placeholder
    }
    
}

open class BxInputSelectorSuggestionsItemRow: BxInputStringRow, BxInputChildSelectorRow
{
    open var resourceId = "BxInputSelectorSuggestionCell"
    
    open var title : String?
    open var placeholder : String?
    open var isEnabled : Bool {
        get {
            return parent?.isEnabled ?? false
        }
    }
    open var stringValue: String? {
        get {
            return title
        }
    }
    
    weak open var parent: BxInputSelectorRow? = nil
    
    public init(title: String? = nil, placeholder: String? = nil) {
        self.title = title
        self.placeholder = placeholder
    }
}