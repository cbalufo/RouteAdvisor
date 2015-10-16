#import "RouteAdvisor.h"
#import "UtilsGraph.h"
#import "Poi.h"
#import "TopSolver.h"
#import "Route.h"
#import <Sparksee/Sparksee.h>
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@implementation FixRoute

    -(void) setDescription:(NSString *) descrip {
        description = [[NSString alloc]initWithString: descrip];
    }
    -(NSString *)getDescription{
        return description;
    }

    -(void) setIdRoute:(long) idroute {
        idRoute = idroute;
    }
    -(long) getIdRoute{
        return idRoute;
    }
    -(void) setPoiOrder:(NSString *) poiOrd {
        poiOrder = [[NSString alloc]initWithString: poiOrd];
    }
    -(NSString *)getPoiOrder{
        return poiOrder;
    }
    -(void) setIdNeighbourhood:(long) idNei {
        idNeighbourhood = idNei;
    }
    -(long) getIdNeighbourhood{
        return idNeighbourhood;
    }
    -(void) setIdTopic:(long) idTop {
        idTopic = idTop;
    }
    -(long) getIdTopic{
        return idTopic;
    }
    -(void) setCoordPoiCenter:(NSString *) coordPoiC {
        coordPoiCenter = [[NSString alloc]initWithString: coordPoiC];
    }
    -(NSString *)getCoordPoiCenter{
        return coordPoiCenter;
    }

@end

@implementation Coordinate

    -(void) setLatitude:(double) lat{
        latitude = lat;
    }
    -(double) getLatitude{
        return latitude;
    }
    -(void) setLongitude:(double) lng{
        longitude = lng;
    }
    -(double) getLongitude{
        return longitude;
    }

@end


@implementation InstructionMap


    -(void) setText:(NSString *) t {
        text = [[NSString alloc]initWithString: t];
    }


    -(void) setAnnotationText:(NSString *) anotaText {
        annotation_text = [[NSString alloc]initWithString: anotaText];
    }

    -(void) setDescription:(NSString *)desc {
        description = [[NSString alloc]initWithString: desc];
    }
    -(NSString *)getDescription{
        return description;
    }

    -(void) setTime:(long) tim {
        time = tim;
    }

    -(void) setDistance:(double) dist {
        distance = dist;
    }

    -(void) setSign:(int) sign_ {
        sign = sign_;
    }

@end

@implementation POI

    -(void) setIdPOI:(NSString *) idpoi{
        idPOI = [[NSString alloc]initWithString: idpoi];
    }

    -(NSString *) getIdPOI{
        return idPOI;
    }

    -(void) setLatitude:(double) lat{
        latitude = lat;
    }
    -(double) getLatitude{
        return latitude;
    }
    -(void) setLongitude:(double) lng{
        longitude = lng;
    }
    -(double) getLongitude{
        return longitude;
    }
    -(void) setDuration:(NSInteger *) dur{
        duration = dur;
    }
    -(void) setTimetable:(NSString *) tim {
        timetable = [[NSString alloc]initWithString: tim];
    }
    -(void) setTimetableException:(NSString *) timeExp {
        timetable_exceptions = [[NSString alloc]initWithString: timeExp];
    }
    -(void) setPrice:(NSString *) pric {
        price = [[NSString alloc]initWithString: pric];
    }
    -(void) setPriceException:(NSString *) priceExp {
        price_exceptions = [[NSString alloc]initWithString: priceExp];
    }
    -(void) setFestivalDate:(NSString *) festDate {
        festival_date = [[NSString alloc]initWithString: festDate];
    }
    -(void) setClosestPoi:(long) closestPoi{
        closest_poi = closestPoi;
    }
    -(void) isVisited:(BOOL) vis {
        visited = vis;
    }
    -(void) setRating:(long) rat{
        rating = rat;
    }
    -(void) setTitle:(NSString *) tit {
        title = [[NSString alloc]initWithString: tit];
    }
    -(void) setSubtitle:(NSString *) subtit {
        subtitle = [[NSString alloc]initWithString: subtit];
    }
    -(NSString *)getTitle{
        return title;
    }
    -(NSString *)getSubtitle{
        return subtitle;
    }
@end

@implementation POISimple

-(void) setIdPOI:(NSString *) idpoi{
    idPOI = [[NSString alloc]initWithString: idpoi];
}

-(NSString *) getIdPOI{
    return idPOI;
}

-(void) setClosestPoi:(long) closestPoi{
    closest_poi = closestPoi;
}
-(void) isVisited:(BOOL) vis {
    visited = vis;
}
//-(void) setRating:(long) rat{
//    rating = rat;
//}
@end


@implementation TRANSPORT

-(void) setIdTrans:(long) idtrans{
    idTrans = idtrans;
}

-(long) getIdTrans{
    return idTrans;
}

-(void) setColour:(NSString *) col{
    colour = [[NSString alloc]initWithString: col];
}

-(NSString *) getColour{
    return colour;
}

-(void) setDescription:(NSString *) descrip{
    description = [[NSString alloc]initWithString: descrip];
}

-(NSString *) getDescription{
    return description;
}

-(void) setRef:(NSString *) refer{
    ref = [[NSString alloc]initWithString: refer];
}

-(NSString *) getRef{
    return ref;
}

@end

@implementation STOP

-(NSString *) getIdSTOP{
    return idSTOP;
}
-(void) setIdSTOP:(NSString *) idstop{
    idSTOP = [[NSString alloc]initWithString: idstop];
}
-(double) getLatitude{
    return latitude;
}
-(void) setLatitude:(double) lat{
    latitude = lat;
}
-(double) getLongitude{
    return longitude;
}

-(void) setLongitude:(double) longi{
    longitude = longi;
}

-(long) getIdTrans{
    return idTrans;
}

-(void) setIdTrans:(long) idTransport{
    idTrans = idTransport;
}

-(void) setDescription:(NSString *) descrip{
    description = [[NSString alloc]initWithString: descrip];
}

-(NSString *) getDescription{
    return description;
}

@end

@interface RouteAdvisor()

@property (nonatomic,strong) UtilsGraph *ug;

@end

@implementation RouteAdvisor

#define OLD_KEY_SPARKSEE @"PSBSH-FVAAE-CXH0W-S6DXH"
#define KEY_SPARKSEE @"4YFQV-WXRYD-62H09-M3D5W"
#define TYPE_FIXROUTE @"FIXROUTE"
#define TYPE_ID @"id"
#define TYPE_DESCRIPTION @"description"
#define TYPE_COORD_POICENTER @"coord_poiCenter"
#define TYPE_POI @"POI"
#define TYPE_POI_FIXROUTE @"poi_fixroute"
#define TYPE_STOP_FIXROUTE @"stop_fixroute"
#define TYPE_LAT @"lat"
#define TYPE_LNG @"lng"
#define TYPE_DURATION @"duration"
#define TYPE_TIMETABLE @"timetable"
#define TYPE_TIMETABLE_EXCEPTIONS @"timetable_exceptions"
#define TYPE_PRICE @"price"
#define TYPE_PRICE_EXCEPTIONS @"price_exceptions"
#define TYPE_FESTIVAL_DATE @"festival_date"
#define TYPE_CLOSEST_POI @"closest_poi"
#define TYPE_VISITED @"visited"
#define TYPE_TITLE @"title"
#define TYPE_SUBTITLE @"subtitle"
#define TYPE_POI_ORDER @"poi_order"
#define TYPE_TOPIC_FIXROUTE @"fixroute-topic"
#define TYPE_NEIGHBOURHOOD_FIXROUTE @"fixroute-neighbourhood"
#define TYPE_NEIGHBOURHOOD @"NEIGHBOURHOOD"
#define TYPE_TOPIC @"TOPIC"
#define TYPE_STOP @"STOP"
#define TYPE_TRANSPORT @"TRANSPORT"
#define TYPE_COLOUR @"colour"
#define TYPE_REF @"ref"
#define TYPE_STOP_TRANSPORT @"stop_transport"
#define TYPE_CAT_MUSEUM_SCORE @"cat_museum_score"
#define TYPE_CAT_ARCH_SCORE @"cat_arch_score"
#define TYPE_CAT_ART_SCORE @"cat_art_score"
#define TYPE_CAT_LEISURE_SCORE @"cat_leisure_score"
#define TYPE_CAT_SHOOPING_SCORE @"cat_shopping_score"


-(NSMutableArray *) getAllFixRoute{
    NSString *sparkseeOK = [UtilsGraph prepareDataBaseSparksee];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *destinationFolder = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    NSString *dbFile = [destinationFolder stringByAppendingString: @"/poi_triangle.gbd"];
    NSString *logFile = [destinationFolder stringByAppendingString: @"/poi_triangle.log"];
    
    STSSparkseeConfig *cfg = [[STSSparkseeConfig alloc] init];
    [cfg setLogFile: logFile];
    [cfg setLicense: KEY_SPARKSEE];
    [cfg setCacheMaxSize: 1024];
    STSSparksee *sparksee = [[STSSparksee alloc] initWithConfig: cfg];
    STSDatabase *db = [sparksee open:(dbFile) readOnly:false];
    STSSession *sess = [db createSession];
    STSGraph *graph = [sess getGraph];
    
    NSMutableArray *allRoute = [[NSMutableArray alloc] init];
    STSValue *valueId = [[STSValue alloc] init];
    STSValue *valueDescription = [[STSValue alloc] init];
    STSValue *valuePoiOrder = [[STSValue alloc] init];
    STSValue *valueCoordPoiCenter = [[STSValue alloc] init];
    STSValue *vTopic = [[STSValue alloc] init];
    STSValue *vNeighbourhood = [[STSValue alloc] init];

    int fixRouteType = [graph findType: TYPE_FIXROUTE];
    int routeIdType = [graph findAttribute:fixRouteType name:TYPE_ID];
    int routeDescriptionType = [graph findAttribute:fixRouteType name:TYPE_DESCRIPTION];
    int routePoiOrderType = [graph findAttribute:fixRouteType name:TYPE_POI_ORDER];
    int routeCoordPoiCenterType = [graph findAttribute:fixRouteType name:TYPE_COORD_POICENTER];
    int edgeTopicFixRouteType = [graph findType: TYPE_TOPIC_FIXROUTE];
    int edgeNeighbourhoodFixRouteType = [graph findType: TYPE_NEIGHBOURHOOD_FIXROUTE];
    int neighbourhoodType = [graph findType: TYPE_NEIGHBOURHOOD];
    int topicType = [graph findType: TYPE_TOPIC];

    STSObjects *route = [graph selectWithType: fixRouteType];
    
    STSObjectsIterator *it = [route iterator];

    while ([it hasNext])
    {
        long long fixRouteOid = [it next];
        
        [graph getAttributeInValue: fixRouteOid attr: routeIdType value: valueId];
        [graph getAttributeInValue: fixRouteOid attr: routeDescriptionType value: valueDescription];
        [graph getAttributeInValue: fixRouteOid attr: routePoiOrderType value: valuePoiOrder];
        [graph getAttributeInValue: fixRouteOid attr: routeCoordPoiCenterType value: valueCoordPoiCenter];

        STSObjects *topics = [graph neighbors: fixRouteOid etype: edgeTopicFixRouteType dir: STSAny];
        STSObjectsIterator *itTopics = [topics iterator];
        while ([itTopics hasNext])
        {
            long long topic = [itTopics next];
             [graph getAttributeInValue: topic attr: [graph findAttribute:topicType name:TYPE_ID] value: vTopic];
        }
        [itTopics close];
        [topics close];

        STSObjects *neis = [graph neighbors: fixRouteOid etype: edgeNeighbourhoodFixRouteType dir: STSAny];
        STSObjectsIterator *itnei = [neis iterator];
        while ([itnei hasNext])
        {
            long long nei = [itnei next];
            [graph getAttributeInValue: nei attr: [graph findAttribute:neighbourhoodType name:TYPE_ID] value: vNeighbourhood];
        }
        [itnei close];
        [neis close];
        
        FixRoute *r = [[FixRoute alloc] init];
        [ r setDescription:[valueDescription getString]];
        [ r setIdRoute:[valueId getLong]];
        [ r setPoiOrder:[valuePoiOrder getString]];
        [ r setCoordPoiCenter:[valueCoordPoiCenter getString]];
        //[ r setIdNeighbourhood:[vNeighbourhood getLong]];
        //[ r setIdTopic:[vTopic getLong]];
        [allRoute addObject: r];
    }
    
    [it close];
    [route close];

   // Close the database
    [sess close];
    [db close];
    [sparksee close];
    
    return allRoute;
}

-(NSMutableArray *) getAllIdsPOIFixRoute:(long) idRoute{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *destinationFolder = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    
    NSString *dbFile = [destinationFolder stringByAppendingString: @"/poi_triangle.gbd"];
    NSString *logFile = [destinationFolder stringByAppendingString: @"/poi_triangle.log"];
    
    
    STSSparkseeConfig *cfg = [[STSSparkseeConfig alloc] init];
    [cfg setLogFile: logFile];
    [cfg setLicense: KEY_SPARKSEE];
    [cfg setCacheMaxSize: 1024];
    STSSparksee *sparksee = [[STSSparksee alloc] initWithConfig: cfg];
    STSDatabase *db = [sparksee open:(dbFile) readOnly:false];
    STSSession *sess = [db createSession];
    STSGraph *graph = [sess getGraph];
    
    NSMutableArray *allPOI = [[NSMutableArray alloc] init];
    
    int fixRouteType = [graph findType: TYPE_FIXROUTE];
    int poiType = [graph findType: TYPE_POI];
    int routeNameId = [graph findAttribute: fixRouteType name: TYPE_ID];
    STSValue *val = [[STSValue alloc] init];
    STSObjects *nodeFixRoute = [graph selectWithAttrValue: routeNameId cond: STSEqual value: [val setLong:(idRoute)]];
    int edgeType = [graph findType: TYPE_POI_FIXROUTE];
    STSObjectsIterator *itr = [nodeFixRoute iterator];
    
    while ([itr hasNext])
    {
        long long fixRouteOid = [itr next];
        
        STSObjects *pois = [graph neighbors: fixRouteOid etype: edgeType dir: STSAny];
        STSValue *v = [[STSValue alloc] init];
        
        STSObjectsIterator *it = [pois iterator];
        
        while ([it hasNext])
        {
            long long poi = [it next];
            POISimple *p = [[POISimple alloc] init];
            [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_ID] value: v];
            if (!v.isNull){
                [p setIdPOI:[v getString]];
            }
            [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_CLOSEST_POI] value: v];
            if (!v.isNull){
                [p setClosestPoi:[v getLong]];
            }
            [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_VISITED] value: v];
            if (!v.isNull){
                [p isVisited:[v getBoolean]];
            }
            [allPOI addObject: p];
        }
        
        [it close];
        [pois close];
        
        int stopType = [graph findType: TYPE_STOP];
        int edgeStopType = [graph findType: TYPE_STOP_FIXROUTE];
        
        STSObjects *stops = [graph neighbors: fixRouteOid etype: edgeStopType dir: STSAny];
        
        STSObjectsIterator *itStops = [stops iterator];
        
        while ([itStops hasNext])
        {
            long long stop = [itStops next];
            POI *p = [[POI alloc] init];
            [graph getAttributeInValue: stop attr: [graph findAttribute:stopType name:TYPE_ID] value: v];
            if (!v.isNull){
                [p setIdPOI:[v stringValue]];
            }
            [graph getAttributeInValue: stop attr: [graph findAttribute:stopType name:TYPE_LAT] value: v];
            [p setLatitude:[v getDouble]];
            [graph getAttributeInValue: stop attr: [graph findAttribute:stopType name:TYPE_LNG] value: v];
            [p setLongitude:[v getDouble]];
            [graph getAttributeInValue: stop attr: [graph findAttribute:stopType name:TYPE_DESCRIPTION] value: v];
            if (!v.isNull){
                [p setTitle:[v getString]];
            }
            [allPOI addObject: p];
        }
        
        [itStops close];
        [stops close];
        
    }
    
    [itr close];
    [nodeFixRoute close];
    
    [sess close];
    [db close];
    [sparksee close];
    
    return allPOI;
}


-(NSMutableArray *) getAllPOIFixRoute:(long) idRoute{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *destinationFolder = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    
    NSString *dbFile = [destinationFolder stringByAppendingString: @"/poi_triangle.gbd"];
    NSString *logFile = [destinationFolder stringByAppendingString: @"/poi_triangle.log"];
    
    
    STSSparkseeConfig *cfg = [[STSSparkseeConfig alloc] init];
    [cfg setLogFile: logFile];
    [cfg setLicense: KEY_SPARKSEE];
    [cfg setCacheMaxSize: 1024];
    STSSparksee *sparksee = [[STSSparksee alloc] initWithConfig: cfg];
    STSDatabase *db = [sparksee open:(dbFile) readOnly:false];
    STSSession *sess = [db createSession];
    STSGraph *graph = [sess getGraph];
    
    NSMutableArray *allPOI = [[NSMutableArray alloc] init];
    
    int fixRouteType = [graph findType: TYPE_FIXROUTE];
    int poiType = [graph findType: TYPE_POI];
    int stopType = [graph findType: TYPE_STOP];
    int routeNameId = [graph findAttribute: fixRouteType name: TYPE_ID];
    STSValue *val = [[STSValue alloc] init];
    STSObjects *nodeFixRoute = [graph selectWithAttrValue: routeNameId cond: STSEqual value: [val setLong:(idRoute)]];
    int edgePoiType = [graph findType: TYPE_POI_FIXROUTE];
    int edgeStopType = [graph findType: TYPE_STOP_FIXROUTE];
    STSObjectsIterator *itr = [nodeFixRoute iterator];
    
    while ([itr hasNext])
    {
        long long fixRouteOid = [itr next];
        
        STSObjects *pois = [graph neighbors: fixRouteOid etype: edgePoiType dir: STSAny];
        STSValue *v = [[STSValue alloc] init];
        
        STSObjectsIterator *it = [pois iterator];
        
        while ([it hasNext])
        {
            long long poi = [it next];
            POI *p = [[POI alloc] init];
            [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_ID] value: v];
            if (!v.isNull){
                [p setIdPOI:[v stringValue]];
            }
            [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_LAT] value: v];
            [p setLatitude:[v getDouble]];
            [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_LNG] value: v];
            [p setLongitude:[v getDouble]];
            [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_DURATION] value: v];
            if (!v.isNull){
                [p setDuration:[v getInteger]];
            }
            [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_TIMETABLE] value: v];
            if (!v.isNull){
                [p setTimetable:[v getString]];
            }
            [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_TIMETABLE_EXCEPTIONS] value: v];
            if (!v.isNull){
                [p setTimetableException:[v getString]];
            }
            [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_PRICE] value: v];
            if (!v.isNull){
                [p setPrice:[v getString]];
            }
            [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_PRICE_EXCEPTIONS] value: v];
            if (!v.isNull){
                [p setPriceException:[v getString]];
            }
            [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_FESTIVAL_DATE] value: v];
            if (!v.isNull){
                [p setFestivalDate:[v getString]];
            }
            [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_CLOSEST_POI] value: v];
            if (!v.isNull){
                [p setClosestPoi:[v getLong]];
            }
            [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_VISITED] value: v];
            if (!v.isNull){
                [p isVisited:[v getBoolean]];
            }
            [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_TITLE] value: v];
            if (!v.isNull){
                [p setTitle:[v getString]];
            }
            [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_SUBTITLE] value: v];
            if (!v.isNull){
                [p setSubtitle:[v getString]];
            }
            [allPOI addObject: p];
        }
        
        [it close];
        [pois close];
        
        
        STSObjects *stops = [graph neighbors: fixRouteOid etype: edgeStopType dir: STSAny];
        STSValue *val = [[STSValue alloc] init];
        
        STSObjectsIterator *itStops = [stops iterator];
        
        while ([itStops hasNext])
        {
            long long stop = [itStops next];
            POI *p = [[POI alloc] init];
            [graph getAttributeInValue: stop attr: [graph findAttribute:stopType name:TYPE_ID] value: v];
            if (!v.isNull){
                [p setIdPOI:[v stringValue]];
            }
            [graph getAttributeInValue: stop attr: [graph findAttribute:stopType name:TYPE_LAT] value: v];
            [p setLatitude:[v getDouble]];
            [graph getAttributeInValue: stop attr: [graph findAttribute:stopType name:TYPE_LNG] value: v];
            [p setLongitude:[v getDouble]];
            [graph getAttributeInValue: stop attr: [graph findAttribute:stopType name:TYPE_DESCRIPTION] value: v];
            if (!v.isNull){
                [p setTitle:[v getString]];
            }
            [allPOI addObject: p];
        }
        
        [itStops close];
        [stops close];
        
    }
    
    [itr close];
    [nodeFixRoute close];
    
    [sess close];
    [db close];
    [sparksee close];
    
    return allPOI;
}



-(NSMutableArray *) getAllPOIDinamicRoute:(double)scoreMuseum
                                         :(double) scoreArchitecture
                                         :(double) scoreArt
                                         :(double) scoreLeisure
                                         :(double) scoreShooping
                                         :(double)latitudeIni
                                         :(double)longitudeIni
                                         :(double)latitudeEnd
                                         :(double)longitudeEnd
                                         :(int) days
                                         :(int) rate;
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *destinationFolder = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    
    NSString *dbFile = [destinationFolder stringByAppendingString: @"/poi_triangle.gbd"];
    NSString *logFile = [destinationFolder stringByAppendingString: @"/poi_triangle.log"];
    
    
    STSSparkseeConfig *cfg = [[STSSparkseeConfig alloc] init];
    [cfg setLogFile: logFile];
    [cfg setLicense: KEY_SPARKSEE];
    [cfg setCacheMaxSize: 1024];
    STSSparksee *sparksee = [[STSSparksee alloc] initWithConfig: cfg];
    STSDatabase *db = [sparksee open:(dbFile) readOnly:false];
    STSSession *sess = [db createSession];
    STSGraph *graph = [sess getGraph];
    
    NSMutableArray *dinamicRoutes = [[NSMutableArray alloc] init];
    
    int poiType = [graph findType: TYPE_POI];
    
    STSValue *v = [[STSValue alloc] init];
    
    
    NSMutableArray *pois = [[NSMutableArray alloc] init];

    //recuperamos todos los poi de la bd
    STSObjects *poiSparksee = [graph selectWithType: poiType];
    
    STSObjectsIterator *it = [poiSparksee iterator];
    
    while ([it hasNext])
    {
        long long obj = [it next];
        long idP ;
        double lat,lng,arch_score,art_score,leisure_score,museum_score,shooping_score;
        
        //NSLog(@"step 00");
        
        [graph getAttributeInValue: obj attr: [graph findAttribute:poiType name:TYPE_ID] value: v];
        if (!v.isNull){
            idP = [v getLong];
        }
        //NSLog(@"step 01 %ld",idP);
        
        [graph getAttributeInValue: obj attr: [graph findAttribute:poiType name:TYPE_LAT] value: v];
        if (!v.isNull){
            lat = [v getDouble];
        }
        //NSLog(@"step 02 %f",lat);
        [graph getAttributeInValue: obj attr: [graph findAttribute:poiType name:TYPE_LNG] value: v];
        if (!v.isNull){
            lng = [v getDouble];
        }
        //NSLog(@"step 03 %f",lng);
        [graph getAttributeInValue: obj attr: [graph findAttribute:poiType name:TYPE_CAT_ARCH_SCORE] value: v];
        if (!v.isNull){
            arch_score = [v getDouble];
        }
       // NSLog(@"step 04 %f",arch_score);
        [graph getAttributeInValue: obj attr: [graph findAttribute:poiType name:TYPE_CAT_ART_SCORE] value: v];
        if (!v.isNull){
            art_score = [v getDouble];
        }
        //NSLog(@"step 05 %f",art_score);
        [graph getAttributeInValue: obj attr: [graph findAttribute:poiType name:TYPE_CAT_LEISURE_SCORE] value: v];
        if (!v.isNull){
            leisure_score = [v getDouble];
        }
        //NSLog(@"step 06 %f",leisure_score);
        [graph getAttributeInValue: obj attr: [graph findAttribute:poiType name:TYPE_CAT_MUSEUM_SCORE] value: v];
        if (!v.isNull){
            museum_score = [v getDouble];
        }
        //NSLog(@"step 07 %f",museum_score);
        [graph getAttributeInValue: obj attr: [graph findAttribute:poiType name:TYPE_CAT_SHOOPING_SCORE] value: v];
        if (!v.isNull){
            shooping_score = [v getDouble];
        }
        //NSLog(@"step 08 %f",shooping_score);
        
        //multiplicamos cada uno de los score de los parametros por su correspondiente score del poi de la bd
        double totalScore = (arch_score * scoreArchitecture) + (art_score * scoreArt) + (leisure_score * scoreLeisure) + (museum_score * scoreMuseum) + (shooping_score * scoreShooping);
        //NSLog(@"step 09 %f",totalScore);
        //dividimos por el número de días de las rutas
        totalScore = totalScore / days;
        //NSLog(@"step 10 %f",totalScore);
        
        //guardamos el score en el nuevo POI , dejamos por defecto 45 minutos para cada punto de visita
        [pois addObject:[[Poi alloc] initWithPoiId:[NSString stringWithFormat: @"%ld", idP] lat:lat lng:lng score:totalScore consumingBudget:45]];
        
    }
    
    [it close];
    [poiSparksee close];
    
    //cuando tengamos todos los Poi en la array ordenamos esta por el score
    //NSLog(@"step 11 count: %lu",(unsigned long)[pois count]);
    
    NSSortDescriptor *valueDescriptor = [[NSSortDescriptor alloc] initWithKey:@"score" ascending:YES];
    NSArray *descriptors = [NSArray arrayWithObject:valueDescriptor];
    NSArray *sortedArray = [pois sortedArrayUsingDescriptors:descriptors];
    //NSLog(@"step 12 count: %lu",(unsigned long)[sortedArray count]);
    //TODO pasar a número el rate
    //TODO pasar a número los dias
    
    //nos quedamos con los 60 primeros poi
    NSArray *smallArray = [sortedArray subarrayWithRange:NSMakeRange(0, 60)];
    
   // NSLog(@"step 13 count: %lu",(unsigned long)[smallArray count]);
    
    NSMutableArray *finalPois = [[NSMutableArray alloc] initWithArray:smallArray];
    
    //NSLog(@"step 14");
    
    TopSolver *topSolver = [[TopSolver alloc] initWithRouteCount:4 availableBudget:300.0 walkingSpeed:65.0 pois:finalPois startLat:latitudeIni startLng:longitudeIni finishLat:latitudeEnd finishLng:longitudeEnd];
    
     //NSLog(@"step 15");
    NSArray *routes = [topSolver run:10 :10];
    
    // NSLog(@"step 16 count: %lu",(unsigned long)[routes count]);
    
    for (Route *r in routes) {
        NSString *allpois = [[NSString alloc] init];
        for (Poi *p in r.pois) {
                NSString *s = [@"-" stringByAppendingString:p.poiId];
                allpois = [allpois stringByAppendingString:s];
        }
        [dinamicRoutes addObject:[allpois substringFromIndex:1]];
        //NSLog(@"step 17 count: %lu",(unsigned long)[dinamicRoutes count]);
    }
    
    [sess close];
    [db close];
    [sparksee close];
     //NSLog(@"step 18");
    /* only for test
    NSMutableArray *test = [[NSMutableArray alloc] init];
    for (int i=0; i<days; i++) {
        NSString *l = @"508-1717-509-1419-1718-525-527-524-952-1710-526";
        [test addObject:l];
    }
    NSLog(@"step 18 count: %lu",(unsigned long)[test count]);
    return test;
     */
    
    
    return dinamicRoutes;
    
}

-(void) initGraph{
    UtilsGraph *g =  [[UtilsGraph alloc] init];
    [g initGraph];
    _ug = g;
}


-(NSMutableArray *) getFixRoute:(long) idRoute{
    
    NSMutableArray *array = [self getAllPOIFixRoute:idRoute];
    return array;
}

-(NSMutableArray *) getPoisFixRoute:(long) idRoute{
    
    NSMutableArray *array = [self getAllIdsPOIFixRoute:idRoute];
    return array;
}


-(NSMutableArray *) getDinamicRoutes :(double)scoreMuseum
                                    :(double) scoreArchitecture
                                    :(double) scoreArt
                                    :(double) scoreLeisure
                                    :(double) scoreShooping
                                    :(double)latitudeIni
                                    :(double)longitudeIni
                                    :(double)latitudeEnd
                                    :(double)longitudeEnd
                                    :(int) days
                                    :(int) rates
{
 
    
    NSMutableArray *array = [self getAllPOIDinamicRoute:scoreMuseum :scoreArchitecture :scoreArt :scoreLeisure :scoreShooping :latitudeIni :longitudeIni :latitudeEnd :longitudeEnd : days :rates];

    return array;
 
}


//list of Instruction
- (NSMutableArray *) getInstructions:(double)latitudeIni
                                    :(double)longitudeIni
                                    :(double)latitudeEnd
                                    :(double)longitudeEnd
                                    :(NSString *)language
{
    return [_ug getInstructionGraph:latitudeIni :longitudeIni : latitudeEnd:longitudeEnd:language];
}

//list of Coordinate
- (NSMutableArray *) getDrawPoi:(double)latitudeIni :(double)longitudeIni :(double)latitudeEnd :(double)longitudeEnd{

    return [_ug getPois:latitudeIni :longitudeIni : latitudeEnd:longitudeEnd];
}

//distancia between two poids
- (double) getDistancePois:(double)latitudeIni
                          :(double)longitudeIni
                          :(double)latitudeEnd
                          :(double)longitudeEnd
{
    return [_ug getDistancePois:latitudeIni :longitudeIni : latitudeEnd:longitudeEnd];
}

-(void) setVisited:(NSString *) idRoute{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *destinationFolder = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    
    NSString *dbFile = [destinationFolder stringByAppendingString: @"/poi_triangle.gbd"];
    NSString *logFile = [destinationFolder stringByAppendingString: @"/poi_triangle.log"];
    
    
    STSSparkseeConfig *cfg = [[STSSparkseeConfig alloc] init];
    [cfg setLogFile: logFile];
    [cfg setLicense: KEY_SPARKSEE];
    [cfg setCacheMaxSize: 1024];
    STSSparksee *sparksee = [[STSSparksee alloc] initWithConfig: cfg];
    STSDatabase *db = [sparksee open:(dbFile) readOnly:false];
    STSSession *sess = [db createSession];
    STSGraph *graph = [sess getGraph];
    
    int poiType = [graph findType: TYPE_POI];
    int visitedType = [graph findType: TYPE_VISITED];
    STSValue *v = [[STSValue alloc] init];
    
    long long oidPoi = [graph findAttribute:poiType name:idRoute];
    [graph setAttribute:oidPoi attr:visitedType value:[v setBoolean:true]];
    
    [sess close];
    [db close];
    [sparksee close];
}

-(STOP *) getStopInfo:(NSString *) idStopFind{

    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *destinationFolder = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    
    NSString *dbFile = [destinationFolder stringByAppendingString: @"/poi_triangle.gbd"];
    NSString *logFile = [destinationFolder stringByAppendingString: @"/poi_triangle.log"];
    
    
    STSSparkseeConfig *cfg = [[STSSparkseeConfig alloc] init];
    [cfg setLogFile: logFile];
    [cfg setLicense: KEY_SPARKSEE];
    [cfg setCacheMaxSize: 1024];
    STSSparksee *sparksee = [[STSSparksee alloc] initWithConfig: cfg];
    STSDatabase *db = [sparksee open:(dbFile) readOnly:false];
    STSSession *sess = [db createSession];
    STSGraph *graph = [sess getGraph];
    
    
    STSValue *v = [[STSValue alloc] init];
    
    int stopType = [graph findType: TYPE_STOP];
    int transportType = [graph findType: TYPE_TRANSPORT];
    int idStop = [graph findAttribute:stopType name:TYPE_ID];
    long long oidStop = [graph findObject:idStop value: [v setString:idStopFind]];
    int edgeType = [graph findType: TYPE_STOP_TRANSPORT];
    
    STOP *s = [[STOP alloc] init];
    
    [graph getAttributeInValue: oidStop attr: [graph findAttribute:stopType name:TYPE_ID] value: v];
    if (!v.isNull){
        [s setIdSTOP:[v getString]];
    }
    
    [graph getAttributeInValue: oidStop attr: [graph findAttribute:stopType name:TYPE_DESCRIPTION] value: v];
    if (!v.isNull){
        [s setDescription:[v getString]];
    }
    [graph getAttributeInValue: oidStop attr: [graph findAttribute:stopType name:TYPE_LAT] value: v];
    if (!v.isNull){
        [s setLatitude:[v getDouble]];
    }
    [graph getAttributeInValue: oidStop attr: [graph findAttribute:stopType name:TYPE_LNG] value: v];
    if (!v.isNull){
        [s setLongitude:[v getDouble]];
    }
  
    STSObjects *transport = [graph neighbors: oidStop etype: edgeType dir: STSAny];
    
    STSObjectsIterator *it = [transport iterator];
    
    while ([it hasNext])
    {
        long long trans = [it next];
        
        [graph getAttributeInValue: trans attr: [graph findAttribute:transportType name:TYPE_ID] value: v];
        if (!v.isNull){
            [s setIdTrans:[v getLong]];
        }
    }
    
    [it close];
    [transport close];

    [sess close];
    [db close];
    [sparksee close];

    return s;
}



-(TRANSPORT *) getTransportInfo:(long) idTransportFind{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *destinationFolder = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    
    NSString *dbFile = [destinationFolder stringByAppendingString: @"/poi_triangle.gbd"];
    NSString *logFile = [destinationFolder stringByAppendingString: @"/poi_triangle.log"];
    
    
    STSSparkseeConfig *cfg = [[STSSparkseeConfig alloc] init];
    [cfg setLogFile: logFile];
    [cfg setLicense: KEY_SPARKSEE];
    [cfg setCacheMaxSize: 1024];
    STSSparksee *sparksee = [[STSSparksee alloc] initWithConfig: cfg];
    STSDatabase *db = [sparksee open:(dbFile) readOnly:false];
    STSSession *sess = [db createSession];
    STSGraph *graph = [sess getGraph];
    
    
    STSValue *v = [[STSValue alloc] init];
    
    int transportType = [graph findType: TYPE_TRANSPORT];
    int idTransport = [graph findAttribute:transportType name:TYPE_ID];
    long long oidTransport = [graph findObject:idTransport value: [v setLong:idTransportFind]];
    
    
    TRANSPORT *t = [[TRANSPORT alloc] init];
    
    [graph getAttributeInValue: oidTransport attr: [graph findAttribute:transportType name:TYPE_ID] value: v];
    if (!v.isNull){
        [t setIdTrans:[v getLong]];
    }
    [graph getAttributeInValue: oidTransport attr: [graph findAttribute:transportType name:TYPE_DESCRIPTION] value: v];
    if (!v.isNull){
        [t setDescription:[v getString]];
    }
    [graph getAttributeInValue: oidTransport attr: [graph findAttribute:transportType name:TYPE_COLOUR] value: v];
    if (!v.isNull){
        [t setColour:[v getString]];
    }
    [graph getAttributeInValue: oidTransport attr: [graph findAttribute:transportType name:TYPE_REF] value: v];
    if (!v.isNull){
        [t setRef:[v getString]];
    }
    
    [sess close];
    [db close];
    [sparksee close];
    
    return t;
}

-(POISimple *) getPoiInfo:(long) idPoiFind{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *destinationFolder = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    
    NSString *dbFile = [destinationFolder stringByAppendingString: @"/poi_triangle.gbd"];
    NSString *logFile = [destinationFolder stringByAppendingString: @"/poi_triangle.log"];
    
    
    STSSparkseeConfig *cfg = [[STSSparkseeConfig alloc] init];
    [cfg setLogFile: logFile];
    [cfg setLicense: KEY_SPARKSEE];
    [cfg setCacheMaxSize: 1024];
    STSSparksee *sparksee = [[STSSparksee alloc] initWithConfig: cfg];
    STSDatabase *db = [sparksee open:(dbFile) readOnly:false];
    STSSession *sess = [db createSession];
    STSGraph *graph = [sess getGraph];
    
    
    STSValue *v = [[STSValue alloc] init];
    int poiType = [graph findType: TYPE_POI];
    int idPoi = [graph findAttribute:poiType name:TYPE_ID];
    long long oidPoi= [graph findObject:idPoi value: [v setLong:idPoiFind]];

    POISimple *p = [[POISimple alloc] init];
    
    [graph getAttributeInValue: oidPoi attr: [graph findAttribute:poiType name:TYPE_ID] value: v];
    if (!v.isNull){
        [p setIdPOI:[NSString stringWithFormat:@"%lld", [v getLong]]];
    }
    [graph getAttributeInValue: oidPoi attr: [graph findAttribute:poiType name:TYPE_CLOSEST_POI] value: v];
    if (!v.isNull){
        [p setClosestPoi:[v getLong]];
    }
    [graph getAttributeInValue: oidPoi attr: [graph findAttribute:poiType name:TYPE_VISITED] value: v];
    if (!v.isNull){
        [p isVisited:[v getBoolean]];
    }
    [sess close];
    [db close];
    [sparksee close];
    
    return p;
}


-(POI *) getPoiAllInfo:(long) idPoiFind{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *destinationFolder = ([paths count] > 0) ? [paths objectAtIndex:0] : nil;
    
    NSString *dbFile = [destinationFolder stringByAppendingString: @"/poi_triangle.gbd"];
    NSString *logFile = [destinationFolder stringByAppendingString: @"/poi_triangle.log"];
    
    
    STSSparkseeConfig *cfg = [[STSSparkseeConfig alloc] init];
    [cfg setLogFile: logFile];
    [cfg setLicense: KEY_SPARKSEE];
    [cfg setCacheMaxSize: 1024];
    STSSparksee *sparksee = [[STSSparksee alloc] initWithConfig: cfg];
    STSDatabase *db = [sparksee open:(dbFile) readOnly:false];
    STSSession *sess = [db createSession];
    STSGraph *graph = [sess getGraph];
    
    
    STSValue *v = [[STSValue alloc] init];
    int poiType = [graph findType: TYPE_POI];
    int idPoi = [graph findAttribute:poiType name:TYPE_ID];
    long long poi= [graph findObject:idPoi value: [v setLong:idPoiFind]];
    
    POI *p = [[POI alloc] init];
    
    [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_ID] value: v];
    if (!v.isNull){
        [p setIdPOI:[NSString stringWithFormat:@"%lld", [v getLong]]];
    }
    [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_LAT] value: v];
    [p setLatitude:[v getDouble]];
    [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_LNG] value: v];
    [p setLongitude:[v getDouble]];
    [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_DURATION] value: v];
    if (!v.isNull){
        [p setDuration:[v getInteger]];
    }
    [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_TIMETABLE] value: v];
    if (!v.isNull){
        [p setTimetable:[v getString]];
    }
    [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_TIMETABLE_EXCEPTIONS] value: v];
    if (!v.isNull){
        [p setTimetableException:[v getString]];
    }
    [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_PRICE] value: v];
    if (!v.isNull){
        [p setPrice:[v getString]];
    }
    [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_PRICE_EXCEPTIONS] value: v];
    if (!v.isNull){
        [p setPriceException:[v getString]];
    }
    [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_FESTIVAL_DATE] value: v];
    if (!v.isNull){
        [p setFestivalDate:[v getString]];
    }
    [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_CLOSEST_POI] value: v];
    if (!v.isNull){
        [p setClosestPoi:[v getLong]];
    }
    [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_VISITED] value: v];
    if (!v.isNull){
        [p isVisited:[v getBoolean]];
    }
    [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_TITLE] value: v];
    if (!v.isNull){
        [p setTitle:[v getString]];
    }
    [graph getAttributeInValue: poi attr: [graph findAttribute:poiType name:TYPE_SUBTITLE] value: v];
    if (!v.isNull){
        [p setSubtitle:[v getString]];
    }

    [sess close];
    [db close];
    [sparksee close];
    
    return p;
}



@end
