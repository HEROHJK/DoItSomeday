//
//  MainContainer.swift
//  DoItSomeday
//
//  Created by 김호종 on 2022/01/10.
//

import UIKit
import AsyncDisplayKit

class MainContainer: ASDKViewController<ASTableNode> {
    var addButtonNode = ASButtonNode()
    var todoVM = TODOViewModel()
    
    override init() {
        super.init(node: ASTableNode())
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        node.allowsSelection = false
        node.dataSource = self
        node.delegate = self
        node.leadingScreensForBatching = 2.5
//        node.view.separatorStyle = .none
        
        node.view.showsVerticalScrollIndicator = false
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension MainContainer: ASTableDataSource, ASTableDelegate {
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        todoVM.count
    }
    
    func tableNode(
        _ tableNode: ASTableNode,
        nodeBlockForRowAt indexPath: IndexPath
    ) -> ASCellNodeBlock {
        guard let todo = todoVM.get(at: indexPath.row) else { fatalError("TODO Load Failed") }
        let nodeBlock: ASCellNodeBlock = {
            TodoCellNode(todo: todo)
        }
        return nodeBlock
    }
    
    func shouldBatchFetchForCollectionNode(collectionNode: ASCollectionNode) -> Bool {
        true
    }
    
//    func tableNode(_ tableNode: ASTableNode, willBeginBatchFetchWith context: ASBatchContext) {
//        fetchNewBatchWithContext(context)
//    }
}
