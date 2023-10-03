//Lecture 5 - Functions & Closures
import UIKit
task(for: 1, exercise: "შექმენით function რომლის მეშვეობითაც გამოითვლით ფაქტორიალს. function იღებს ერთ Int ტიპის ცვლადს და აბრუნებს ფაქტორიალს, ანუ მაგალითად თუ გადავაწვდით 5-იანს function-მა უნდა დაგვიბრუნოს 120 რომელიც მიიღო შემდეგი გამოთვლის შედეგად 5*4*3*2*1. არ გამოიყენოთ მზა ფუნქციები.") {
    func numberFactorial(number: Int) -> Int {
        //the factorial is a product of a positive integer, so we need a safe check:
        if number < 0 {
            print("Error -1: the number must be a positive integer")
            return -1
        }
        var result = 1 // starting from 1
        // as 0! = 1, to save the program from crashing:
        if number == 0 {
            return 1
        }
        // iteration through the all numbers less than or equal to a given number: from 1 to argument number (inclusive)
        for i in 1...number {
            result *= i // to generate the factorial
        }
        return result
    }
    numberFactorial(number: -5) //120
}

task(for: 2, exercise: "შექმენით function რომელიც აგენერირებს ფიბონაჩის პირველ 20 რიცხვს. არ გამოიყენოთ მზა ფუნქციები.") {
    //ამ თანმიმდევრობაში ყოველი შემდეგი რიცხვი არის მის წინ მდებარე ორი რიცხვის ჯამის ტოლი.
    
    //function that calculates Fibonacci numbers
    func calculateFibonacciNumber(number: inout Int) -> [Int] {
        
        //F(0) = 0, F(1) = 1
        if number <= 0 {
            return [0]
        } else if number == 1 {
            return [1]
        }
        var arrayOfFibonacciNumbers: [Int] = []
        var previousFibNumber = 0
        var currentFibNumber = 1
        
        //iteration for 20 times
        for _ in 1...number {
            arrayOfFibonacciNumbers.append(previousFibNumber)
            let temporaryFibNumber = previousFibNumber + currentFibNumber // temporary constant to save a sum of previous 2 numbers
            previousFibNumber = currentFibNumber // swap number from previous to current
            currentFibNumber = temporaryFibNumber // swap number from current to a sum
        }
        return arrayOfFibonacciNumbers
        
    }
    
    var numberToCalculate = 20 // because only variables can be passed as the argument for an in-out parameters
    print(calculateFibonacciNumber(number: &numberToCalculate))
    
}


task(for: 3, exercise: "შექმენით function რომელიც მიიღებს String-ს, function-მა უნდა შეამოწმოს პალინდრომია (წინიდანაც და უკნიდანაც იკითხება ერთნაირად) თუ არა ეს String-ი. მაგალითად 'racecar' ამ შემთხვევაში ფუნქციამ უნდა დააბრუნოს true. არ გამოიყენოთ მზა ფუნქციები. შეგიძლიათ მეორე solution-ი მზა ფუნქციის გამოყენებით გვაჩვენოთ.") {
    //solution #1
    func checkIfPalindrome1(word: String) -> Bool {
        var wordReversed = ""
        for character in word {
            wordReversed.insert(contentsOf: String(character), at: wordReversed.startIndex)
        }
        return word == wordReversed
    }
    checkIfPalindrome1(word: "racecar")
    checkIfPalindrome1(word: "wow")
    checkIfPalindrome1(word: "kayak")
    checkIfPalindrome1(word: "stop")
    
    //solution #2
    func checkIfPalindrome2(word: String) -> Bool {
        if word == String(word.reversed()) {
            return true
        } else {
            return false
        }
    }
    checkIfPalindrome2(word: "racecar")
    checkIfPalindrome2(word: "radar")
    checkIfPalindrome2(word: "madam")
    checkIfPalindrome2(word: "go")
}


task(for: 4, exercise: "შექმენით function რომელიც გადაცემულ რიცხვების array-ს ააკვარდატებს, დაპრინტავს და დააბრუნებს მნიშვნელობას.") {
    //solution #1
    func squareNumber(array: [Int]) -> [Int]? {
        var squaredNumbers: [Int] = []
        // to handle an empty array safely:
        if array.isEmpty { return nil }
        // iteration through elements (without using their index)
        for element in array {
            squaredNumbers.append(element * element)
        }
        return squaredNumbers
    }
    // using optional binding to check whether the function returns Int or nil:
    if let result = squareNumber(array: [2, 4, 6, 8, 10]) {
        print(result)
    } else {
        print("Error: the input array is empty")
    }
    
    //solution #2 - passing a function to a .map()
    let array = [2, 4, 6, 8, 10]
    func returnSquareNumbers(number: Int) -> Int {
        return number * number
    }
    print(array.map(returnSquareNumbers)) // returns an array containing the transformed elements of the sequence
    
    //solution #3 - passing a closure to a .map()
    let array2 = [2, 4, 6, 8, 10]
    let squareArray = array2.map{ $0 * $0 } // returns an array containing the transformed elements of the sequence
    print(squareArray)
}



task(for: 5, exercise: "შექმენით function რომელიც დაითვლის სიტყვების რაოდენობას String-ში, ფუნქციამ უნდა მიიღოს String-ი, და დააბრუნოს dictionary, სიტყვებით და იმ რაოდენობით რამდენჯერ იყო ერთი და იგივე სიტყვა გამოყენებული String-ში. uppercase და lowercase ასოები უნდა იყოს დაჰენდლილი ერთნაირად, მაგალითად თუ function-s გადავაწვდით 'TBC x USAID, tbc it academy, we are in TBC academy.' function-მა უნდა დააბრუნოს '['tbc': 3, 'academy': 2, 'we': 1, 'are': 1, 'in': 1, 'it': 1, 'x': 1]'.") {
    
    //a poem by Sylvia Plath
    let poem = """
                I have no wit, I have no words, no tears;
                My heart within me like a stoneIs numbed too much for hopes or fears;
                Look right, look left, I dwell alone;
                A lift mine eyes, but dimmed with grief;
                No everlasting hills I see; My life is like the falling leaf;
                O Jesus, quicken me.
    """
    
    func makeDictionary(poem: String) -> [String: Int] {
        let poemLowercased = poem.lowercased()
        let words = poemLowercased.components(separatedBy: " ").filter{ !$0.isEmpty }
        
        var convertStringToDictionary: [String: Int] = [:]
        for word in words {
            let onlyLetters = word.trimmingCharacters(in: .punctuationCharacters)
            if let counter = convertStringToDictionary[onlyLetters] {
                convertStringToDictionary[onlyLetters] = counter + 1
            } else {
                convertStringToDictionary[onlyLetters] = 1
            }
        }
        return convertStringToDictionary
    }
    let poemDictionary = makeDictionary(poem: poem)
    print(poemDictionary)
}


task(for: 6, exercise: "შექმენით Closure რომელსაც გადაეცემა რიცხვი და დააბრუნებს ამ რიცხვის ორობით ჩანაწერს.") {
    let poitiveIntToBinary: (Int) -> String = { number in
        
        if number < 0 {
            print("Error -1: the number must be a positive integer")
        }
        
        var number = number
        var binaryString = ""
        while number > 0 {
            binaryString = "\(number % 2)" + binaryString // calculating the remainder. 0 = 0; 1 = 1
            number /= 2 // deviding the number by 2 and reassigning a new value to the variable
        }
        
        if binaryString.isEmpty {
            return "0"
        }
        return binaryString
    }
    poitiveIntToBinary(0)
    poitiveIntToBinary(50)
    poitiveIntToBinary(33)
}


task(for: 7, exercise: "შექმენით Closure რომელიც გაფილტრავს(ანუ წაშლის) კენტ რიცხვებს Int-ების Array-დან.") {
    let integers = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
    let removeOdds = integers.filter { $0 % 2 == 0 } // returns a new array containing only the even values
    print(removeOdds)
}


task(for: 8, exercise: "შექმენით Closure რომელიც დამაპავს(ანუ გააკეთებს ქმედებას ყველა მასივის ელემენტზე) Int-ების Array-ის და თითოეულ ელემენტს გაათმაგებს.") {
    let integers = [1, 2, 10, 20, 4, 6, 40, 60]
    let tenfold = integers.map { $0 * 10 } // shorthand argument names in inline closure
    print(tenfold)
}


task(for: 9, exercise: "გამოიყენეთ escaping closure სადაც 3 წამის შემდეგ დაბეჭდავს ჩაწოდებული მასივის ჯამს.") {
    func calculation(array: [Int], completion: @escaping (Int) -> Void) {
        let seconds = 3.0
        //schedule tasks for serial execution
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) {
            var sum = 0
            for element in array {
                sum += element
            }
            completion(sum)
        }
    }
    calculation(array: [2, 2, 2]) { sum in
        print("The sum is: \(sum)")
    }
}

task(for: 10, exercise: "function-ს გადავცეთ String-ების array და დაგვიბრუნოს მხოლოდ კენტი რიცხვების მასივი. გამოიყენეთ high order functions.") {
    
    func filterOddNumbers(in strings: [String]) -> [Int] {
        let numbers = strings.compactMap { Int($0) } // converting strings to integers. returns non-nil values
        let oddNumbers = numbers.filter { $0 % 2 != 0 } // check for odd numbers & filter
        return oddNumbers
    }
    let strings = ["2", "7", "Eight", "//4", "One", "3", "Five", "5"]
    let oddNubers = filterOddNumbers(in: strings)
    print(oddNubers)
}
