import Foundation
import ASStoryBook

struct ProfileStoryBook: ASStoryBookProtocol {
    static var generate: ASStoryBookGroupCategory = {
        let node1 = ProfileNode()
        node1.usernameNode.attributedText =
            "Geektree0101".attrText(ProfileNode.usernameAttr)
        
        let node2 = ProfileNode()
        node2.usernameNode.attributedText = "Geektree0101".attrText(ProfileNode.usernameAttr)
        node2.bioNode.attributedText =
            "Single Bio".attrText(ProfileNode.bioAttr)
        
        let node3 = ProfileNode()
        node3.usernameNode.attributedText = "Geektree0101".attrText(ProfileNode.usernameAttr)
        node3.bioNode.attributedText =
            "Double line Bio\nDouble line Bio".attrText(ProfileNode.bioAttr)
        
        let category = ASStoryBookSubCategory("Profile",
                                              story: .node(["Username only case": node1,
                                                            "Single bio case": node2,
                                                            "Double bio case": node3]))
        
        return ASStoryBookGroupCategory("Profile Screen", categories: [category])
    }()
}
