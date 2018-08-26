import Foundation
import ASStoryBook

struct ExampleStorybook: ASStoryBookProtocol {
    static var generate: ASStoryBookGroupCategory = {
        let aCellNode1 = ACellNode.init(.yellow)
        let aCellNode2 = ACellNode.init(.green)
        let aCellNode3 = ACellNode.init(.blue)
        
        let aCellNodeCategory =
            ASStoryBookSubCategory("ACellNode",
                                   story: .list(["yellow case": aCellNode1,
                                                 "green case": aCellNode2,
                                                 "blue case": aCellNode3]))
        
        
        let bCellNode1 = BCellNode.init(desc: "Has Description")
        let bCellNode2 = BCellNode.init(desc: nil)
        let bCellNode3 = BCellNode.init(desc: "TwoLine Description\nTwoLine Description")
        
        let bCellNodeCategory =
            ASStoryBookSubCategory("BCellNode",
                                   story: .list(["has desc case": bCellNode1,
                                                 "desc is nil case": bCellNode2,
                                                 "two line desc case": bCellNode3]))
        
        return ASStoryBookGroupCategory("Example Controller",
                                        categories: [aCellNodeCategory,
                                                     bCellNodeCategory])
    }()
}
