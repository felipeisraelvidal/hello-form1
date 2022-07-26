import UIKit

public final class TextRow: Row<TextRowConfiguration> {
    
    private(set) var text: String
    
    public init(
        _ text: String,
        image: UIImage? = nil,
        configurationHandler: ((inout TextRowConfiguration) -> Void)? = nil
    ) {
        self.text = text
        
        super.init(image: image, configurationHandler: configurationHandler)
    }
    
}

public final class TextRowConfiguration: FormRowConfiguration {
    public var font: UIFont = .preferredFont(forTextStyle: .body)
    public var textColor: UIColor = .label
    public var textAlignment: NSTextAlignment = .natural
}
