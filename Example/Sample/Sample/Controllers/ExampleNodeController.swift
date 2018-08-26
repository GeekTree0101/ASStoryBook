import Foundation
import AsyncDisplayKit

class ExampleNodeController: ASViewController<ASTableNode> {
    
    enum CellType {
        case ccell(String?)
        case dcell(Bool)
    }
    
    var cellTypes: [CellType] = [.ccell(nil),
                                 .ccell("Example-Description"),
                                 .dcell(true),
                                 .dcell(false),
                                 .dcell(true)]
    
    init() {
        super.init(node: ASTableNode())
        node.dataSource = self
        node.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ExampleNodeController: ASTableDataSource {
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return 1
    }
    
    func tableNode(_ tableNode: ASTableNode, numberOfRowsInSection section: Int) -> Int {
        return cellTypes.count
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        return {
            guard indexPath.row < self.cellTypes.count else { return ASCellNode() }
            switch self.cellTypes[indexPath.row] {
            case .ccell(let desc):
                return CCellNode.init(desc: desc)
            case .dcell(let isLarge):
                return DCellNode.init(isLarge ? .large: .small)
            }
        }
    }
}
