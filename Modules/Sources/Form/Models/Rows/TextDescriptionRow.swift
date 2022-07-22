import UIKit

public struct TextDescriptionRow: FormRow {
    
    public typealias RowConfiguration = Configuration
    
    public var cellStyle: CellStyle = .default
    
    public var image: UIImage?
    public var title: String
    public var description: String
    
    public var action: (() -> Void)?
    
    public var configuration: Configuration = Configuration()
    
    public init(
        _ cellStyle: CellStyle = .default,
        title: String,
        description: String,
        image: UIImage? = nil,
        configurationHandler: ((inout RowConfiguration) -> Void)? = nil
    ) {
        self.cellStyle = cellStyle
        self.title = title
        self.description = description
        self.image = image
        
        configurationHandler?(&configuration)
    }
    
}

extension TextDescriptionRow {
    public enum CellStyle {
        case `default`
        case subtitle
    }
}

extension TextDescriptionRow {
    public final class Configuration: FormRowConfiguration {
        public var titleFont: UIFont = .preferredFont(forTextStyle: .body).bold()
        public var titleTextColor: UIColor = .label
        public var descriptionFont: UIFont = .preferredFont(forTextStyle: .body)
        public var descriptionTextColor: UIColor = .secondaryLabel
    }
}
