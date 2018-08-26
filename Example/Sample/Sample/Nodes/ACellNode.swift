import Foundation
import AsyncDisplayKit

class ACellNode: ASCellNode {
    
    let titleNode = ASTextNode()
    let imageNode = ASImageNode()
    let insets: UIEdgeInsets = .init(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0)
    
    init(_ backgroundColor: UIColor) {
        super.init()
        self.automaticallyManagesSubnodes = true
        self.backgroundColor = .white
        self.titleNode.attributedText = "Example-Title".attrText(ACellNode.titleAttr)
        imageNode.style.preferredSize = .init(width: 50.0, height: 50.0)
        imageNode.backgroundColor = backgroundColor
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        let stackLayout = ASStackLayoutSpec(direction: .horizontal,
                                            spacing: 5.0,
                                            justifyContent: .start,
                                            alignItems: .start,
                                            children: [imageNode, titleNode])
        return ASInsetLayoutSpec(insets: insets, child: stackLayout)
    }
}

extension ACellNode {
    static var titleAttr: [NSAttributedStringKey: Any] {
        return [.font: UIFont.systemFont(ofSize: 15.0)]
    }
}
