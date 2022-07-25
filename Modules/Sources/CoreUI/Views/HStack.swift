import UIKit

public final class HStack: UIStackView {
    
    public init(@StackBuilder views: () -> [UIView]) {
        super.init(frame: .zero)
        axis = .horizontal
        translatesAutoresizingMaskIntoConstraints = false
        views().forEach { addArrangedSubview($0) }
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

extension HStack: StackModifier {
    
    public func setAlignment(_ alignment: UIStackView.Alignment) -> HStack {
        self.alignment = alignment
        return self
    }
    
    public func setDistribution(_ distribution: UIStackView.Distribution) -> HStack {
        self.distribution = distribution
        return self
    }
    
    public func setSpacing(_ spacing: CGFloat) -> HStack {
        self.spacing = spacing
        return self
    }
    
}
