import Foundation
import AsyncDisplayKit

public protocol ASStoryBookCategory {
    var name: String { get set }
}

public struct ASStoryBookGroupCategory: ASStoryBookCategory {
    public var name: String
    public var categories: [ASStoryBookSubCategory]
    
    public init(_ name: String,
         categories: [ASStoryBookSubCategory]) {
        self.name = name
        self.categories = categories
    }
}

public struct ASStoryBookSubCategory {
    public var name: String
    public var story: StoryType
    public var preview: UIImage?
    
    public enum StoryType {
        case list([String: ASCellNode])
        case node([String: ASDisplayNode])
        case viewControllers([String: UIViewController])
    }
    
    public init(_ name: String,
         story: StoryType,
         preview: UIImage? = nil) {
        self.name = name
        self.story = story
        self.preview = preview
    }
}
