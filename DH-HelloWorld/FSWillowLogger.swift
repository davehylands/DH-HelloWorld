import FullStory
import Willow

func logLevelToFS(logLevel: LogLevel) -> FSEventLogLevel {
    switch logLevel {
      case .error:
          return FSLOG_ERROR
      case .warn:
          return FSLOG_WARNING
      case .debug:
          return FSLOG_DEBUG
      default:
          return FSLOG_INFO
    }
}

open class FSWillowLogger: LogWriter {
    open func writeMessage(_ message: String, logLevel: LogLevel) {
        FS.log(with: logLevelToFS(logLevel: logLevel),  message: message)
    }

    open func writeMessage(_ message: LogMessage, logLevel: LogLevel) {
        let message = "\(message.name): \(message.attributes)"
        FS.log(with: logLevelToFS(logLevel: logLevel),  message: message)
    }
}
