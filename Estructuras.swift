//: [Previous](@previous)
import UIKit

struct WorkoutA {
    let dateAndTime: Date   // Constante no inicializada -> al llamar al struct se debe pasar el parámetro
    
    func summary() -> String {
        return "Workout on \(dateAndTime)"
    }
}

// Creacion de una estructura sin constantes inicializadas
let firstWorkout = WorkoutA(dateAndTime: .now)


struct WorkoutB {
    let date = Date()       // Constante inicializada -> al llamar al struct no se debe pasar parámetros
}

// Creacion de una estructura con constantes inicializadas
let workoutB = WorkoutB()


struct WorkoutC {
    let dateAndTime: Date
    
    // Inicializador -> Constructor
    init(date: Date = Date()) {
        self.dateAndTime = date
    }
}

let workoutC = WorkoutC()                   // Como ya está definido el argumento en el constructor, no es necesarios pasar algo
let workoutC2 = WorkoutC(date: .now)      // Opcional pero cuidando que no falle el inicializador


struct WorkoutD {
    let date: Date
}

extension WorkoutD {        // Extension se usa cuando queremos conservar la estructura base, pero necesitamos agregar cosas
    init() {
        self.date = .now
    }
}

 
struct Workout {
//    var id: UUID {
//        return UUID()
//    }
    let name: String
    var dateAndTime: Date
    var duration: Int = 30 {
        // Observadores
        didSet {        // Almacena la variable nueva, pero guardar la original en una variable auxiliar
            //oldValue -> Variable auxiliar donde está el dato original
            print("Duration changed from \(oldValue) to \(duration)")
        }
        willSet {   // va a capturar antes de didSet
            //newValue -> Variable auxiliar donde está el nuevo valor
            print("Duration will change from \(duration) to \(newValue)")
        }
    }
    var caloriesBurned: Int = 1
    
    // Propiedades  -> Guarda un cálculo (cómo calularlo) pero no el dato en sí
    var insensity: Double {     // No puede ser let porque va a ser un dato cambiante
        guard duration > 0 else {
            return 0
        }
        let caloriesPerMinute = Double(caloriesBurned) / Double(duration)
        return caloriesPerMinute / 15 * 100
    }
    
    func summary() -> String {
        return "Workout: \(name)\nDate: \(dateAndTime)\nDuration: \(duration) minutes\nCalories burned: \(caloriesBurned)"
    }
    
    mutating func extend(by extraMinutes: Int, andCalories extraCalories: Int){
        duration += extraMinutes
        caloriesBurned += extraCalories
    }
}

let morningWorkout = Workout(name: "Morning run", dateAndTime: .now)  // no podemos modificar ningun elemento

var morningWorkout2 = Workout(name: "Morning run", dateAndTime: .now)  // al ser 'var' podemos modificar sus elementos
morningWorkout2.dateAndTime = Date().addingTimeInterval(3600)
//morningWorkout2.name = "Yoga"   // Aquí hay un error porque .name es let, no var

//let morningWorkoutCopy = morningWorkout     // Copia de la instancia original para no dañar datos



//: [Next](@next)
