//: [Previous](@previous)

import Foundation

/*class MediaItem {
    //let id: UUID = UUID() // Necesario un inicializador si no marca un error
    let id: UUID
    
    
    // MARK: Inicializador designado: significa que esta clase va a poder asignar todas las variables necesarias
    init(){     // Inicializador de la clase
        self.id = UUID()
    }
    
    
    func display() -> String {
        ""
    }
}*/


class MediaItem {
    //let id: UUID = UUID() // Necesario un inicializador si no marca un error
    let id: UUID
    let title: String
    
    // MARK: Inicializador designado: significa que esta clase va a poder asignar todas las variables necesarias
    init(title: String){     // Inicializador de la clase
        self.id = UUID()
        self.title = title
    }
    
    // MARK: este inicializador indica que la clase debe si o si tenerlo, debe ser instanciado y debe estar en orden
//    required init() {
//        self.id = UUID()
//        self.title = ""
//    }
    
    func display() -> String {
        "Media Item"
    }
}


// Herencia
class Video: MediaItem {
    let duration: TimeInterval
    var isHD: Bool
    
    // MARK: 'designed' asegura que todas las propiedades hijas y padre tengan todas sus propiedades
    init(title: String, duration: TimeInterval, hd: Bool) {
        // El orden de los factores si altera el producto
        // Primero inicializar al hijo y luego al padre
        self.duration = duration
        self.isHD = hd
        super.init(title: title)
    }
    
    // MARK: convenience no pueden llamar a todos los inicializadores del padre
    convenience init(HDVideo title: String, duration: TimeInterval) {
        
        // Debe llamar al designado de la clase en la que esté (ene ste caso, debe llamar al designado hijo)
        self.init(title: title, duration: duration, hd: true)
    }
    
//    required init(){
//        self.duration = 0
//        self.isHD = false
//        super.init(title: "")
//    }
}


let mediaItem = MediaItem()
let video = Video(title: "my video", duration: 0.2)
let hdVideo = Video(HDVideo: "HDView", duration: 0.2)
let emptyVideo = Video()
//video.id


class Image: MediaItem {
    var width: Int
    var height: Int
    
    init(width: Int, height: Int, title: String) {
        self.width = width
        self.height = height
        super.init(title: title)
    }
}

let profilePicture = Image(width: 10, height: 10, title: "Profile Picture")
profilePicture.width = 25

let image2 = Image(width: 83, height: 37, title: "")
//profilePicture = image2     // Error por la forma en que apunta por referencia

let profilePictureCopy = profilePicture
profilePictureCopy.height = 100

// Ambas copias van a tener el mismo heigth porque ambas hacen referencia a la misma clase (slot)
profilePicture.height

// Comparar si una instancia es igual a otra
profilePicture === profilePictureCopy
profilePictureCopy.height



// Herencia de métodos
// MARK: 'final' -> no puede hererdar más cosas (no puede tener hijos)
final class PremiumVideo: Video {
    var drmToken: String = ""
    var ads: [String] = []
    
    override var isHD: Bool {
        get {
           return true
        }
        set { /* Solo si el usuario va a modificar algo */ }
    }
    
    override func display() -> String {
        //"Video premium" // Hacemos un cambio total al método
        super.display() + " Premium"  // Extendemos lo que ya está haciendo el padre
    }
    
    deinit { /* Limpieza de cosas, métodos temporales */ }
}



// MARK: ARC (Automatic Reference Counting)
class Author {
    let name: String
    weak var library: Library?  // Referencia débil para evitar saturar al ARC
    
    init(name: String, library: Library? = nil){
        self.name = name
        self.library = library
    }
}

class Library {
    let id = UUID()
    var curator: Author
    
    init(curator: Author){
        self.curator = curator
    }
}

let Author1 = Author(name: "Juan")
let library = Library(curator: Author1)
Author1.library




class StringClass {
    var value: String
    
    init(_ value: String) {
        self.value = value
    }
    
    func format(using formatter: (Int) -> String) -> String {
        var formattedStr = ""
        for (index, _) in value.enumerated() {
            formattedStr.append(formatter(index))
        }
        return StringClass(formattedStr)
    }
}


class MyUserController {
    var username: StringClass
    
    init(username: String) {
        self.username = StringClass(username)
    }
    
    
    // Closure con referencia fuerte
    func emojifyUsername() {                // Forzamos que no haya referencia fuerte
        username = username.format(using: { [weak self] index in
            self?.emojiBy(idx: index) ?? ""
        })
    }
    
    func emojiBy(idx: Int) -> String {
        return switch idx {
        case 0: "👨‍💻"
        default: "😄"
        }
    }
    
}

let user = MyUserController(username: "Braulio")
user.emojifyUsername()

//: [Next](@next)
