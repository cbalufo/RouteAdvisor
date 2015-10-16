//
//  UtilsGraph.m
//  RouteAdvisorFrameWork
//
//  Created by cbalufo on 8/5/15.
//  Copyright (c) 2015 DAMA-UPC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import "com/graphhopper/GraphHopper.h"
#import "com/graphhopper/routing/util/EncodingManager.h"
#import "com/graphhopper/GHRequest.h"
#import "com/graphhopper/GHResponse.h"
#import "com/graphhopper/util/PointList.h"
#import "com/graphhopper/storage/GraphStorage.h"
#import "com/graphhopper/util/Instruction.h"
#import "com/graphhopper/util/InstructionList.h"
#include "java/util/Iterator.h"
#include "java/util/List.h"
#import "com/graphhopper/util/PointList.h"
#import "UtilsGraph.h"
#import "RouteAdvisor.h"
#include "J2ObjC_header.h"
#include "com/graphhopper/util/TranslationMap.h"
#include "com/graphhopper/util/Translation.h"
#include "com/graphhopper/util/InstructionAnnotation.h"

@interface UtilsGraph ()

@property (weak, nonatomic) MKMapView *mapView;
@property (weak, nonatomic) UITextView *textView;
@property (nonatomic) GraphHopper *hopper;
@property (nonatomic) MKPolyline *currentRoute;
@property (nonatomic) double latitudeIni;
@property (nonatomic) double longitudeIni;
@property (nonatomic) double latitudeEnd;
@property (nonatomic) double longitudeEnd;


@end


@implementation UtilsGraph

#define NAME_DATABASE @"poi_triangle"
#define NAME_MAP @"bcn"

+ (NSString *)prepareDataBaseSparksee{
    
    NSBundle* bundle = [NSBundle bundleForClass:[self class]];
    
    NSString* sourceFolder = [bundle pathForResource:NAME_DATABASE ofType:@"txt"];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *destinationFolder = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    //NSLog(@"destinationFolder: %@",destinationFolder);
/*
    NSFileManager *gestorArchivos = [NSFileManager defaultManager];
    
    NSString *ruta = [destinationFolder stringByAppendingPathComponent:@"poi_triangle.txt"];
     NSLog(@"barramos1: ");
    if ([gestorArchivos isDeletableFileAtPath: ruta]) {
         NSLog(@"barramos2: ");
        [gestorArchivos removeItemAtPath: ruta error: NULL];
        
    }
    */
    destinationFolder = [destinationFolder stringByAppendingPathComponent:[sourceFolder lastPathComponent]];
    
    NSFileManager * fileManager = [ NSFileManager defaultManager];
    NSError * error = nil;
    //check if destinationFolder exists
    if ([ fileManager fileExistsAtPath:destinationFolder])
    {
        //removing destination, so soucer may be copied
        if (![fileManager removeItemAtPath:destinationFolder error:&error])
        {
            NSLog(@"Could not remove old files. Error:%@",error);
        }
    }
    error = nil;
    //copying destination
    if ( !( [ fileManager copyItemAtPath:sourceFolder toPath:destinationFolder error:&error ]) )
    {
        NSLog(@"Could not copy report at path %@ to path %@. error %@",sourceFolder, destinationFolder, error);
        
    }
    
    NSFileManager *filemgr;
    
    filemgr = [NSFileManager defaultManager];
    
    NSURL *oldPath = [NSURL fileURLWithPath:destinationFolder];
    NSURL *newPath= [NSURL fileURLWithPath:[[paths objectAtIndex:0] stringByAppendingString: @"/poi_triangle.gbd"]];
    
    [filemgr moveItemAtURL: oldPath toURL: newPath error: nil];
    
    return [paths objectAtIndex:0];
    
}


- (GraphHopper *)hopper
{
    if (!_hopper) {
        
        NSBundle* bundle = [NSBundle bundleForClass:[self class]];
        
        NSString* location = [bundle pathForResource:NAME_MAP ofType:@"osm-gh"];
        _hopper = [[GraphHopper alloc] init];
/*        [_hopper forMobile];
        NSLog(@"create Graph 0.5...");
 */
        [_hopper setCHEnableWithBoolean:NO];
        [_hopper setAllowWritesWithBoolean:NO];
        [_hopper setMemoryMapped];
        [_hopper setEncodingManagerWithEncodingManager:[[EncodingManager alloc] initWithNSString:@"foot"]];
        [_hopper load__WithNSString:location];
    }
    return _hopper;
}

-(void) initGraph{
    GraphHopper *tmpHopp = [self hopper];
    _hopper = tmpHopp;
}


- (NSMutableArray *) getInstructionGraph:(double)latitudeIni
                                        :(double)longitudeIni
                                        :(double)latitudeEnd
                                        :(double)longitudeEnd
                                        :(NSString *)language
{
    NSMutableArray *array = [[NSMutableArray alloc] init];
  
    MKPointAnnotation *point1 = [[MKPointAnnotation alloc] init];
    point1.coordinate = CLLocationCoordinate2DMake(latitudeIni, longitudeIni);

    MKPointAnnotation *point2 = [[MKPointAnnotation alloc] init];
    point2.coordinate = CLLocationCoordinate2DMake(latitudeEnd, longitudeEnd);
    
   // dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        GHRequest *request = [[GHRequest alloc] initWithDouble:point1.coordinate.latitude
                                                    withDouble:point1.coordinate.longitude
                                                    withDouble:point2.coordinate.latitude
                                                    withDouble:point2.coordinate.longitude
                              ];
        [request setLocaleWithNSString:language];
        GHResponse *response = [self.hopper routeWithGHRequest:request];
        NSString *routeInfo = @"";
        if ([response hasErrors]) {
            NSLog(@"%@", [response getErrors]);
            routeInfo = [routeInfo stringByAppendingString:[NSString stringWithFormat:@"%@\n", [response getErrors]]];
        }
        routeInfo = [routeInfo stringByAppendingString:[NSString stringWithFormat:@"%@", [response getDebugInfo]]];
        InstructionList * intr = [response getInstructions];
        
        TranslationMap *trasnsMap = [self.hopper getTranslationMap];
        id<JavaUtilIterator> iterator = [intr iterator];
        
        while ([iterator hasNext]) {
            Instruction *object = [iterator next];
            InstructionMap *i = [[InstructionMap alloc] init];
            
            InstructionAnnotation *an = [object getAnnotation];
//            NSLog(@"Instructions turn... %@",[object getTurnDescriptionWithTranslation:[trasnsMap getWithNSString:language]]);
            [ i setText:[object getName]];
            [ i setDistance:[object getDistance]];
            [ i setSign:[object getSign]];
            [ i setTime:[object getTime]];
            [ i setAnnotationText:[an getMessage]];
            [ i setDescription:[object getTurnDescriptionWithTranslation:[trasnsMap getWithNSString:language]]];
           
            [array addObject:i];
        }
   // });
    
    return array;
}

- (NSMutableArray *)getPois:(double)latitudeIni :(double)longitudeIni :(double)latitudeEnd :(double)longitudeEnd
{
    NSMutableArray *arrayP = [[NSMutableArray alloc] init];
    
    MKPointAnnotation *point1 = [[MKPointAnnotation alloc] init];
    point1.coordinate = CLLocationCoordinate2DMake(latitudeIni, longitudeIni);
    
    MKPointAnnotation *point2 = [[MKPointAnnotation alloc] init];
    point2.coordinate = CLLocationCoordinate2DMake(latitudeEnd, longitudeEnd);
    
    //dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        GHRequest *request = [[GHRequest alloc] initWithDouble:point1.coordinate.latitude
                                                    withDouble:point1.coordinate.longitude
                                                    withDouble:point2.coordinate.latitude
                                                    withDouble:point2.coordinate.longitude
                              ];
        
        GHResponse *response = [self.hopper routeWithGHRequest:request];
        
        NSString *routeInfo = @"";
        if ([response hasErrors]) {
            NSLog(@"%@", [response getErrors]);
            routeInfo = [routeInfo stringByAppendingString:[NSString stringWithFormat:@"%@\n", [response getErrors]]];
        }
        routeInfo = [routeInfo stringByAppendingString:[NSString stringWithFormat:@"%@", [response getDebugInfo]]];
        
        PointList *points = [response getPoints];

        for (int i = 0; i < [points getSize]; i++) {

            Coordinate *c = [[Coordinate alloc] init];
            [ c setLatitude:[points getLatitudeWithInt:i]];
            //NSLog(@"Point Latitude %f points.", [points getLatitudeWithInt:i]);
            [ c setLongitude:[points getLongitudeWithInt:i]];
            //NSLog(@"Point longitude %f points.", [points getLongitudeWithInt:i]);
            [arrayP addObject: c];
        }
    //});

    return arrayP;
}


- (double) getDistancePois:(double)latitudeIni
                          :(double)longitudeIni
                          :(double)latitudeEnd
                          :(double)longitudeEnd
{
 //   double *array = [[jdouble alloc] init];
    
    MKPointAnnotation *point1 = [[MKPointAnnotation alloc] init];
    point1.coordinate = CLLocationCoordinate2DMake(latitudeIni, longitudeIni);
    
    MKPointAnnotation *point2 = [[MKPointAnnotation alloc] init];
    point2.coordinate = CLLocationCoordinate2DMake(latitudeEnd, longitudeEnd);
    
    // dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    GHRequest *request = [[GHRequest alloc] initWithDouble:point1.coordinate.latitude
                                                withDouble:point1.coordinate.longitude
                                                withDouble:point2.coordinate.latitude
                                                withDouble:point2.coordinate.longitude
                          ];
    //[request setLocaleWithNSString:language];
    GHResponse *response = [self.hopper routeWithGHRequest:request];
    NSString *routeInfo = @"";
    if ([response hasErrors]) {
        NSLog(@"%@", [response getErrors]);
        routeInfo = [routeInfo stringByAppendingString:[NSString stringWithFormat:@"%@\n", [response getErrors]]];
    }
    routeInfo = [routeInfo stringByAppendingString:[NSString stringWithFormat:@"%@", [response getDebugInfo]]];
    double dist = [response getDistance];
    
    // });
    
    return dist;
}

@end

