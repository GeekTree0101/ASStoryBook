import Foundation
import ASStoryBook

struct SampleStorybook: ASStoryBookProtocol {
    static var generate: ASStoryBookGroupCategory = {
        let cCellNode1 = CCellNode.init(desc: "Has Description")
        let cCellNode2 = CCellNode.init(desc: nil)
        
        let cCellNodeCategory =
            ASStoryBookSubCategory("CCellNode",
                                   story: .list(["has desc case": cCellNode1,
                                                 "empty desc case": cCellNode2]))
        
        
        let dCellNode1 = DCellNode.init(.large)
        let dCellNode2 = DCellNode.init(.small)
        
        let dCellNodeCategory =
            ASStoryBookSubCategory("DCellNode",
                                   story: .list(["large case": dCellNode1,
                                                 "small case": dCellNode2]))
        
        return ASStoryBookGroupCategory("Sample Controller",
                                        categories: [cCellNodeCategory,
                                                     dCellNodeCategory])
    }()
}
