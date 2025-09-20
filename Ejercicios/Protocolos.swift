protocol TabularDataSource {
    var numberOfRow: Int { get }
    var numberOfColumns: Int { get }
    
    func label(forColumn column: Int) -> String
    func itemForRow(row: Int, column: Int) -> String
}

struct Person {
    let name: String
    let age: Int
    let yearsOfExperience: Int
}

struct Department: TabularDataSource {
    var numberOfRow: Int { people.count }
    
    var numberOfColumns: Int { 3 }
    
    func label(forColumn column: Int) -> String {
        let label: String
        
        switch column {
        case 0: label = "Employee name"
        case 1: label = "Age"
        case 2: label = "Years of experience"
        default: fatalError("A department should only have 3 columns")
        }
        
        return label
    }
    
    func itemForRow(row: Int, column: Int) -> String {
        let person = people[row]
        let item: String
        
        switch column {
        case 0: item = person.name
        case 1: item = "\(person.age)"
        case 2: item = "\(person.yearsOfExperience)"
        default: fatalError("Invalid row: \(row), column: \(column) combination")
        }
        
        return item
    }
    
    let name: String
    var people: [Person] = []
    init(name: String) {
        self.name = name
    }
    
    mutating func add(_ person: Person) {
        people.append(person)
    }
}

var department = Department(name: "Engineering")
department.add(Person(name: "Eva", age: 30, yearsOfExperience: 6))
department.add(Person(name: "Salem", age: 40, yearsOfExperience: 8))
department.add(Person(name: "Andres", age: 50, yearsOfExperience: 10))
department.add(Person(name: "Braulio Hernández González", age: 24, yearsOfExperience: 5))
department.add(Person(name: "Silverio Pérez", age: 1000, yearsOfExperience: 5))

//func printTable(_ dataSource: TabularDataSource) {
//    var headerRow = "|"
//    var columnWidths = [Int]()
//    
//    for columnIndex in 0..<dataSource.numberOfColumns {
//        let columnLabel = dataSource.label(forColumn: columnIndex)
//        var maxLengthOfLabel = columnLabel.count
//        
//        let columnHeader = " \(columnLabel) |"
//        headerRow += columnHeader
//        
//        columnWidths.append(columnHeader.count)
//    }
//    
//    print(headerRow)
//    
//    for rowIndex in 0..<dataSource.numberOfRow {
//        var output = "|"
//        for rowColumnIndex in 0..<dataSource.numberOfColumns {
//            let item = dataSource.itemForRow(row: rowIndex, column: rowColumnIndex)
//            var paddingNeeded = 0
//            
//            if(item.count > columnWidths[rowColumnIndex] - item.count - 2){
//                paddingNeeded = item.count
//            } else {
//                paddingNeeded = columnWidths[rowColumnIndex] - item.count - 2
//            }
//            let padding = repeatElement(" ", count: paddingNeeded).joined(separator: "")
//            
//            output += " \(item)\(padding)|"
//        }
//        print(output)
//    }
//}

func printTable(_ dataSource: TabularDataSource) {
    var headerRow = "|"
    var columnWidths = [Int]()
    
    for columnIndex in 0..<dataSource.numberOfColumns {
        let columnLabel = dataSource.label(forColumn: columnIndex)
        var maxWidth = columnLabel.count

        for rowIndex in 0..<dataSource.numberOfRow {
            let item = dataSource.itemForRow(row: rowIndex, column: columnIndex)
            if item.count > maxWidth {
                maxWidth = item.count
            }
        }
        
        columnWidths.append(maxWidth)
    }
    
    for columnIndex in 0..<dataSource.numberOfColumns {
        let label = dataSource.label(forColumn: columnIndex)
        let paddingNeeded = columnWidths[columnIndex] - label.count
        let padding = String(repeating: " ", count: paddingNeeded)
        headerRow += " \(label)\(padding) |"
    }
    
    print(headerRow)
    
    for rowIndex in 0..<dataSource.numberOfRow {
        var output = "|"
        
        for columnIndex in 0..<dataSource.numberOfColumns {
            let item = dataSource.itemForRow(row: rowIndex, column: columnIndex)
            let paddingNeeded = columnWidths[columnIndex] - item.count
            let padding = String(repeating: " ", count: paddingNeeded)
            
            output += " \(item)\(padding) |"
        }
        
        print(output)
    }
}


printTable(department)


/* 2️⃣ */
// MARK: Ejercicio 2

struct Book {
    let title: String
    let author: String
    let averageReview: Int
}

struct BookCollection: TabularDataSource {
    var numberOfRow: Int { books.count }
    
    var numberOfColumns: Int { 3 }
    
    func label(forColumn column: Int) -> String {
        let label: String
        
        switch column {
            case 0: label = "Title of book"
            case 1: label = "Authors"
            case 2: label = "Average Review"
            default: fatalError("A book should only have 3 columns")
        }
        
        return label
    }
    
    func itemForRow(row: Int, column: Int) -> String {
        let book = books[row]
        var item: String
        
        switch column {
            case 0: item = book.title
            case 1: item = book.author
            case 2: item = String(book.averageReview)
            default: fatalError("A book should only have 3 columns")
        }
        
        return item
    }
    
    let bookName: String
    var books: [Book] = []
    
    init(bookName: String){
        self.bookName = bookName
    }
    
    mutating func addBook(_ book: Book){
        books.append(book)
    }
}

var bookCollection = BookCollection(bookName: "My Favorite Books")
bookCollection.addBook(Book(title: "La divina comedia", author: "Dante Aligheri", averageReview: 100))
bookCollection.addBook(Book(title: "Libro 2", author: "Desconocido", averageReview: 50))
bookCollection.addBook(Book(title: "Libro 3", author: "Otro autor", averageReview: 20))

print("\n\n\n")
printTable(bookCollection)


// MARK: Ejercicio 1 de extensiones
print("\n\n\n")
extension Department: CustomStringConvertible {
    public var description: String {
        return "The department name is: \(name)"
    }
}

print(department)
