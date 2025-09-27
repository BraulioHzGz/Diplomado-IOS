//: [Previous](@previous)

func receiveBox(with emoji: String?){
    guard emoji != nil else {
        print("It's empty, You ripped me off!")
        return
    }
    if(emoji == "😺"){
        print("Thanks for my cat Schrödinger!")
    } else {
        print("This ain't a cat!")
    }
}

receiveBox(with: "😺")
receiveBox(with: nil)
receiveBox(with: "lol")

//: [Next](@next)
