
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
        
        for i in 0...self.columns-1 {
            
            // find a pivot
            var pivotRow = 0
            var pivotValue: Float = 1
            
            for j in 0...self.rows-1 {
                let value = matrix.get(j, i)
                if value != 0 {
                    pivotRow = j
                    pivotValue = value
                    break
                }
            }
            
            // divide the row by pivot
            
            for i2 in 0...matrix.columns-1 {
                let currentValue = matrix.get(pivotRow, i2)
                matrix.set(pivotRow, i2, currentValue/pivotValue)
            }
            
        }
        
        print(matrix)
        // print("Pivot column \(pivotColumn)")
        
    
        
        return nil
        
    }
    
}

public func invert(_ matrix: Matrix) -> Matrix? {
    return matrix.invert()
}
