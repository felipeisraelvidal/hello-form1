import UIKit

@resultBuilder
public struct CustomRowBuilder {
    public static func buildBlock(_ component: UIView) -> UIView {
        component
    }
}

public final class CustomRow: Row<CustomRowConfiguration> {
    
    public var content: UIView
    
    public init(
        image: UIImage? = nil,
        @CustomRowBuilder _ content: () -> UIView,
        action: (() -> Void)? = nil,
        configurationHandler: ((inout CustomRowConfiguration) -> Void)? = nil
    ) {
        self.content = content()
        
        super.init(image: image, action: action, configurationHandler: configurationHandler)
    }
    
}

public final class CustomRowConfiguration: FormRowConfiguration {
    
}
