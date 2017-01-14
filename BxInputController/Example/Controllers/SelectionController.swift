//
//  SelectionController.swift
//  BxInputController
//
//  Created by Sergey Balalaev on 12/01/17.
//  Copyright © 2017 Byterix. All rights reserved.
//

import UIKit


class SelectionController : BxInputController {
    
    
    private var dateValue = BxInputSelectorDateRow(title: "date selector", value: Date().addingTimeInterval(300000))
    private var emptyDateValue = BxInputSelectorDateRow(title: "empty date", placeholder: "SELECT")
    private var autoselectedDateValue = BxInputSelectorDateRow(title: "autoselected", placeholder: "SELECT")
    private var fromCurrentValue = BxInputSelectorDateRow(title: "from current", value: Date())
    
    private var stundartSuggestionsValue = BxInputSelectorSuggestionsRow(title: "standart", placeholder: "SELECT")
    private var justValue = BxInputTextRow(title: "just", placeholder: "for keyboard opening")
    
    private var filledVariants = BxInputSelectorVariantsRow(title: "variants")
    private var emptyVariants = BxInputSelectorVariantsRow(title: "empty variants", placeholder: "SELECT")
    private var autoselectedVariants = BxInputSelectorVariantsRow(title: "autoselected", placeholder: "SELECT")
    
    private var variants : [BxInputVariantsItem] = [
        BxInputVariantsValue(id: "1", name: "first"),
        BxInputVariantsValue(id: "2", name: "second"),
        BxInputVariantsValue(id: "3", name: "last"),
        ]
    private var otherVariants : [BxInputVariantsItem] = [
        BxInputVariantsValue(id: "1", name: "value1"),
        BxInputVariantsValue(id: "2", name: "value2"),
        BxInputVariantsValue(id: "3", name: "value3"),
        BxInputVariantsValue(id: "4", name: "value4"),
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        autoselectedDateValue.timeForAutoselection = 3
        fromCurrentValue.minimumDate = Date()
        
        stundartSuggestionsValue.children = [
            BxInputSelectorSuggestionsItemRow(title: "value 1"),
            BxInputSelectorSuggestionsItemRow(title: "value 2"),
            BxInputSelectorSuggestionsItemRow(title: "value 3"),
            BxInputSelectorSuggestionsItemRow(title: "value 4"),
            BxInputSelectorSuggestionsItemRow(title: "value 5"),
            BxInputSelectorSuggestionsItemRow(title: "value 6"),
            BxInputSelectorSuggestionsItemRow(title: "value 7"),
            BxInputSelectorSuggestionsItemRow(title: "value 8"),
            BxInputSelectorSuggestionsItemRow(title: "value 9")
        ]
        
        emptyVariants.items = variants
        filledVariants.items = variants
        filledVariants.value = variants.first
        autoselectedVariants.items = otherVariants
        autoselectedVariants.timeForAutoselection = 2
        
        self.sections = [
            BxInputSection(headerText: "Date", rows: [dateValue, emptyDateValue, autoselectedDateValue, fromCurrentValue], footerText: "all variants of dates"),
            BxInputSection(headerText: "Suggestions", rows: [stundartSuggestionsValue, justValue]),
            BxInputSection(headerText: "Variants", rows: [filledVariants, emptyVariants, autoselectedVariants]),
        ]
    }
    
}