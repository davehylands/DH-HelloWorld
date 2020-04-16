import FullStory
import SwiftyBeaver

func logLevelToFS(logLevel: SwiftyBeaver.Level) -> FSEventLogLevel {
    switch logLevel {
        case .debug:
            return FSLOG_DEBUG
        case .verbose:
            return FSLOG_DEBUG
        case .warning:
            return FSLOG_WARNING
        case .error:
            return FSLOG_ERROR
        default:
            return FSLOG_INFO
    }
}

public class FSSwiftyBeaverDestination: BaseDestination {

    override public func send(_ level: SwiftyBeaver.Level, msg: String, thread: String,
                                file: String, function: String, line: Int, context: Any? = nil) -> String? {
        let formattedString = super.send(level, msg: msg, thread: thread, file: file, function: function, line: line, context: context)

        if let str = formattedString {
            FS.log(with: logLevelToFS(logLevel: level),  message: str)
        }
        return formattedString
    }
}
