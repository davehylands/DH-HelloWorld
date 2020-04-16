#import "FSLumberJackLogger.h"

@implementation FSLumberJackLogger

- (DDLoggerName)loggerName {
  return @"com.fullstory.logger";
}

- (void)logMessage:(DDLogMessage *)logMessage {
    NSString *logMsg = logMessage.message;

    if (self->logFormatter)
        logMsg = [self->logFormatter formatLogMessage:logMessage];
    if (logMsg) {
        FSEventLogLevel logLevel = FSLOG_DEBUG;
        switch (logMsg->_flag) {
            case DDLogFlagError:
                logLevel = FSLOG_ERROR;
                break;
            case DDLogFlagWarning:
                logLevel = FSLOG_WARNING;
                break;
            case DDLogFlagInfo:
                logLevel = FSLOG_INFO;
                break;
            case DDLogFlagDebug:  // fall thru
            default:
                logLevel = FSLOG_INFO;
                break;
        }
        [FS logWithLevel:logLevel format:@"%@", logMsg->_message];
    }
}

@end
