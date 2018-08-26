import Foundation
import AsyncDisplayKit

class DCellNode: ASCellNode {
    let titleNode = ASTextNode()
    let insets: UIEdgeInsets = .init(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0)
    let insets2: UIEdgeInsets = .init(top: 30.0, left: 15.0, bottom: 30.0, right: 15.0)
    
    enum Style {
        case large
        case small
    }
    
    let cellStyle: Style
    init(_ cellStyle: Style) {
        self.cellStyle = cellStyle
        super.init()
        self.automaticallyManagesSubnodes = true
        self.backgroundColor = .white
        
        switch cellStyle {
        case .large:
            self.titleNode.attributedText =
                "Example-Title".attrText(DCellNode.titleAttr)
        case .small:
            self.titleNode.attributedText =
                "Example-Title".attrText(DCellNode.smallTitleAttr)
        }
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        switch cellStyle {
        case .large:
            return ASInsetLayoutSpec(insets: insets2, child: titleNode)
        case .small:
            return ASInsetLayoutSpec(insets: insets, child: titleNode)
        }
    }
}

extension DCellNode {
    
    static var smallTitleAttr: [NSAttributedStringKey: Any] {
        return [.font: UIFont.systemFont(ofSize: 20.0)]
    }
    
    static var titleAttr: [NSAttributedStringKey: Any] {
        return [.font: UIFont.systemFont(ofSize: 40.0)]
    }
}
