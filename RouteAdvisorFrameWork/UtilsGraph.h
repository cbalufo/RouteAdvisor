//
//  UtilsGraph.h
//  RouteAdvisorFrameWork
//
//  Created by cbalufo on 8/5/15.
//  Copyright (c) 2015 DAMA-UPC. All rights reserved.
//

#ifndef RouteAdvisorFrameWork_UtilsGraph_h
#define RouteAdvisorFrameWork_UtilsGraph_h


#endif

@interface UtilsGraph : NSObject

- (NSMutableArray *) getInstructionGraph:(double)latitudeIni
                                        :(double)longitudeIni
                                        :(double)latitudeEnd
                                        :(double)longitudeEnd
                                        :(NSString *)language;
//+ (STSSparksee *) getSparksee;
+ (NSString *)prepareDataBaseSparksee;
//+ (NSString *)getPathSparksee;
- (NSMutableArray *)getPois:(double)latitudeIni
                           :(double)longitudeIni
                           :(double)latitudeEnd
                           :(double)longitudeEnd;
-(void) initGraph;

- (double) getDistancePois:(double)latitudeIni
                          :(double)longitudeIni
                          :(double)latitudeEnd
                          :(double)longitudeEnd;

@end