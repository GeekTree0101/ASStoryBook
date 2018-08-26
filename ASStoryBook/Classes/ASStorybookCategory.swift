import Foundation
import AsyncDisplayKit

public protocol ASStoryBookCategory {
    var name: String { get set }
}

public struct ASStoryBookGroupCategory: ASStoryBookCategory {
    var name: String
    var categories: [ASStoryBookSubCategory]
    
    init(_ name: String,
         categories: [ASStoryBookSubCategory]) {
        self.name = name
        self.categories = categories
    }
}

public struct ASStoryBookSubCategory {
    var name: String
    var story: StoryType
    var preview: UIImage?
    
    enum StoryType {
        case list([String: ASCellNode])
        case node([String: ASDisplayNode])
        case viewControllers([String: UIViewController])
    }
    
    init(_ name: String,
         story: StoryType,
         preview: UIImage? = nil) {
        self.name = name
        self.story = story
        self.preview = preview
    }
}
