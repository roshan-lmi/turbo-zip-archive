#import "TurboZipArchive.h"
#import <TurboZipArchive/TurboZipArchive.h>
#import <React/RCTLog.h>

@interface TurboZipArchive() <NativeTurboZipArchiveSpec>
@end


@implementation TurboZipArchive
{
    bool hasListeners;
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeTurboZipArchiveSpecJSI>(params);
}

+ (NSString *)moduleName {
    return @"TurboZipArchive";
}

// Will be called when this module's first listener is added.
-(void)startObserving {
    hasListeners = YES;
    // Set up any upstream listeners or background tasks as necessary
}

// Will be called when this module's last listener is removed, or on dealloc.
-(void)stopObserving {
    hasListeners = NO;
    // Remove upstream listeners, stop unnecessary background tasks
}

- (NSArray<NSString *> *)supportedEvents
{
  return @[@"zipArchiveProgressEvent"];
}

- (NSString *)getGreeting:(NSString *)name {
    return [NSString stringWithFormat: @"Hello, %@!", name];
}

- (NSDictionary *)unzip:(NSString *)from destinationPath:(NSString *)destinationPath charset:(NSString *)charset {
    //    self.progress = 0.0;
    //       self.processedFilePath = @"";
    //       [self zipArchiveProgressEvent:0 total:1]; // force 0%

           NSError *error = nil;

           BOOL success = [SSZipArchive unzipFileAtPath:from toDestination:destinationPath preserveAttributes:NO overwrite:YES password:nil error:&error delegate:nil];

    //       self.progress = 1.0;
    //       [self zipArchiveProgressEvent:1 total:1]; // force 100%

           if (success) {
               return @{
                   @"path": destinationPath
               };
           }
        return  @{
            @"error": [error localizedDescription]
        };
}


@end

