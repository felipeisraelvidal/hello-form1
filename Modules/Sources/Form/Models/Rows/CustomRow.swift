import UIKit

@resultBuilder
public struct CustomRowBuilder {
    public static func buildBlock(_ component: UIView) -> UIView {
        component
    }
}

public struct CustomRow: FormRow {
    
    public typealias RowConfiguration = Configuration
    
    public var image: UIImage?
    public var content: UIView
    
    public var action: (() -> Void)?
    
    public var configuration: Configuration = Configuration()
    
    public init(
        image: UIImage? = nil,
        @CustomRowBuilder _ content: () -> UIView,
        configurationHandler: ((inout RowConfiguration) -> Void)? = nil
    ) {
        self.image = image
        self.content = content()
        
        configurationHandler?(&configuration)
    }
    
}

extension CustomRow {
    public final class Configuration: FormRowConfiguration {
        
    }
}
