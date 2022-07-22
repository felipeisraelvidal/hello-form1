import UIKit
import Form

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Form"
        
        view.backgroundColor = .systemBackground
        
        let shouldShowExperimental = true
        
        let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        
        let view = UIView()
        view.backgroundColor = .systemGreen
        view.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            view.heightAnchor.constraint(equalToConstant: 70)
        ])
        
        makeSections {
            FormSection(title: "Custom Row") {
                CustomRow {
                    view
                } configurationHandler: {
                    $0.backgroundColor = UIColor.systemYellow.withAlphaComponent(0.15)
                }
            }

            if shouldShowExperimental {
                FormSection(title: "Section 1", footer: "Lorem Ipsum") {
                    TextRow(text, image: .init(systemName: "iphone")) {
                        $0.accessoryType = .disclosureIndicator
                        $0.textColor = .systemRed
                        $0.deselectWhenSelect = true
                    } action: {
                        print("Teste")
                    }
                    TextRow("Row 1") {
                        $0.selectionStyle = .none
                    }
                    TextRow("Row 2")
                }
            }

            FormSection(footer: text) {
                TextDescriptionRow(title: "Title", description: text)
                TextDescriptionRow(.subtitle, title: "Title", description: text)
            }
        }
    }

}

#if DEBUG
import SwiftUI
struct ViewControllerPreviews: PreviewProvider {
    
    static var previews: some View {
        ContainerPreview()
            .ignoresSafeArea()
    }
    
    struct ContainerPreview: UIViewControllerRepresentable {
        typealias UIViewControllerType = UINavigationController
        
        func makeUIViewController(context: Context) -> UIViewControllerType {
            let viewController = ViewController()
            
            let navigationController = UINavigationController(rootViewController: viewController)
            
            return navigationController
        }
        
        func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {}
    }
    
}
#endif
