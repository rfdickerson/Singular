
import Foundation

public extension Matrix {

    func invert() -> Matrix? {
        
        print(self)
        
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
            var maxValue = -Float.infinity
            
            for j in 0...self.rows-1 {
                let value = matrix.get(j, i)
                if value != 0 {
                    if maxValue < value {
                        pivotRow = j
                        pivotValue = value
                        maxValue = value
                    }
                }
            }
            
            // exchange the rows
            for j in 0...matrix.columns-1 {
                let temp = matrix.get(pivotRow, j)
                let temp2 = matrix.get(i, j)
                matrix.set(i, j, temp)
                matrix.set(pivotRow, j, temp2)
            }
            
            // divide the row by pivot
            
            for i2 in 0...matrix.columns-1 {
                let currentValue = matrix.get(pivotRow, i2)
                matrix.set(pivotRow, i2, currentValue/pivotValue)
            }
            
            // subtract out multiples
            
            for i2 in 0...matrix.rows-1 {
                if i2 != pivotRow {
                    
                    let multiple = matrix.get(i2, i)
                    
                    for c in 0...matrix.columns-1 {
                        let a = matrix.get(pivotRow, c)
                        let b = matrix.get(i2, c)
                        matrix.set(i2, c, b - multiple*a)
                    }
                    
                }
            }
            
            
           print(matrix)
        }
        
        
        // print("Pivot column \(pivotColumn)")
        
    
        
        return nil
        
    }
    
}

public func invert(_ matrix: Matrix) -> Matrix? {
    return matrix.invert()
}
