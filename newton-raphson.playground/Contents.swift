//: Newton-Raphson

import Foundation

class NewtonRaphson {
    let functionToFindRootsOf: (Double)->Double
    let derivativeOfTheFunction: (Double) -> Double
    let initialGuessForX: Double
    let tolerance: Double
    let maxIterations: Int
    
    // Init if the derivative of the function is provided
    init(functionToFindRootsOf: @escaping (Double)->Double, derivativeOfTheFunction: @escaping (Double) -> Double, initialGuessForX: Double, tolerance: Double, maxIterations: Int) {
        self.functionToFindRootsOf = functionToFindRootsOf
        self.derivativeOfTheFunction = derivativeOfTheFunction
        self.initialGuessForX = initialGuessForX
        self.tolerance = tolerance
        self.maxIterations = maxIterations
    }
    
    // Init if the derivative of the function is not provided - we will approximate the derivative instead
    init(functionToFindRootsOf: @escaping (Double)->Double, initialGuessForX: Double, tolerance: Double, maxIterations: Int) {
        self.functionToFindRootsOf = functionToFindRootsOf
        self.derivativeOfTheFunction = {
            (x:Double) in
            return (functionToFindRootsOf(x+tolerance/5) - functionToFindRootsOf(x-tolerance/5)) / (2*(tolerance/5)) }
        self.initialGuessForX = initialGuessForX
        self.tolerance = tolerance
        self.maxIterations = maxIterations
    }
    
    func solve() -> Double? {
        // If maxIterations is exceeded before a solution within the tolerance is found, then returns nil
        var x = self.initialGuessForX
        for iteration in 1...maxIterations {
            let y = self.functionToFindRootsOf(x)
            let dy = self.derivativeOfTheFunction(x)
            let nextX = x - y / dy
            if (abs(x - nextX) < self.tolerance) {
                print("Solution reached in ", iteration, "iterations")
                return nextX
            }
            x = nextX
        }
        return nil
    }
}

//: Example usage

// A polynomial function
func f(_ x: Double) -> Double {
    return -2*pow(x,4)-8*pow(x,3)+2*pow(x,2)+3*x
}

// Find the roots without knowing the derivative
// The xValuesToTry have been chosen to be near the roots otherwise the Newton-Raphson method may not converge

let xValuesToTry: [Double] = [-5, -1, 0, 1]

for x in xValuesToTry {
    let newton = NewtonRaphson(functionToFindRootsOf: f,
                               initialGuessForX: x,
                               tolerance: 0.0005,
                               maxIterations: 100)
    if let y = newton.solve() {
        print("x = ", y)
    }
    else {
        print ("No value found")
    }
}

// The derivative of that polynomial
func df(_ x: Double) -> Double {
    return -8*pow(x,3)-24*pow(x,2)+4*x+3
}

// Find the roots using the derivative
for x in xValuesToTry {
    let newton = NewtonRaphson(functionToFindRootsOf: f,
                               derivativeOfTheFunction: df,
                               initialGuessForX: x,
                               tolerance: 0.00005,
                               maxIterations: 100)
    if let y = newton.solve() {
        print("x = ", y)
    }
    else {
        print ("No value found")
    }
}

