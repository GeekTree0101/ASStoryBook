import Foundation
import AsyncDisplayKit

class ASStorybookMainNodeController: ASViewController<ASTableNode> {
    
    init() {
        super.init(node: ASTableNode())
        self.node.delegate = self
        self.node.dataSource = self
        self.node.backgroundColor = .white
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.node.view.tableFooterView = UIView(frame: .zero)
    }
}

extension ASStorybookMainNodeController: ASTableDataSource {
    func numberOfSections(in tableNode: ASTableNode) -> Int {
        return ASStorybookManager.manager.categories.count
    }
    
    func tableNode(_ tableNode: ASTableNode,
                   numberOfRowsInSection section: Int) -> Int {
        return ASStorybookManager
            .manager
            .categories[section]
            .categories.count
    }
    
    func tableNode(_ tableNode: ASTableNode,
                   nodeBlockForRowAt indexPath: IndexPath) -> ASCellNodeBlock {
        return {
            guard let group =
                self.getGroupCategory(indexPath.section),
                let subCategory =
                self.getSubCategory(group, row: indexPath.row) else {
                    return ASCellNode()
            }
            return ASStoryBookHomeCellNode(subCategory)
        }
    }
    
    func tableView(_ tableView: UITableView,
                   titleForHeaderInSection section: Int) -> String? {
        guard section < ASStorybookManager.manager.categories.count else {
            return nil
        }
        return ASStorybookManager.manager.categories[section].name
    }
    
    func tableView(_ tableView: UITableView,
                   willDisplayHeaderView view: UIView,
                   forSection section: Int) {
        guard let headerView =
            view as? UITableViewHeaderFooterView else { return }
        headerView.textLabel?.textColor = UIColor.storybook
    }
    
    func getGroupCategory(_ section: Int) -> ASStoryBookGroupCategory? {
        let list = ASStorybookManager.manager.categories
        guard section < list.count else { return nil }
        return list[section]
    }
    
    func getSubCategory(_ group: ASStoryBookGroupCategory,
                        row: Int) -> ASStoryBookSubCategory? {
        guard row < group.categories.count else { return nil }
        return group.categories[row]
    }
}

extension ASStorybookMainNodeController: ASTableDelegate {
    func tableNode(_ tableNode: ASTableNode, didSelectRowAt indexPath: IndexPath) {
        let list = ASStorybookManager.manager.categories
        
        // check vaildate selected category
        guard let targetGroup = list.enumerated()
            .filter({ $0.offset == indexPath.section })
            .first,
            indexPath.row < targetGroup.element.categories.count else {
            return
        }
        
        let category = targetGroup.element.categories[indexPath.row]
        
        switch category.story {
        case .list, .node:
            let viewController = ASStorybookCategoryListNodeController(category)
            self.navigationController?.pushViewController(viewController, animated: true)
        case .viewControllers:
            let viewController = ASStorybookCategoryNodeController(category)
            self.present(viewController, animated: true, completion: nil)
        }
    }
}

private final class ASStoryBookHomeCellNode: ASCellNode {
    typealias CellNode = ASStoryBookHomeCellNode
    
    lazy var backgroundImageNode: ASImageNode = {
        let node = ASImageNode()
        node.cornerRadius = 10.0
        node.contentMode = .scaleAspectFill
        if let image = self.category.preview {
            node.image = self.category.preview
            self.blindNode.isHidden = false
        } else {
            node.backgroundColor = UIColor.randomColor
            self.blindNode.isHidden = true
        }
        node.clipsToBounds = true
        return node
    }()
    
    lazy var blindNode: ASDisplayNode = {
        let node = ASDisplayNode()
        node.cornerRadius = 10.0
        node.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        node.clipsToBounds = true
        return node
    }()
    
    lazy var titleNode: ASTextNode = {
        let node = ASTextNode()
        node.attributedText =
            NSAttributedString(string: self.category.name,
                               attributes: CellNode.titleAttr)
        return node
    }()
    
    let category: ASStoryBookSubCategory
    init(_ category: ASStoryBookSubCategory) {
        self.category = category
        super.init()
        self.automaticallyManagesSubnodes = true
        self.selectionStyle = .none
        self.backgroundColor = .white
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let centerTitleLayout = ASCenterLayoutSpec(centeringOptions: .XY,
                                                   sizingOptions: [],
                                                   child: titleNode)
        let blindOverlayedImageLayout =
            ASOverlayLayoutSpec(child: backgroundImageNode,
                                overlay: blindNode)
        let ratioImageLayout =
            ASRatioLayoutSpec(ratio: 0.5,
                              child: blindOverlayedImageLayout)
        
        
        let titleOverlayedImageLayout =
            ASOverlayLayoutSpec(child: ratioImageLayout,
                                overlay: centerTitleLayout)
        
        let insets = UIEdgeInsets(top: 15.0,
                                  left: 15.0,
                                  bottom: 15.0,
                                  right: 15.0)
        return ASInsetLayoutSpec(insets: insets,
                                 child: titleOverlayedImageLayout)
    }
    
    static var titleAttr: [NSAttributedStringKey: Any] {
        return [.font: UIFont.systemFont(ofSize: 30.0, weight: .bold),
                .foregroundColor: UIColor.white]
    }
}
