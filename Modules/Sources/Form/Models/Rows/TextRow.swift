import UIKit

public struct TextRow: FormRow {
    
    public typealias RowConfiguration = Configuration
    
    public var image: UIImage?
    private(set) var text: String
    
    public var configuration: Configuration = Configuration()
    
    public var action: (() -> Void)?
    
    public init(
        _ text: String,
        image: UIImage? = nil,
        configurationHandler: ((inout RowConfiguration) -> Void)? = nil,
        action: (() -> Void)? = nil
    ) {
        self.text = text
        self.image = image
        
        self.action = action
        
        configurationHandler?(&configuration)
    }
    
}

extension TextRow {
    public final class Configuration: FormRowConfiguration {
        public var font: UIFont = .preferredFont(forTextStyle: .body)
        public var textColor: UIColor = .label
        public var textAlignment: NSTextAlignment = .natural
    }
}
