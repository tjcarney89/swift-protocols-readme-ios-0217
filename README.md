# Protocols

![BruceLee](http://i.imgur.com/E6LNCK8.jpg?1)  

> If you always put limit on everything you do, physical or anything else. It will spread into your work and into your life. There are no limits. There are only plateaus, and you must not stay there, you must go beyond them. ~[Bruce Lee](https://en.wikipedia.org/wiki/Bruce_Lee)
 

## Learning Objectives - The student should be able to..

* See detailed outline / notes
* Create a protocol
* Understand the problem they are solving with protocols. 


## What the student can do at this point 

* Create variables and constants
* Is familiar with type annotations, type inference and string interpolation.
* Can create functions with return types.
* Is familiar with the String, Int, Double, and Bool type.
* Can perform arithmetic operations on Int and Double.
* Understands if and else clause statements.
* Can create and use Arrays.
* Can iterate over an Array using a for-in loop.
* Can iterate over an Array calling enumerate().
* Work with the following methods on arrays:
	* append()
	* insert(_:atIndex:)
	* removeAtIndex()
	* subscript syntax with arrays
	* count
	* isEmpty
	* Optionals
* Can work with dictionaries 
* Can iterate over a dictionary
* Knows about optionals (should at this point)
* Can work with Extensions
* Can work with making a Class and Enums

## Outline / Notes

*  Begin the discussion in presenting a problem to the student, a problem that is solved by protocols.
* At this point, they know how to make a Class.
* Begin with showing them the creation of a `Person` Class.

```swift
class Person {
    
    var name: String
    var height: Double
    var favoriteFood: String
    
    init(name: String, height: Double, favoriteFood: String) {
        self.name = name
        self.height = height
        self.favoriteFood = favoriteFood
    }
    
}
```

* When showing them any code, we should be **explicit** in our explanation as to what we are showing them, stepping through each line (even if we did it before and it becomes repetitive). Here we're making a new type named "Person" which is a class.... etc etc.
* What if we wanted to create a `String` which represents a person in text format, that we can either display to a user in our app, or print to console.

```swift
let jim = Person(name: "Jim", height: 64.0, favoriteFood: "Pasta")

let description = "Name: \(jim.name) \nHeight: \(jim.height) \nFavorite Food: \(jim.favoriteFood)"

print(description)
//Name: Jim
//Height: 64.0
//Favorite Food: Pasta
```

* Well.. this seems silly for us to keep doing over and over again if we wanted a text representation of a person. We *could* create a computed read-only property on the `Person` class which returns back a `String` that reads similar to what we created above. Lets do that:

```swift
class Person {
    
    var name: String
    var height: Double
    var favoriteFood: String
    
    var description: String {
        return "Name: \(jim.name) \nHeight: \(jim.height) \nFavorite Food: \(jim.favoriteFood)"
    }
    
    init(name: String, height: Double, favoriteFood: String) {
        self.name = name
        self.height = height
        self.favoriteFood = favoriteFood
    }
    
}
```

* We should be **explicit** and step through what that computed read-only property is doing now and why it's even called that so that way the student sees it again.
* Now we can do this...

```swift
let jim = Person(name: "Jim", height: 64.0, favoriteFood: "Pasta")

print(jim.description)
//Name: Jim
//Height: 64.0
//Favorite Food: Pasta
```

* Well that's much cleaner. But.. now I have a question. If we were tasked with creating many more classes.. an `Alien` class, a `Planet` class, an `Animal` class, etc. etc. We want to make sure each one of these various classes implement this same `description` computed read-only property that the `Person` class implmenets, that way our app can easily display the description of each class in a pretty manner.
* We can create a protocol and have our classes adopt and conform to it. The protocol represents a promise, if our classes adopt this protocol.. they **MUST** adhere to the promise. What does that mean? First.. lets create a protocol.

```swift
protocol PrettyDescription {
    
    var description: String { get }
    
}
```

* Step through again in a very **explicit** manner making no assumptions.
* Show them this:

![animalProtocol](http://i.imgur.com/dvWsTq6.png)

* Again, step through what's going on there making no assumptions.

```swift
class Animal: PrettyDescription {
    
    var name: String
    var height: Double
    var favoriteFood: String
    
    init(name: String, height: Double, favoriteFood: String) {
        self.name = name
        self.height = height
        self.favoriteFood = favoriteFood
    }
    
}
```

* Here we're adopting to this protocol named `PrettyDescription`.... **but** we're not conforming to it (meaning, we're not implementing what it wants us to implement, which is a property named `description` of type `String`). We get this error:

![error](http://i.imgur.com/0fsZSVb.png)

* Continue on with a similar approach showing them functions in the protocol, as well as protocols being a type.

```swift
let prettyThings: [PrettyDescription] = []
```

```swift
for prettyThing in prettyThings {
    
    print(prettyThing.description)
    
}
```

* Maybe not the best example, but you get the idea.




<a href='https://learn.co/lessons/Protocols' data-visibility='hidden'>View this lesson on Learn.co</a>
