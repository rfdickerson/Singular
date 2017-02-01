
import Foundation

public extension Matrix {

    func invert() -> Matrix? {
        
        
        // augment matrix
        let matrix = Matrix(self.rows, self.columns*2)
        for i in 0...self.rows-1 {
            matrix.set(i, i+self.columns,1)
        }
        
        for i in 0...self.rows-1 {
            for j in 0...self.columns-1 {
                matrix.set(i,j,self.get(i,j))
            }
        }
        
        // swap pivot rows
        
        // reduce
        
        // find pivot
        var pivotColumn = 0
        var pivotRow = 0
        
        for i in 0...self.columns {
            if matrix.get(i, pivotRow) != 0 {
                pivotColumn = i
            }
        }
        
        return nil
        
    }
    
}

public func invert(_ matrix: Matrix) -> Matrix? {
    return matrix.invert()
}
