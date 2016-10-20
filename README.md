# Protocols

![BruceLee](http://i.imgur.com/E6LNCK8.jpg?1)  

> If you always put limit on everything you do, physical or anything else. It will spread into your work and into your life. There are no limits. There are only plateaus, and you must not stay there, you must go beyond them. ~[Bruce Lee](https://en.wikipedia.org/wiki/Bruce_Lee)
 
## Overview

In this lesson we'll work with protocols and explore the problems they help solve. 

## Learning Objectives

* Create a protocol and explain its relationship to classes
* Use functions in protocols 

## Classes
Just as in any object-oriented programming language, classes in Swift encapsulate data and functionality. In practical terms, that means properties that are variables (`var`) and constants (`let`) as well as methods. (Class methods are functions that are declared within a class. Functions can also be declared outside of classes.)


## Create a New Class - Person
You can create a Person class.

Encapsulated in that class will be three properties: name, height, and favoriteFood. Here are the property declarations:

```swift
	var name: String
	var height: Double
	var favoriteFood: String
```

You must provide some way of initializing those properties.  You could do that by declaring default values such as 

```swift
	var name: String = ""
```

It is more useful in many cases to provide a way for users to set initial values with an `init` method. Here’s what that looks like:

```swift
	init(name: String, height: Double, favoriteFood: String) {
       		self.name = name
       		self.height = height
       		self.favoriteFood = favoriteFood
    	}
   ```
   

Your Person class now looks like this.

```swift

	class Person {

    	// here are the properties
    		var name: String
    		var height: Double
    		var favoriteFood: String

    	// here is the initializer method
    		init(name: String, height: Double, favoriteFood: String) {
        		self.name = name
        		self.height = height
        		self.favoriteFood = favoriteFood
    		}
}

```


## Create a Text Description Computed Variable for your Person Class
How do you know that this works? How can you see what you’ve created? One way is to add a new property to the class.  Call it `textDescription` (because that’s what it will be). Here’s how you create that variable in your Class definition:

```swift		
	var textDescription: String {
		return "Name: \(self.name) \nHeight: \(self.height) \nFavorite Food: \(self.favoriteFood)"
	}
 ```
 
## Create an Instance of the Person Class
Now, you can create an instance of the class, and it will have the `textDescription` variable created automatically from the values you supply for the class. Here’s how you create an instance of the class, and then print `textDescription`.

```swift
	let jim = Person(name: "Jim", height: 6.0, favoriteFood: “Pasta")
	print (jim.textDescription)
```
Here’s the result

```swift
	// Name: Jim Height: 6.0 Favorite Food: Pasta
```

## Generalizing the Person Class
You can use this as a model for all sorts of other classes: Dog, Cat, Building, Car, or anything you want. Just declare the class, declare the relevant variables, build the initializer, and create a `textDescription` variable that you lets you print out the data inside the class.

Of course, the actual properties inside these other classes will vary. For example, if you create a Building class, here’s what you might need. Instead of name, you might need address. Height will be ok — both people and buildings have height. Buildings don’t have favorite foods, so you might just omit that. Here’s what you get when you create a Building class with address and height:

```swift
	class Building {

    	// here are the properties
    		var address: String
    		var height: Double
		var textDescription: String {
        		return "Address: \(self.address) \nHeight: \(self.height)"
    		}

    	// here is the initializer method
    		init(address: String, height: Double) {
        		self.address = name
        		self.height = height
   		}
	}
```

Here is an example of instantiating an instance of Building (a library in this case).

```swift
	let library = Building(address: “Main Street", height: 20.0)

	print(text.Description)
		//Address: Main Street
		//Height: 20.0
```

This patterns lets you create all sorts of classes for all sorts of objects. You simply declare the relevant properties and set them in the `init` method. As long as you remember to always implement the code for textDescription, you’ll always be able to get a text version of the data in any of your class instances.

## Customizing 	`textDescription` for Each Class with a Protocol
This is the declaration of `textDescription` that you have to customize each time, but once you do that, you’ll always have it ready when you need to print it out or display it. You just have to remember to declare `textDescription`.

You don’t have to make mental notes or keep a list of reminders for each class you create: you can use a *protocol* to specify that your class must be able to return a `textDescription` property. You still have to write the specific `textDescription` code in each class, but once you’re done that, you can always write

```swift
	print (myDog.textDescription)
	print (myBuilding.textDescription)
```

and so forth without going back to check on the details of what you’ve written.

Here’s how you specify a protocol that helps you provide this functionality.

There are three steps - declaring the protocol, adopting it in your class declaration, and conforming to it with your class code.

1.	You declare the protocol. In this case, the protocol declares that there will be a textDescription property in your class.
2. 	You adopt the protocol in your class. 
3. 	You conform to the protocol. This means that you provide the properties and methods that the protocol requires. In this case, there’s only one property—`textDescription`.

Here’s how you do this.

### 1. Declaring the protocol. 
The protocol declaration will look like this:

```swift
	protocol TextDescription {

    		var textDescription: String { get }

	}
		
```

This declares a protocol and gives it a name — `TextClass Description`. The protocol declares that you will implement any and all properties and methods that it declares. In this case, there is only one property: `textDescription`. There can be several, and in some cases, you can make some of them optional but that’s for later on.

> Protocol names are always capitalized just as class names are. In the code shown here, remember that the protocol named `TextDescription` (capitalized) contains a variable `textDescription` that is lower-case. The protocol can contain many variables and even functions (functions in a protocol are for later on). The name of the protocol itself is separate from the names of the variables and functions within it.

### 2.  Adopting the protocol.

In your Class declaration, you *adopt* the protocol. Right now, the class declaration looks like this

```swift
	class Person {
```

Add the protocol so that it reads:

```swift
	class Person: TextDescription {
```

### 3. Conforming to the protocol 
Conforming to a protocol means writing the code that implements it. In this case, you already have the code:

In the `Person` class:

```swift
	var textDescription: String {
       		return "Name: \(self.name) \nHeight: \(self.height) \nFavorite Food: \(self.favoriteFood)"
    	}
```

For the `Building` class:

```swift
	var textDescription: String {
       		return "Address: \(self.address) \nHeight: \(self.height)"
    	}
```

This means that when you put the class declaration, the protocol adoption, and the protocol conformance (implementation) together, here is what you get for `Person`:

```swift
	class Person: TextDescription {

    	// here are the properties
		var name: String
		var height: Double
		var favoriteFood: String

	// this computed property implements the TextDescription protocol
		var textDescription: String {
		return "Name: \(self.name) \nHeight: \(self.height) \nFavorite Food: \(self.favoriteFood)"
	}

	// here is the initializer method
	init(name: String, height: Double, favoriteFood: String) {
       		self.name = name
       		self.height = height
       		self.favoriteFood = favoriteFood
	}
}
```

Here is what you get for `Building` when the TextDescription protocol is adopted and implemented:
```swift
	class Building: TextDescription {

	// here are the properties
		var address: String
		var height: Double
		var textDescription: String {
      			return "Address: \(self.address) \nHeight: \(self.height)"
		}

	// here is the initializer method
		init(address: String, height: Double) {
       			self.address = name
       			self.height = height
		}
	}
```

Declaring and using protocols means that you are structuring your code a bit more, and every time you structure code, you make it more robust. For example, if you adopt a protocol in your class declaration and don’t implement it, you’ll get a compiler error. 

If you forget the declaration of the protocol and attempt to use it, you'll get the error, "Use of undeclared type 'TextDescription'" as you see here.

> Advanced. Although the protocol is not declared yet, protocols are types, just like classes and some other Swift language constructs. Thus, the error message correctly tells you that you've used an undeclared type because according to the Swift syntax, what's undeclared could be any type — a protocol or a class for a superclass. 

Also, you won’t wind up with a variety of properties such as `buildingTextDescription`, `personData`, and the like which all do the same sort of thing. Every class that conforms to `TextClassDescription` will have a property called `textDescription`. It’s your responsibility to make certain that it provides appropriate information, but you won’t be able to get mixed up and provide a `textDescription` for Person that uses address (that’s because address isn’t a property of Person and you can’t access it — you’ll get a compiler error).

You can construct a variety of protocols and use them as appropriate. For example, you could create a protocol for Person that calculates age. That protocol can also be used for Building. When you explore the Cocoa and Cocoa Touch frameworks, you'll see that in addition to the inheritance that is part of all object-oriented programming languages, you have multiple protocols that are used to construct the useful classes you use in your development. 

> Top-Tip: As you use the Cocoa and Cocoa Touch frameworks, notice the protocols that are used in the frameworks and in the sample code from developer.apple.com. Get used to how they fit together. When you use them in the frameworks or sample code, you  often don't pay much attention to them: the objects you work with are built using class inheritance as well as protocols. As you explore the protocols you use every day, think about how they are used to build the complex classes. You can repeat those design patterns in your own code.

<a href='https://learn.co/lessons/Protocols' data-visibility='hidden'>View this lesson on Learn.co</a>
