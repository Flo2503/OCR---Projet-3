class CheckName {
    
    private static var nameList = [String]()
    
    static func isValid(name: String) -> Bool {
        if !nameList.contains(name) && !name.isEmpty {
            nameList.append(name)
            return true
        } else {
            return false
        }

    }
    
}
