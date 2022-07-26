import UIKit
import Form
import CoreUI

class ViewController: FormViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Form"
        
        view.backgroundColor = .systemBackground
        
        let shouldShowExperimental = true
        
        let text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        
        let arr = [
            "Item 1",
            "Item 2",
            "Item 3"
        ]
        
        makeSections {
            FormSection {
                CustomRow {
                    HStack {
                        UIView()
                            .setBackgroundColor(.systemBlue)
                        
                        VStack {
                            UILabel("Hello, World!")
                            UILabel("Hello, World! 2")
                                .setTextColor(.white)
                        }
                        .setBackgroundColor(.systemPurple)
                    }
                    .setSpacing(16)
                    .setDistribution(.fillEqually)
                    .setBackgroundColor(.systemRed)
                    .fillSuperview(offset: 0)
                    .setHeight(80)
                }
            }
            
            FormSection {
                for item in arr {
                    TextRow(item)
                }
            }

            if shouldShowExperimental {
                FormSection(title: "Section 1", footer: "Lorem Ipsum") {
                    TextRow(text, image: .init(systemName: "iphone"))
                        .setTextColor(.systemRed)
                        .setAccessoryType(.disclosureIndicator)
                        .setDeselectWhenSelect(true)
                    
                    TextRow("Row 1")
                        .setSelectionStyle(.none)
                    
                    TextRow("Row 2")
                }
            }

            FormSection(footer: text) {
                TextDescriptionRow(title: "Title", description: text)
                    .setTextColor(titleLabel: .systemPurple, descriptionLabel: .systemBrown)
                
                TextDescriptionRow(.subtitle, title: "Title", description: text)
            }
            
            FormSection {
                let swiftSymbol = UIImage.init(systemName: "swift")
                
                TextRow("Add New Section", image: swiftSymbol)
                    .setTextColor(.systemBlue)
                    .setDeselectWhenSelect(true)
                    .addAction { [weak self] in
                        self?.test()
                    }
            }
        }
    }
    
    func test() {
        let newSection = FormSection {
            TextRow("Testing...")
        }
        insertSection(newSection, at: 1)
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
