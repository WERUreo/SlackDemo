import Foundation
import Vapor

struct SlackAttachment : Content
{
    var color: String?
    var title: String?
    
    init() {}
}

