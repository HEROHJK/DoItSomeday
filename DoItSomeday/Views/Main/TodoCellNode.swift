//
//  TodoCellNode.swift
//  DoItSomeday
//
//  Created by 김호종 on 2022/01/10.
//

import AsyncDisplayKit

final class TodoCellNode: ASCellNode {
    var titleText = ASTextNode()
    var dDayText = ASTextNode()
    
    init(todo: TODO) {
        super.init()
        
        automaticallyManagesSubnodes = true
        
        titleText.attributedText = todo.attributedString(.title, withSize: 15)
        
        dDayText.attributedText = todo.attributedString(.dday, withSize: 15)
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let layout = ASStackLayoutSpec(
            direction: .horizontal,
            spacing: 5.0,
            justifyContent: .start,
            alignItems: .stretch,
            children: [ titleText, dDayText ]
        )
        
        return ASInsetLayoutSpec(
            insets: UIEdgeInsets(top: 10.0, left: 10.0, bottom: 10.0, right: 10.0),
            child: layout
        )
    }
}
