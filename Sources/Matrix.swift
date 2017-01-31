
public final class Matrix {

    var values: [Float]
    
    var rows: Int
    var columns: Int
    
    public init(_ rows: Int, _ columns: Int) {
        
        self.rows = rows
        self.columns = columns
        self.values = [Float](repeating: 0, count: rows * columns)
        
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
