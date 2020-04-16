#import <Foundation/Foundation.h>

#define LOG_LEVEL_DEF ddLogLevel
#import "CocoaLumberjack.h"

@interface FSLumberJackLogger : DDAbstractLogger <DDLogger>
{
}
- (DDLoggerName)loggerName;
- (void)logMessage:(DDLogMessage *)logMessage;
@end
