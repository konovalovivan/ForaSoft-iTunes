import Foundation

protocol GETPOST {
    static func get(_ urlStr: String, _ completion: @escaping ((Data?)->()))
    static func post(_ urlStr: String, postbody: [String:Any], _ completion: ((Data?)->())?)
}
