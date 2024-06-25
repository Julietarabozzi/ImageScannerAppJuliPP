# ImageScannerAppJuliPP

## Descripción

**ImageScannerAppJuliPP** es una aplicación iOS que utiliza ARKit y RealityKit para escanear imágenes y abrir enlaces correspondientes. La aplicación está construida utilizando SwiftUI y se enfoca en la integración de tecnologías de realidad aumentada para el reconocimiento de imágenes.

## Funcionalidades

- **Escaneo de Imágenes**: La aplicación utiliza la cámara del dispositivo para escanear imágenes previamente configuradas.
- **Reconocimiento de Imágenes**: Cuando se reconoce una imagen, la aplicación identifica el nombre de la imagen y lo mapea a un enlace predefinido.
- **Apertura de Enlaces**: Una vez que se reconoce la imagen, la aplicación abre automáticamente el enlace asociado en el navegador del dispositivo.

## Implementación

### AppDelegate.swift

El `AppDelegate` configura el punto de entrada principal de la aplicación e inicializa la vista `ContentView`, que contiene la interfaz de usuario principal construida con SwiftUI.

### ContentView.swift

`ContentView` es una vista de SwiftUI que contiene un contenedor para el ARView, que es donde se maneja toda la lógica de realidad aumentada.

### ARViewContainer.swift

`ARViewContainer` es una estructura que implementa `UIViewRepresentable` para integrar `ARView` en SwiftUI. Aquí se configuran las capacidades de detección de imágenes de ARKit.

#### Funciones Clave:

- **makeUIView**: Configura el `ARView` y su configuración para la detección de imágenes.
- **updateUIView**: Método requerido por `UIViewRepresentable` pero no utilizado en esta implementación.
- **makeCoordinator**: Crea y devuelve un `Coordinator` que actúa como delegado de la sesión AR para manejar eventos de anclaje.

#### Coordinator

`Coordinator` es una clase que implementa `ARSessionDelegate` para manejar eventos relacionados con la sesión de ARKit.

- **session(_:didAdd:)**: Método que se llama cuando se añade un nuevo anclaje a la sesión. Si el anclaje es un `ARImageAnchor`, se extrae el nombre de la imagen y se obtiene el enlace correspondiente utilizando `getLink(for:)`. Luego, abre el enlace en el navegador.

- **getLink(for:)**: Función que mapea el nombre de una imagen a un enlace específico.

## Funcionamiento

1. **Inicialización**: Al iniciar la aplicación, se crea una ventana y se establece `ContentView` como la vista raíz.
2. **Configuración de AR**: `ARViewContainer` configura `ARView` para detectar imágenes especificadas en el grupo "AR Resources".
3. **Detección y Acción**: Cuando `ARView` detecta una imagen, `Coordinator` maneja el evento, obtiene el enlace correspondiente y lo abre en el navegador.

## Ejemplo de Uso

- **exampleImage**: Cuando la aplicación detecta una imagen llamada "exampleImage", abrirá el enlace especificado para esa imagen.

