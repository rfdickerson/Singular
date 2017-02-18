
import Foundation

public func * (left: Matrix, right: Matrix) -> Matrix {
    
    assert(left.columns == right.rows)
    
    let matrix = Matrix(left.rows, right.columns)
    
    for i in 0...left.rows-1 {
        for j in 0...right.columns-1 {
            
            var x: Float = 0.0
            
            for k in 0...left.columns-1 {
                x += left.get(i, k) * right.get(k, j)
            }
            
            matrix.set(i, j, x)
        }
    }
    
    return matrix
    
}


public func - (left: Matrix, right: Matrix) -> Matrix {
    
    assert(left.columns == right.columns && left.rows == right.rows)
    
    let matrix = Matrix(left.rows, right.columns)
    
    for i in 0...left.rows-1 {
        for j in 0...left.columns-1 {
            let a = left.get(i, j) - right.get(i, j)
            matrix.set(i, j, a)
        }
    }
    
    return matrix
    
}

public func + (left: Matrix, right: Matrix) -> Matrix {
    
    assert(left.columns == right.columns && left.rows == right.rows)
    
    let matrix = Matrix(left.rows, right.columns)
    
    for i in 0...left.rows-1 {
        for j in 0...left.columns-1 {
            let a = left.get(i, j) + right.get(i, j)
            matrix.set(i, j, a)
        }
    }
    
    return matrix
    
}

public func * (left: Float, right: Matrix) -> Matrix {
    

    let matrix = Matrix(right.rows, right.columns)
    
    for i in 0...right.rows-1 {
        for j in 0...right.columns-1 {
            let a = left * right.get(i, j)
            matrix.set(i, j, a)
        }
    }
    
    return matrix
    
}

public func == (left: Matrix, right: Matrix) -> Bool {
    return left.values == right.values
}
