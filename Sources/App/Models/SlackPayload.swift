import Foundation
import Vapor

struct SlackPayload : Content
{
    var response_type = "in_channel"
    var text: String?
    var attachments: [SlackAttachment]?
    
    init() { }
}

