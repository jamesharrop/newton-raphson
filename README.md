# Newton-Raphson
A basic Swift implementation of the Newton-Raphson method for finding the roots of a mathematical function.

The derivative of the function can be provided - but if not, a numerical approximation will be made.

## Example usage (see playground for more details)

```swift
    let newton = NewtonRaphson(functionToFindRootsOf: f,
                               initialGuessForX: x,
                               tolerance: 0.0005,
                               maxIterations: 100)

    if let y = newton.solve() { print("x = ", y) }
```
