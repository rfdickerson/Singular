
import Foundation

public final class Matrix: Equatable {

    var values: [Float]
    
    var rows: Int
    var columns: Int
    
    public init(_ rows: Int, _ columns: Int) {
        
        self.rows = rows
        self.columns = columns
        self.values = [Float](repeating: 0, count: rows * columns)
        
    }
    
    public convenience init(_ scalars: [[Float]]) {
        
        var numCols = 0
        
        let numRows = scalars.count
        
        for row in scalars {
            numCols = row.count
        }
        
        self.init(numRows, numCols)
        
        for i in 0...rows-1 {
            for j in 0...columns-1 {
                set(i, j, scalars[i][j])
            }
        }

        
    }
    
    public static func createIdentity(_ rows: Int) -> Matrix {
        
        let matrix = Matrix( rows, rows )
        
        for i in 0...rows-1 {
            matrix.set(i,i,1)
        }
        
        return matrix
        
    }
    
    public func get(_ m: Int, _ n: Int) -> Float {
    
        assert( m * n <= values.count )
    
        return values[rows * n + m]
    }
    
    public func set(_ m: Int, _ n: Int, _ value: Float) {
        
        assert( m * n <= values.count )
        
        values[rows * n + m] = value
    }
    
    
}


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

public func == (left: Matrix, right: Matrix) -> Bool {
    return left.values == right.values
}
