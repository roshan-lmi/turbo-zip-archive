#import "TurboZipArchive.h"
#import <TurboZipArchive/TurboZipArchive.h>
#import <React/RCTLog.h>

@interface TurboZipArchive() <NativeTurboZipArchiveSpec>
@end


@implementation TurboZipArchive
{
}

- (std::shared_ptr<facebook::react::TurboModule>)getTurboModule:(const facebook::react::ObjCTurboModule::InitParams &)params
{
    return std::make_shared<facebook::react::NativeTurboZipArchiveSpecJSI>(params);
}

+ (NSString *)moduleName {
    return @"TurboZipArchive";
}


- (NSArray<NSString *> *)supportedEvents
{
  return @[@"zipArchiveProgressEvent"];
}

- (NSString *)getGreeting:(NSString *)name {
    return [NSString stringWithFormat: @"Hello, %@!", name];
}

- (NSDictionary *)unzip:(NSString *)from destinationPath:(NSString *)destinationPath charset:(NSString *)charset {


     NSError *error = nil;

     BOOL success = [SSZipArchive unzipFileAtPath:from toDestination:destinationPath preserveAttributes:NO overwrite:YES password:nil error:&error delegate:nil];
    
    if(success){
        return @{
            @"path": destinationPath
        };
    }
    
    return @{
        @"error": [error localizedDescription]
    };
}



@end

