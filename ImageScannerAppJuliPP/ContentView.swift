import SwiftUI
import RealityKit
import ARKit

struct ContentView : View {
    var body: some View {
        ARViewContainer().edgesIgnoringSafeArea(.all)
    }
}

struct ARViewContainer: UIViewRepresentable {
    
    func makeUIView(context: Context) -> ARView {
        let arView = ARView(frame: .zero)
        
        // Configura ARView para reconocer imágenes
        let configuration = ARWorldTrackingConfiguration()
        if let referenceImages = ARReferenceImage.referenceImages(inGroupNamed: "AR Resources", bundle: nil) {
            configuration.detectionImages = referenceImages
            configuration.maximumNumberOfTrackedImages = 1
        }
        arView.session.run(configuration)
        arView.session.delegate = context.coordinator

        return arView
    }
    
    func updateUIView(_ uiView: ARView, context: Context) {}
    
    func makeCoordinator() -> Coordinator {
        Coordinator()
    }

    class Coordinator: NSObject, ARSessionDelegate {
        func session(_ session: ARSession, didAdd anchors: [ARAnchor]) {
            for anchor in anchors {
                if let imageAnchor = anchor as? ARImageAnchor {
                    let referenceImage = imageAnchor.referenceImage
                    let imageName = referenceImage.name ?? ""

                    // Aquí puedes mapear la imagen reconocida a un enlace
                    let link = getLink(for: imageName)

                    // Abre el enlace
                    if let url = URL(string: link) {
                        DispatchQueue.main.async {
                            UIApplication.shared.open(url)
                        }
                    }
                }
            }
        }

        private func getLink(for imageName: String) -> String {
            // Implementa aquí tu lógica para mapear la imagen al enlace correspondiente
            switch imageName {
            case "exampleImage":
                return "https://drive.google.com/drive/folders/1G2U0O4UjBRhbHKK1dx4oibKITHt4u_XK"
            default:
                return "https://drive.google.com/drive/folders/1G2U0O4UjBRhbHKK1dx4oibKITHt4u_XK"
            }
        }
    }
}

#Preview {
    ContentView()
}

