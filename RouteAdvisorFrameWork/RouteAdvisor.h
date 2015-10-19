//
//  RouteAdvisor.h
//  RouteAdvisor
//
//  Created by cbalufo on 29/4/15.
//  Copyright (c) 2015 DAMA-UPC. All rights reserved.
//
#import <Foundation/Foundation.h>


/*!
 @interface FixRoute
 @discussion Objecte que conté la informació referent a una ruta fixa
  <ul>
    <li>@field
        <b>description</b>
            nom que rep la ruta fixa</li>
    <li>@field
        <b>idRoute</b>
            identificador de la ruta fixa</li>
    <li>@field 
        <b>poiOrder</b> 
            cadena on es pot determinar un ordre dels POIs que formen la ruta</li>
    <li>@field 
        <b>idNeighbourhood</b> 
            identificador del barri on es fa la ruta</li>
    <li>@field 
        <b>idTopic</b> 
            identificador del tòpic</li>
    <li>@field 
        <b>coordPoiCenter</b> 
            Concatenació de latitud i longitud del punt cèntric</li>
  </ul>
 */

@interface FixRoute:NSObject
{
    NSString *description;
    long idRoute;
    NSString *poiOrder;
    long idNeighbourhood;
    long idTopic;
    NSString *coordPoiCenter;
}

-(void) setDescription:(NSString *) descrip;
-(NSString *)getDescription;
-(void) setIdRoute:(long) idroute;
-(long) getIdRoute;
-(void) setPoiOrder:(NSString *) poiOrder;
-(NSString *)getPoiOrder;
-(void) setIdNeighbourhood:(long) idNei;
-(long) getIdNeighbourhood;
-(void) setIdTopic:(long) idTopic;
-(long) getIdTopic;
-(void) setCoordPoiCenter:(NSString *) coordPoiC;
-(NSString *)getCoordPoiCenter;

@end

/*!
 @interface Coordinate
 @discussion Objecte per indicar una coordenada geogràfica d’un mapa
 <ul>
    <li>@field 
        <b>latitude</b> 
            latitud de la coordenada geogràfica</li>
    <li>@field 
        <b>longitude</b> 
            longitud de la coordenada geogràfica</li>
 </ul>
 */
@interface Coordinate : NSObject
{
    double latitude;
    double longitude;
}

-(void) setLatitude:(double) lat;
-(double) getLatitude;
-(void) setLongitude:(double) lng;
-(double) getLongitude;

@end

/*!
 @interface POI
 @discussion Objecte que conté tota l’informació d’un punt d’informació d’un mapa
 <ul>
    <li>@field 
        <b>idPOI</b> 
            identificador del punt d’interès. Obligatori</li>
    <li>@field 
        <b>latitude</b> 
            latitud del punt d’interès. Obligatori</li>
    <li>@field 
        <b>longitude</b> 
            longitud del punt d’interès. Obligatori</li>
    <li>@field 
        <b>duration</b> 
            duració estimada per aquest punt</li>
    <li>@field 
        <b>timetable</b> 
            horari que es pot visitar el POI</li>
    <li>@field 
        <b>timetable_exceptions</b> 
            excepcions en que no es pot visitar el POI</li>
    <li>@field 
        <b>price</b> 
            preu del punt</li>
    <li>@field 
        <b>price_exceptions</b> 
            excepció sobre el preu d’accés</li>
    <li>@field 
        <b>festival_date</b>
            dates d’una festa en aquest punt</li>
    <li>@field 
        <b>closest_poi</b>
            POI més proper a aquest</li>
    <li>@field 
        <b>visited</b> 
            indicar si ha estat visitat o no, ús per càlcul de rutes dinàmiques</li>
    <li>@field 
        <b>rating</b> 
            valoració del punt</li>
    <li>@field 
        <b>title</b> 
            descripció del punt</li>
    <li>@field 
        <b>subtitle</b> 
            informació extra del punt</li>
 </ul>
 */
@interface POI : NSObject
{
    NSString *idPOI;
    double latitude;
    double longitude;
    NSInteger *duration;
    NSString *timetable;
    NSString *timetable_exceptions;
    NSString *price;
    NSString *price_exceptions;
    NSString *festival_date;
    long closest_poi;
    BOOL visited;
    long rating;
    NSString *title;
    NSString *subtitle;
}

-(void) setIdPOI:(NSString *) idpoi;
-(NSString *) getIdPOI;
-(void) setLatitude:(double) lat;
-(double) getLatitude;
-(void) setLongitude:(double) lng;
-(double) getLongitude;
-(void) setDuration:(NSInteger *) dur;
-(void) setTimetable:(NSString *) tim;
-(void) setTimetableException:(NSString *) timeExp;
-(void) setPrice:(NSString *) pric;
-(void) setPriceException:(NSString *) priceExp;
-(void) setFestivalDate:(NSString *) festDate;
-(void) setClosestPoi:(long) closestPoi;
-(void) isVisited:(BOOL) vis;
-(void) setRating:(long) rat;
-(void) setTitle:(NSString *) tit;
-(void) setSubtitle:(NSString *) subtit;
-(NSString *)getTitle;
-(NSString *)getSubtitle;

@end

/*!
 @interface POI
 @discussion Objecte que conté l’informació d’un punt d’informació d’un mapa
 <ul>
 <li>@field
    <b>idPOI</b>
        identificador del punt d’interès. Obligatori</li>
 <li>@field
    <b>closest_poi</b>
        POI més proper a aquest</li>
 <li>@field
    <b>visited</b>
        indicar si ha estat visitat o no, ús per càlcul de rutes dinàmiques</li>
 <li>@field
    <b>rating</b>
        valoració del punt</li>
 </ul>
 */
@interface POISimple : NSObject
{
    NSString *idPOI;
    long closest_poi;
    BOOL visited;
    //long rating;
}

-(void) setIdPOI:(NSString *) idpoi;
-(NSString *) getIdPOI;
-(void) setClosestPoi:(long) closestPoi;
-(void) isVisited:(BOOL) vis;
//-(void) setRating:(long) rat;
@end

/*!
 @interface InstructionMap
 @discussion Objecte que té la informació necessària per anar d’una coordenada geogràfica d’un mapa a un altra
 <ul>
    <li>@field
        <b>text</b>
            nom de la instrucció</li>
    <li>@field
        <b>annotation_text</b>
            tota la informació necessària per anar d’una coordenada a una altra en un únic camp</li>
    <li>@field 
        <b>description</b> 
            instruccions per arribar a una coordenada geogràfica</li>
    <li>@field 
        <b>time</b> 
            temps per fer el tram entre dues coordenades</li>
    <li>@field 
        <b>distance</b> 
            distància en metres entre dues coordenades</li>
    <li>@field 
        <b>sign</b> 
            direcció a continuar(dreta, esquerra, recta, ...)</li>
 </ul>
 */
@interface InstructionMap : NSObject
{
    NSString *text;
    NSString *annotation_text;
    NSString *description;
    long time;
    double distance;
    int sign;
}

-(void) setText:(NSString *) t;
-(void) setAnnotationText:(NSString *) anotaText;
-(void) setDescription:(NSString *) desc;
-(NSString *)getDescription;
-(void) setTime:(long) tim;
-(void) setDistance:(double) dist;
-(void) setSign:(int) sign_;


@end



/*!
 @interface STOP
 @discussion Objecte que conté l’informació d'una parada de transport
 <ul>
 <li>@field
    <b>idSTOP</b>
        identificador de la parada. Obligatori</li>
 <li>@field
    <b>latitude</b>
        latitud del punt d’interès. Obligatori</li>
 <li>@field
    <b>longitude</b>
        longitude del punt d’interès. Obligatori</li>
 <li>@field
    <b>idTrans</b>
        identificador del transport. Obligatori</li>
 </ul>
 */
@interface STOP : NSObject
{
    NSString *idSTOP;
    double latitude;
    double longitude;
    long idTrans;
    NSString *description;
}

-(NSString *) getIdSTOP;
-(void) setIdSTOP:(NSString *) idstop;
-(double) getLatitude;
-(void) setLatitude:(double) lat;
-(double) getLongitude;
-(void) setLongitude:(double) longi;
-(long) getIdTrans;
-(void) setIdTrans:(long) idTrans;
-(NSString *) getDescription;
-(void) setDescription:(NSString *) desc;

@end


/*!
 @interface TRANSPORT
 @discussion Objecte que conté l’informació d'un transport
 <ul>
 <li>@field
 <b>idSTOP</b>
 identificador de la parada. Obligatori</li>
 <li>@field
 <b>latitude</b>
 latitud del punt d’interès. Obligatori</li>
 <li>@field
 <b>longitude</b>
 longitude del punt d’interès. Obligatori</li>
 <li>@field
 <b>idTrans</b>
 identificador del transport. Obligatori</li>
 </ul>
 */
@interface TRANSPORT : NSObject
{
    long idTrans;
    NSString *colour;
    NSString *description;
    NSString *ref;
}

-(long) getIdTrans;
-(void) setIdTrans:(long) idstop;
-(NSString *) getColour;
-(void) setColour:(NSString *) colour;
-(NSString *) getDescription;
-(void) setDescription:(NSString *) desc;
-(NSString *) getRef;
-(void) setRef:(NSString *) ref;


@end

/*!
 @class RouteAdvisor
 @discussion conté tots el mètodes per fer ús del framework
 <ul>
    <li>
        <b>initGraph</b>
            Mètode inicial per carregar les dades d’Sparksee. S’ha de realitzar com a primer pas per carregar la base de dades. Una vegada inicialitzada no s’haurà de tornar a fer</li>
    <li>
        <b>getAllFixRoute</b>
            Proporciona totes rutes fixes creades. Retorna un llistat de FixRoute</li>
    <li>
        <b>getFixRoute</b> 
            Proporciona tots els POI d’una ruta fixa. S’ha d’indicar el identificador de la ruta. Retorna un llistat de POI</li>
    <li>
        <b>getInstructions</b> 
            Proporciona un llistat de InstructionMap per anar des de una coordenada geogràfica a una altra. S’ha d’indicar el llenguatge en que es volen les instruccions</li>
    <li>
        <b>getDrawPoi</b>
            Proporciona un llistat de Coordinate per anar des de una coordenada geogràfica a una altra</li>
 </ul>
 */
@interface RouteAdvisor : NSObject

/*!
 @method initGraph
 @discussion Mètode inicial per carregar les dades d’Sparksee. S’ha de realitzar com a primer pas per carregar la base de dades. Una vegada inicialitzada no s’haurà de tornar a fer
 */
-(void) initGraph;

/*!
 @method getAllFixRoute
 @discussion Proporciona totes rutes fixes creades. Retorna un llistat de FixRoute
 @result NSMutableArray<FixRoute>
 */
-(NSMutableArray *) getAllFixRoute;

/*!
 @method getFixRoute  Reservat per demo interna DAMA-UPC
 @discussion Proporciona tots els POI d’una ruta fixa. S’ha d’indicar el identificador de la ruta. Retorna un llistat de POI
 @param idRoute identificador de la FixRoute
 @result NSMutableArray<POI>
 */
-(NSMutableArray *) getFixRoute:(long) idRoute;

/*!
 @method getPoisFixRoute
 @discussion Proporciona tots els POI d’una ruta fixa. S’ha d’indicar el identificador de la ruta. Retorna un llistat de POI
 @param idRoute identificador de la FixRoute
 @result NSMutableArray<POISimple>
 */
-(NSMutableArray *) getPoisFixRoute:(long) idRoute;

/*!
 @method getDinamicRoute
 @discussion  S’ha d’indicar l'informació del formulari com parametres d'entrada.  Retorna un llistat de NSString. En cada un del NSString conté tots els ids d'una ruta dinamica separats per "-". Tantes rutes com dies s'indiquin en el formulari
 @param scoreMuseum puntuació de l'usuari en el formulari pels museus. El valor ha de ser entre 0 i 1
 @param scoreArchitecture puntuació de l'usuari en el formulari per l'Arquitectura. El valor ha de ser entre 0 i 1
 @param scoreArt puntuació de l'usuari en el formulari per l'Art. El valor ha de ser entre 0 i 1
 @param scoreLeisure puntuació de l'usuari en el formulari pel relax. El valor ha de ser entre 0 i 1
 @param scoreShopping puntuació de l'usuari en el formulari pel shooping. El valor ha de ser entre 0 i 1
 @param latitudeIni latitud del punt d’interès inicial
 @param longitudeIni longitud del punt d’interès inicial
 @param latitudeEnd latitud del punt d’interès destí
 @param longitudeEnd longitud del punt d’interès destí
 @param days número de dies per la visita
 @param rate ritme que vol per les visites
 @result NSMutableArray<NSString> Exemple:[123-12-14-15,456-453-345-234,876-756-444]
 */

-(NSMutableArray *) getDinamicRoutes :(double)scoreMuseum
                                    :(double) scoreArchitecture
                                    :(double) scoreArt
                                    :(double) scoreLeisure
                                    :(double) scoreShopping
                                    :(double)latitudeIni
                                    :(double)longitudeIni
                                    :(double)latitudeEnd
                                    :(double)longitudeEnd
                                    :(int)days
                                    :(int)rate;
/*!
 @method getInstructions
 @discussion Proporciona un llistat de InstructionMap per anar des de una coordenada geogràfica a una altra. S’ha d’indicar el llenguatge en que es volen les instruccions
 @param latitudeIni latitud del punt d’interès inicial
 @param longitudeIni longitud del punt d’interès inicial
 @param latitudeEnd latitud del punt d’interès destí
 @param longitudeEnd longitud del punt d’interès destí
 @param language llenguatge escullit per obtenir les instruccions
 @result NSMutableArray<InstructionMap>
 */
- (NSMutableArray *) getInstructions:(double)latitudeIni
                                    :(double)longitudeIni
                                    :(double)latitudeEnd
                                    :(double)longitudeEnd
                                    :(NSString *)language;
// Get list of Coordinate
/*!
 @method getDrawPoi
 @discussion Proporciona un llistat de Coordinate per anar des de una coordenada geogràfica a una altra
 @param latitudeIni latitud del punt d’interès inicial
 @param longitudeIni longitud del punt d’interès inicial
 @param latitudeEnd latitud del punt d’interès destí
 @param longitudeEnd longitud del punt d’interès destí
 @result NSMutableArray<Coordinate>
 */
- (NSMutableArray *) getDrawPoi:(double)latitudeIni
                                :(double)longitudeIni
                                :(double)latitudeEnd
                                :(double)longitudeEnd;

/*!
 @method getDistancePois
 @discussion Proporciona la distacia en metres entre dos punts
 @param latitudeIni latitud del punt d’interès inicial
 @param longitudeIni longitud del punt d’interès inicial
 @param latitudeEnd latitud del punt d’interès destí
 @param longitudeEnd longitud del punt d’interès destí
 @result double
 */
- (double) getDistancePois:(double)latitudeIni
                          :(double)longitudeIni
                          :(double)latitudeEnd
                          :(double)longitudeEnd;


/*!
 @method setVisited
 @discussion marca com visitad un POI
 @param idRoute identificador del punt d'interés
 @result Boolean
 */
-(void) setVisited:(NSString *) idRoute;

/*!
 @method getStopInfo
 @discussion proporciona tota l'informació d'una parada de transport
 @param idStop identificador de la parada de transport
 @result STOP
 */
-(STOP *) getStopInfo:(NSString *) idStop;

/*!
 @method getTransportInfo
 @discussion proporciona tota l'informació d'un transport
 @param idTransport identificador del transport
 @result TRANSPORT
 */
-(TRANSPORT *) getTransportInfo:(long) idTransport;

/*!
 @method getPoiInfo
 @discussion proporciona tota l'informació d'un punt d'interès
 @param idPoi identificador del punt d'interès
 @result POISimple
 */
-(POISimple *) getPoiInfo:(long) idPoi;

/*!
 @method getPoiInfo Exclusiu per Dama-upc
 @discussion proporciona tota l'informació d'un punt d'interès
 @param idPoi identificador del punt d'interès
 @result POISimple
 */
-(POI *) getPoiAllInfo:(long) idPoiFind;

@end




