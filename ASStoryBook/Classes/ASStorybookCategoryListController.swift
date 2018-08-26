import Foundation
import AsyncDisplayKit

class ASStorybookCategoryListNodeController: ASViewController<ASTableNode> {
    let category: ASStoryBookSubCategory
    
    init(_ category: ASStoryBookSubCategory) {
        self.category = category
        super.init(node: ASTableNode())
        self.node.backgroundColor = .white
        self.node.dataSource = self
        self.node.delegate = self
        self.title = category.name
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.node.view.tableFooterView = UIView(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ASStorybookCategoryListNodeController: ASTableDataSource {
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        switch category.story {
        case .list(let items):
            return items.count
        case .node(let items):
            return items.count
        default:
            return 0
        }
    }
    
    func tableNode(_ tableNode: ASTableNode,
                   numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableNode(_ tableNode: ASTableNode, nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        return {
            guard let cellNode = self.getCellNode(self.category.story, section: indexPath.section) else {
                return ASCellNode()
            }
            return cellNode
        }
    }
    
    private func getCellNode(_ type: ASStoryBookSubCategory.StoryType,
                             section: Int) -> ASCellNode? {
        switch type {
        case .list(let items):
            let element = items.enumerated()
                .filter { $0.offset == section }.first?.element
            return element?.value
        case .node(let items):
            let element = items.enumerated()
                .filter { $0.offset == section }.first?.element
            guard let targetNode = element?.value else {
                return nil
            }
            let virtualCellNode = ASCellNode()
            virtualCellNode.selectionStyle = .none
            virtualCellNode.automaticallyManagesSubnodes = true
            virtualCellNode.layoutSpecBlock = { [weak targetNode] (_ , _) -> ASLayoutSpec in
                guard let `targetNode` = targetNode else { return ASLayoutSpec() }
                return ASInsetLayoutSpec(insets: .zero,
                                         child: targetNode)
            }
            return virtualCellNode
        default:
            return nil
        }
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        switch category.story {
        case .list(let items):
            return items.enumerated()
                .filter { $0.offset == section }.first?.element.key
        case .node(let items):
            return items.enumerated()
                .filter { $0.offset == section }.first?.element.key
        default:
            return nil
        }
    }
}

extension ASStorybookCategoryListNodeController: ASTableDelegate {
    func tableView(_ tableView: UITableView,
                   willDisplayHeaderView view: UIView,
                   forSection section: Int) {
        guard let headerView =
            view as? UITableViewHeaderFooterView else { return }
        headerView.textLabel?.textColor = UIColor.storybook
    }
}
