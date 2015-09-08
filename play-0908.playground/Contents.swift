var score : Int?

println("Score is \(score)")

//score = 120

if score != nil{
    println("somthing is inside")
} else {
    println("score is empty")
}


if let currentScore = score {
    println("My current score is \(currentScore)")
}

func sayHello(first: String, last:String){
    println("hello class")
    println("Hi \(first), \(last)")
}

sayHello("bill", "hello")

func sayWhat(firstName first:String, lastName last:String){
    println("What \(first), \(last)")
}

sayWhat(firstName: "Joe", lastName: "Adams")

func sayWhy(#firstname:String, #lastName:String) -> String{
    return "Why " + firstname + " " + lastName + "?"
}

sayWhy(firstname: "me", lastName: "you")


class Vehicle {
    var wheelBum = 4
}