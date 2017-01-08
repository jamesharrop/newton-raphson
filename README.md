# newton-raphson
A basic Swift implementation of the Newton-Raphson method for finding the roots of a mathematical function.

Example usage:

    let newton = NewtonRaphson(functionToFindRootsOf: f,
                               derivativeOfTheFunction: df,
                               initialGuessForX: x,
                               tolerance: 0.00005,
                               maxIterations: 100)

    if let y = newton.solve() {
        print("x = ", y)
    }


If the derivative is not known then it will be approximated numerically instead.

## Example usage

```swift
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
```

