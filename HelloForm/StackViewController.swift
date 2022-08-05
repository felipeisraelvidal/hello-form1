import UIKit
import Form

class ViewController: FormStackViewController {

    //MAKE VARIABLES FOR THIS LABELS AND VIEWS
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "teste"
        label.textColor = .black
        return label
    }()

    let descriptionLabel: UILabel = {
        let label = UILabel()
        label.text = "teste"
        label.textColor = .black
        return label
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        title = "Teste"
        setupContraints()
    }

    private func setupContraints() {
        contentView.addArrangedSubview(titleLabel)
        contentView.addArrangedSubview(descriptionLabel)
    }

}

//CRIAR COMPONENTES CUSTOMIZAVEIS/PARA CADA TIPO(SCROLVIEW E STACKVIEW)
//ou tornar os componentes declaritvos
//PEGAR PEDAÇO POR PEDAÇO DO CODIGO PARA TENTAR ENTENDER MELHOR, procurar por pontos
//chaves que ainda não sei as definitions
//PROCURAR SABER MAIS SOBRE PREVIEWS

#if DEBUG
import SwiftUI

struct StackViewControllerPreviews: PreviewProvider {
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
