
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
    
    public static func eye(_ rows: Int) -> Matrix {
        
        let matrix = Matrix( rows, rows )
        
        for i in 0...rows-1 {
            matrix.set(i,i,1)
        }
        
        return matrix
        
    }

    public static func ones(_ rows: Int, _ columns: Int) -> Matrix {

        assert(rows > 0 && columns > 0)

        let matrix = Matrix( rows, rows )
        
        for i in 0...rows-1 {
            for j in 0...columns-1 {
                matrix.set(i,j,1)
            }
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




extension Matrix: CustomDebugStringConvertible {
    public var debugDescription: String {
        var output: String = ""
        for i in 0...self.rows-1 {
            for j in 0...self.columns-1 {
                let value = self.get(i, j)
                output += "\(value) "
            }
            output += "\n"
        }
        
        return output
    }
}
