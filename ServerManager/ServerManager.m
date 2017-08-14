//
//  ServerManager.m
//  MVVM_NonReactive
//
//  Created by Uber on 27/07/2017.
//  Copyright © 2017 Uber. All rights reserved.
//

#import "ServerManager.h"

// Models
#import "WorkerFull.h"
#import "WorkerShort.h"
#import "FEMDeserializer.h"


@interface ServerManager ()

@property (strong, nonatomic) AFHTTPSessionManager *manager;
@property (strong, nonatomic) dispatch_queue_t requestQueue;


@end


@implementation ServerManager

+ (ServerManager*) sharedManager
{
    
    static ServerManager* manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[ServerManager alloc] init];
    });
    return manager;
}

- (instancetype)init
{
    
    self = [super init];
    if (self)
    {
        self.requestQueue = dispatch_queue_create("MVVM_NonReactive.request", DISPATCH_QUEUE_PRIORITY_DEFAULT);
        
        self.manager = [[AFHTTPSessionManager alloc]initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        self.manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain", @"application/json", @"text/json",@"text/html", nil];
    }
    return self;
}


//----- Get Accounts login & password -----//
- (void) getAccountsData:(void(^)(NSDictionary* dictWithLoginAndPassword)) success
               onFailure:(void(^)(NSError* errorBlock,  NSInteger statusCode)) failure
{
    
    [self.manager GET:@"https://raw.githubusercontent.com/HackDeveloperUA/JSON-ForExampleProjects/master/accountsData.json"
           parameters:nil
             progress:nil
              success:^(NSURLSessionDataTask* task, NSDictionary* responseObject) {
                  
                  NSDictionary *json = (NSDictionary *)responseObject[@"accounts"];
                  success(json);
              }
              failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  
                  failure(error, error.code);
              }];
}


//----- Get List Workers -----//

- (void) getListAllWorkers:(void(^)(NSArray* arrayWorkers)) success
                 onFailure:(void(^)(NSError* errorBlock, NSInteger statusCode)) failure
{
    
    [self.manager GET:@"https://raw.githubusercontent.com/HackDeveloperUA/JSON-ForExampleProjects/master/workersData.json"
           parameters:nil
             progress:nil
              success:^(NSURLSessionDataTask *  task, NSDictionary*   responseObject) {
                  
                  NSDictionary *json = (NSDictionary *)responseObject;
                  if (json) {
                      success([self parseWithMapping:json andClassModel:[WorkerShort class]]);
                  }
              }
              failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  
                  failure(error, error.code);
              }];
}

//----- Get Full Info about worker -----//

- (void) getFullInfoByWorkers:(NSString *)link
                    onSuccess:(void(^)(WorkerFull* worker)) success
                    onFailure:(void(^)(NSError* errorBlock,  NSInteger statusCode)) failure
{
    [self.manager GET:link
           parameters:nil
             progress:nil
              success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
                  
                  NSDictionary *json = (NSDictionary *)responseObject;
                  if (json) {
                      success([self parseWithMapping:json andClassModel:[WorkerFull class]]);
                  }
              }
              failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
                  
                  failure(error, error.code);
              }];
}


#pragma mark - Helpers Method


- (id) parseWithMapping:(NSDictionary*) responDict andClassModel:(Class) modelClass
{
    
    if ([modelClass isSubclassOfClass:[WorkerShort class]]) {
        FEMMapping* objectMapping = [WorkerShort defaultMapping];
        NSArray*    modelsArray   = [FEMDeserializer collectionFromRepresentation:responDict[@"workers"] mapping:objectMapping];
        return modelsArray;
    }
    
    if ([modelClass isSubclassOfClass:[WorkerFull class]]) {
        FEMMapping *mapping     = [WorkerFull defaultMapping];
        WorkerFull *worker = [FEMDeserializer objectFromRepresentation:responDict mapping: mapping];
        return worker;
    }
    return @"Not found Classes Model";
}

@end
