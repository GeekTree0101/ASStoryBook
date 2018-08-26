import Foundation
import AsyncDisplayKit

class SampleNodeController: ASViewController<ASTableNode> {
    
    enum CellType {
        case acell(UIColor)
        case bcell(String?)
    }
    
    let cellTypes: [CellType] = [.acell(.yellow),
                                 .bcell("Example-Description"),
                                 .acell(.green),
                                 .bcell(nil)]
    
    init() {
        super.init(node: ASTableNode())
        node.dataSource = self
        node.delegate = self
        node.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension SampleNodeController: ASTableDataSource {
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
            case .acell(let color):
                return ACellNode.init(color)
            case .bcell(let desc):
                return BCellNode.init(desc: desc)
            }
        }
    }
}

extension SampleNodeController: ASTableDelegate {
    func tableNode(_ tableNode: ASTableNode,
                   didSelectRowAt indexPath: IndexPath) {
        let vc = ExampleNodeController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
}
