//
//  BxInputSelectorRow.swift
//  BxInputController
//
//  Created by Sergey Balalaev on 12/01/17.
//  Copyright © 2017 Byterix. All rights reserved.
//

import Foundation

public protocol BxInputSelectorRow : BxInputRow
{
    
    var isOpened: Bool {get set}
    
    var children: [BxInputChildSelectorRow] {get}
    
    var timeForAutoselection: TimeInterval {get}
    
}

public protocol BxInputChildSelectorRow : BxInputRow
{
    
    weak var parent: BxInputSelectorRow? {get set}
    
}

public protocol BxInputParentSelectorSuggestionsRow : BxInputSelectorRow
{

    var selectedChild: BxInputChildSelectorRow? {get set}
    
}


