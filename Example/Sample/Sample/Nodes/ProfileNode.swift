import Foundation
import AsyncDisplayKit

class ProfileNode: ASDisplayNode {

    let profileImageNode: ASNetworkImageNode = {
        let node = ASNetworkImageNode()
        let url = URL(string: "https://avatars1.githubusercontent.com/u/19504988?s=460&v=4")
        node.setURL(url, resetToDefault: true)
        node.style.preferredSize = .init(width: 100.0, height: 100.0)
        node.cornerRadius = 50.0
        node.clipsToBounds = true
        return node
    }()
    
    let usernameNode: ASTextNode = {
        let node = ASTextNode()
        node.maximumNumberOfLines = 1
        return node
    }()
    
    let bioNode = ASTextNode()
    let insets: UIEdgeInsets = .init(top: 20.0, left: 30.0, bottom: 50.0, right: 30.0)
    
    override init() {
        super.init()
        self.automaticallyManagesSubnodes = true
        self.backgroundColor = .gray
    }
    
    override func layoutSpecThatFits(_ constrainedSize: ASSizeRange) -> ASLayoutSpec {
        var elements: [ASLayoutElement] = [profileImageNode, usernameNode]
        
        if bioNode.attributedText != nil {
            elements.append(bioNode)
        }
        
        let stackLayout = ASStackLayoutSpec(direction: .vertical,
                                            spacing: 10.0,
                                            justifyContent: .start,
                                            alignItems: .center,
                                            children: elements)
        return ASInsetLayoutSpec(insets: insets, child: stackLayout)
    }
}

extension ProfileNode {
    static var usernameAttr: [NSAttributedStringKey: Any] {
        return [.font: UIFont.systemFont(ofSize: 15.0, weight: .bold)]
    }
    
    static var bioAttr: [NSAttributedStringKey: Any] {
        return [.font: UIFont.systemFont(ofSize: 12.0, weight: .light)]
    }
}
