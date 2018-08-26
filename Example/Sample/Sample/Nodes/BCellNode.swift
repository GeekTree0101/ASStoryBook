import Foundation
import AsyncDisplayKit

class BCellNode: ASCellNode {
    
    let titleNode = ASTextNode()
    let descNode = ASTextNode()
    let imageNode = ASImageNode()
    let insets: UIEdgeInsets = .init(top: 15.0, left: 15.0, bottom: 15.0, right: 15.0)
    
    init(desc: String?) {
        super.init()
        self.automaticallyManagesSubnodes = true
        self.backgroundColor = .white
        self.titleNode.attributedText = "Example-Title".attrText(BCellNode.titleAttr)
        self.descNode.attributedText = desc?.attrText(BCellNode.descAttr)
        imageNode.style.preferredSize = .init(width: 50.0, height: 50.0)
        imageNode.backgroundColor = .gray
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        var elements: [ASLayoutElement] = [imageNode]
        elements += [titleNode, descNode]
            .filter { $0.attributedText != nil }
            .map { $0 as ASLayoutElement }
        
        let stackLayout = ASStackLayoutSpec(direction: .vertical,
                                            spacing: 5.0,
                                            justifyContent: .start,
                                            alignItems: .start,
                                            children: elements)
        return ASInsetLayoutSpec(insets: insets, child: stackLayout)
    }
}

extension BCellNode {
    static var titleAttr: [NSAttributedStringKey: Any] {
        return [.font: UIFont.systemFont(ofSize: 20.0)]
    }
    
    static var descAttr: [NSAttributedStringKey: Any] {
        return [.font: UIFont.systemFont(ofSize: 15.0)]
    }
}
