import Foundation
import AsyncDisplayKit

class CCellNode: ASCellNode {
    
    let titleNode = ASTextNode()
    let descNode = ASTextNode()
    let imageNode = ASImageNode()
    let insets: UIEdgeInsets = .init(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0)
    
    init(desc: String?) {
        super.init()
        self.automaticallyManagesSubnodes = true
        self.backgroundColor = .white
        self.titleNode.attributedText = "Example-Title".attrText(CCellNode.titleAttr)
        self.descNode.attributedText = desc?.attrText(CCellNode.descAttr)
        imageNode.style.preferredSize = .init(width: 50.0, height: 50.0)
        imageNode.backgroundColor = .gray
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        titleNode.style.flexGrow = 1.0
        titleNode.style.flexShrink = 1.0
        descNode.style.flexGrow = 1.0
        descNode.style.flexShrink = 1.0
        
        var elements: [ASLayoutElement] = [imageNode]
        elements += [titleNode, descNode]
            .filter { $0.attributedText != nil }
            .map { $0 as ASLayoutElement }
        
        let stackLayout = ASStackLayoutSpec(direction: .horizontal,
                                            spacing: 5.0,
                                            justifyContent: .start,
                                            alignItems: .start,
                                            children: elements)
        return ASInsetLayoutSpec(insets: insets, child: stackLayout)
    }
}

extension CCellNode {
    static var titleAttr: [NSAttributedStringKey: Any] {
        return [.font: UIFont.systemFont(ofSize: 15.0)]
    }
    
    static var descAttr: [NSAttributedStringKey: Any] {
        return [.font: UIFont.systemFont(ofSize: 30.0)]
    }
}
