//
//  RouteAdvisor.h
//  RouteAdvisor
//
//  Created by dama-upc on 01/12/15.
//  Copyright (c) 2015 DAMA-UPC. All rights reserved.
//  version 1.1.1
//
#import <Foundation/Foundation.h>


/*!
 @interface FixRoute
 @discussion Objecte que conté la informació referent a una ruta fixa
 <ul><li><b> description: </b>Nom que rep la ruta fixa</li>
    <li><b> idRoute: </b>Identificador de la ruta fixa</li>
    <li><b> poiOrder: </b>Cadena on es pot determinar un ordre dels POIs que formen la ruta</li>
    <li><b> idNeighbourhood: </b>Identificador del barri on es fa la ruta</li>
    <li><b> idTopic: </b>Identificador del tòpic</li>
    <li><b> coordPoiCenter: </b> Concatenació de latitud i longitud del punt cèntric</li>
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

/*!
 @method setDescription
 @discussion guarda la descripció d'una ruta fixa
 */
-(void) setDescription:(NSString *) descrip;
/*!
 @method getDescription
 @discussion proporciona la descripció d'una ruta fixa
 @result NSString
 */
-(NSString *)getDescription;
/*!
 @method setIdRoute
 @discussion guarda l'identificador d'una ruta fixa
 */
-(void) setIdRoute:(long) idroute;
/*!
 @method getIdRoute
 @discussion proporciona l'identificador d'una ruta fixa
 @result long
 */
-(long) getIdRoute;
/*!
 @method setPoiOrder
 @discussion guarda una cadena amb tots el punts i l'ordre d'una ruta fixa, separats per "-".
 */
-(void) setPoiOrder:(NSString *) poiOrder;
/*!
 @method getPoiOrder
 @discussion Proporciona una cadena amb tots el punts i l'ordre d'una ruta fixa, separats per "-".
 @result NSString
 */
-(NSString *)getPoiOrder;
/*!
 @method setIdNeighbourhood
 @discussion guarda el barri d'una ruta fixa
 */
-(void) setIdNeighbourhood:(long) idNei;
/*!
 @method getIdNeighbourhood
 @discussion proporciona el barri d'una ruta fixa
 @result long
 */
-(long) getIdNeighbourhood;
/*!
 @method setIdTopic
 @discussion guarda el tema d'una ruta fixa
 */
-(void) setIdTopic:(long) idTopic;
/*!
 @method getIdTopic
 @discussion proporciona el tema d'una ruta fixa
 @result long
 */
-(long) getIdTopic;
/*!
 @method setCoordPoiCenter
 @discussion guarda el punt central d'una ruta fixa
 */
-(void) setCoordPoiCenter:(NSString *) coordPoiC;
/*!
 @method getCoordPoiCenter
 @discussion proporciona el punt central d'una ruta fixa
 @result NSString
 */
-(NSString *)getCoordPoiCenter;

@end

/*!
 @interface Coordinate
 @discussion Objecte per indicar una coordenada geogràfica d’un mapa
 <ul><li><b> latitude: </b>Latitud de la coordenada geogràfica</li>
    <li><b> longitude: </b>Longitud de la coordenada geogràfica</li>
 </ul>
 */
@interface Coordinate : NSObject
{
    double latitude;
    double longitude;
}

/*!
 @method setLatitude
 @discussion guarda la latitud d'una coordenada
 */
-(void) setLatitude:(double) lat;
/*!
 @method getLatitude
 @discussion proporciona la latitud d'una coordenada
 @result double
 */
-(double) getLatitude;
/*!
 @method setLongitude
 @discussion guarda la longitud d'una coordenada
 */
-(void) setLongitude:(double) lng;
/*!
 @method getLongitude
 @discussion proporciona la longitud d'una coordenada
 @result double
 */
-(double) getLongitude;

@end

/*!
 @interface POI
 @discussion Objecte que conté tota l’informació d’un punt d’informació d’un mapa
 <ul><li><b> idPOI: </b>Identificador del punt d’interès. Obligatori</li>
    <li><b> latitude: </b>Latitud del punt d’interès. Obligatori</li>
    <li><b> longitude: </b>Longitud del punt d’interès. Obligatori</li>
    <li><b> duration: </b>Duració estimada per aquest punt</li>
    <li><b> timetable: </b>Horari que es pot visitar el POI</li>
    <li><b> timetable_exceptions: </b>Excepcions en que no es pot visitar el POI</li>
    <li><b> price: </b>Preu del punt</li>
    <li><b> price_exceptions: </b>Excepció sobre el preu d’accés</li>
    <li><b> festival_date: </b>Dates d’una festa en aquest punt</li>
    <li><b> closest_poi: </b>POI més proper a aquest</li>
    <li><b> visited: </b>Indicar si ha estat visitat o no, ús per càlcul de rutes dinàmiques</li>
    <li><b> rating: </b>Valoració del punt</li>
    <li><b> title: </b>Descripció del punt</li>
    <li><b> subtitle: </b>Informació extra del punt</li>
    <li><b> type: </b> Indicar el tipus de punt d'interès 0-->POI 1-->STOP</li>
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
    long type;
}

/*!
 @method setIdPOI
 @discussion guarda l'identificador del punt d’interès
 */
-(void) setIdPOI:(NSString *) idpoi;
/*!
 @method getIdPOI
 @discussion proporciona l'identificador d'un punt d'interès
 @result NSString
 */
-(NSString *) getIdPOI;
/*!
 @method setLatitude
 @discussion guarda la latitud del punt d’interès
 */
-(void) setLatitude:(double) lat;
/*!
 @method getLatitude
 @discussion proporciona la latitud d'un punt d'interès
 @result double
 */
-(double) getLatitude;
/*!
 @method setLongitude
 @discussion guarda la longitud del punt d’interès
 */
-(void) setLongitude:(double) lng;
/*!
 @method getLongitude
 @discussion proporciona la longitud del punt d’interès
 @result double
 */
-(double) getLongitude;
/*!
 @method setDuration
 @discussion Guarda la duració estimada per aquest punt
 */
-(void) setDuration:(NSInteger *) dur;
/*!
 @method setTimetable
 @discussion Guarda l'horari que es pot visitar el POI
 */
-(void) setTimetable:(NSString *) tim;
/*!
 @method setTimetableException
 @discussion Guarda les excepcions en que no es pot visitar el POI
 */
-(void) setTimetableException:(NSString *) timeExp;
/*!
 @method setPrice
 @discussion Guarda el preu del punt
 */
-(void) setPrice:(NSString *) pric;
/*!
 @method setPriceException
 @discussion Guarda l'excepció sobre el preu d’accés
 */
-(void) setPriceException:(NSString *) priceExp;
/*!
 @method setFestivalDate
 @discussion Guarda les dates d’una festa en aquest punt
 */
-(void) setFestivalDate:(NSString *) festDate;
/*!
 @method setClosestPoi
 @discussion Guarda el POI més proper a aquest
 */
-(void) setClosestPoi:(long) closestPoi;

/*!
 @method getClosestPoi
 @discussion proporciona el POI més proper a aquest
 @result long
 */
-(long)getClosestPoi;

/*!
 @method isVisited
 @discussion Guarda si ha estat visitat o no el POI
 */
-(void) isVisited:(BOOL) vis;
/*!
 @method setRating
 @discussion Guarda la valoració del punt
 */
-(void) setRating:(long) rat;
/*!
 @method setTitle
 @discussion Guarda la descripció del punt
 */
-(void) setTitle:(NSString *) tit;
/*!
 @method setSubtitle
 @discussion Guarda la informació extra del punt
 */
-(void) setSubtitle:(NSString *) subtit;
/*!
 @method getTitle
 @discussion proporciona la descripció del punt
 @result NSString
 */
-(NSString *)getTitle;
/*!
 @method getSubtitle
 @discussion proporciona la informació extra del punt
 @result NSString
 */
-(NSString *)getSubtitle;
/*!
 @method setType
 @discussion guarda el tipus de punt d'interès 0-->POI 1-->STOP
 */
-(void) setType:(long) t;
/*!
 @method getType
 @discussion proporciona el tipus de punt d'interès 0-->POI 1-->STOP
 @result long
 */
-(long) getType;
@end

/*!
 @interface POISimple
 @discussion Objecte que conté l’informació d’un punt d’informació d’un mapa
 <ul>
 <li><b> idPOI: </b>Identificador del punt d’interès. Obligatori</li>
 <li><b> closest_poi: </b>POI més proper a aquest</li>
 <li><b> visited: </b> Indicar si ha estat visitat o no, ús per càlcul de rutes dinàmiques</li>
 <li><b> type: </b> Indicar el tipus de punt d'interès 0-->POI 1-->STOP</li>
 </ul>
 */
@interface POISimple : NSObject
{
    NSString *idPOI;
    long closest_poi;
    BOOL visited;
    long type;
}

/*!
 @method setIdPOI
 @discussion guarda l'identificador del punt d’interès
 */
-(void) setIdPOI:(NSString *) idpoi;
/*!
 @method getIdPOI
 @discussion proporciona l'identificador d'un punt d'interès
 @result NSString
 */
-(NSString *) getIdPOI;
/*!
 @method setClosestPoi
 @discussion Guarda el POI més proper a aquest
 */
-(void) setClosestPoi:(long) closestPoi;
/*!
 @method isVisited
 @discussion Guarda si ha estat visitat o no el POI
 */
-(void) isVisited:(BOOL) vis;
/*!
@method setType
@discussion guarda el tipus de punt d'interès 0-->POI 1-->STOP
*/
-(void) setType:(long) t;
/*!
 @method getType
 @discussion proporciona el tipus de punt d'interès 0-->POI 1-->STOP
 @result long
 */
-(long) getType;


@end

/*!
 @interface InstructionMap
 @discussion Objecte que té la informació necessària per anar d’una coordenada geogràfica d’un mapa a un altra
 <ul>
 <li><b> text: </b>Nom de la instrucció</li>
 <li><b> annotation_text: </b>Tota la informació necessària per anar d’una coordenada a una altra en un únic camp</li>
 <li><b> description: </b>Instruccions per arribar a una coordenada geogràfica</li>
 <li><b> time: </b>Temps per fer el tram entre dues coordenades</li>
 <li><b> distance: </b>Distància en metres entre dues coordenades</li>
 <li><b> sign: </b> Direcció a continuar(dreta, esquerra, recta, ...)</li>
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

/*!
 @method setText
 @discussion Guarda el nom de la instrucció
 */
-(void) setText:(NSString *) t;
/*!
 @method setAnnotationText
 @discussion Guarda tota la informació necessària per anar d’una coordenada a una altra en un únic camp
 */
-(void) setAnnotationText:(NSString *) anotaText;
/*!
 @method setDescription
 @discussion guarda les instruccions per arribar a una coordenada geogràfica
 */
-(void) setDescription:(NSString *) desc;
/*!
 @method getDescription
 @discussion proporciona la descripció d'una instrucció
 @result NSString
 */
-(NSString *)getDescription;
/*!
 @method setTime
 @discussion guarda el temps per fer el tram entre dues coordenades
 */
-(void) setTime:(long) tim;
/*!
 @method setDistance
 @discussion guarda la distància en metres entre dues coordenades
 */
-(void) setDistance:(double) dist;
/*!
 @method setSign
 @discussion guarda la direcció a continuar(dreta, esquerra, recta, ...)
 */
-(void) setSign:(int) sign_;


@end

/*!
 @interface STOP
 @discussion Objecte que conté l’informació d'una parada de transport
 <ul>
 <li><b> idSTOP </b> identificador de la parada.Obligatori</li>
 <li><b> latitude </b> latitud d'una parada de transport. Obligatori</li>
 <li><b> longitude </b> longitude del punt d’interès. Obligatori</li>
 <li><b> idTrans </b> identificador del transport. Obligatori</li>
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

/*!
 @method getIdSTOP
 @discussion proporciona l'identificador de la parada
 @result NSString
 */
-(NSString *) getIdSTOP;
/*!
 @method setIdSTOP
 @discussion guarda l'identificador de la parada
 */
-(void) setIdSTOP:(NSString *) idstop;
/*!
 @method getLatitude
 @discussion proporciona la latitud d'una parada de transport
 @result NSString
 */
-(double) getLatitude;
/*!
 @method setLatitude
 @discussion guarda la latitud d'una parada de transport
 */
-(void) setLatitude:(double) lat;
/*!
 @method getLongitude
 @discussion proporciona la longitud d'una parada de transport
 @result NSString
 */
-(double) getLongitude;
/*!
 @method setLongitude
 @discussion guarda la longitud d'una parada de transport
 */
-(void) setLongitude:(double) longi;
/*!
 @method getIdTrans
 @discussion proporciona l'identificador del transport
 @result NSString
 */
-(long) getIdTrans;
/*!
 @method setIdTrans
 @discussion guarda l'identificador del transport
 */
-(void) setIdTrans:(long) idTrans;
/*!
 @method getDescription
 @discussion proporciona la descripció d'una parada de transport
 @result NSString
 */
-(NSString *) getDescription;
/*!
 @method setDescription
 @discussion guarda la descripció d'una parada de transport
 */
-(void) setDescription:(NSString *) desc;

@end


/*!
 @interface TRANSPORT
 @discussion Objecte que conté l’informació d'un transport
 <ul>
 <li><b> idTrans: </b>Identificador d'una transport. Obligatori</li>
 <li><b> colour: </b>color d'un transport. Obligatori</li>
 <li><b> description: </b>descripció d'un transport. Obligatori</li>
 <li><b> ref: </b>referència  d'un transport. Obligatori</li>
 </ul>
 */
@interface TRANSPORT : NSObject
{
    long idTrans;
    NSString *colour;
    NSString *description;
    NSString *ref;
}
/*!
 @method getIdTrans
 @discussion proporciona l'identificador d'un transport
 @result NSString
 */
-(long) getIdTrans;
/*!
 @method setIdTrans
 @discussion guarda l'identificador d'un transport
 */
-(void) setIdTrans:(long) idstop;
/*!
 @method getColour
 @discussion proporciona el color d'un transport
 @result NSString
 */
-(NSString *) getColour;
/*!
 @method setColour
 @discussion guarda el color d'un transport
 */
-(void) setColour:(NSString *) colour;
/*!
 @method getDescription
 @discussion proporciona la descripció d'un transport
 @result NSString
 */
-(NSString *) getDescription;
/*!
 @method setDescription
 @discussion guarda la descripció d'un transport
 */
-(void) setDescription:(NSString *) desc;
/*!
 @method getRef
 @discussion proporciona la referència d'un transport
 @result NSString
 */
-(NSString *) getRef;
/*!
 @method setRef
 @discussion guarda ls referència d'un transport
 */
-(void) setRef:(NSString *) ref;


@end


/*!
 @interface PoiDistance
 @discussion Objecte que un identificador de POI o Stop i la distància a unes coordenades
 <ul>
 <li><b> key: </b>Identificador</li>
 <li><b> distance: </b>Distancia a les coordenades donades en metres</li>
 </ul>
 */
@interface PoiDistance:NSObject
{
    NSString *idP;
    double distance;
    double latitude;
    double longitude;
}

/*!
 @method setidP
 @discussion guarda identificador del POI o STOP
 */
-(void) setidP:(NSString *) i;
/*!
 @method getidP
 @discussion proporciona l'identificador del POI o STOP
 @result NSString
 */
-(NSString *)getidP;
/*!
 @method setDistance
 @discussion guarda la distància a les coordenades donades
 */
-(void) setDistance:(double) d;
/*!
 @method getDistance
 @discussion proporciona la distància a les coordenades donades
 @result double
 */
-(double)getDistance;
/*!
 @method getLatitude
 @discussion proporciona la latitud del punt
 @result NSString
 */
-(double) getLatitude;
/*!
 @method setLatitude
 @discussion guarda la latitud del punt
 */
-(void) setLatitude:(double) lat;
/*!
 @method getLongitude
 @discussion proporciona la longitud del punt
 @result NSString
 */
-(double) getLongitude;
/*!
 @method setLongitude
 @discussion guarda la longitud del punt
 */
-(void) setLongitude:(double) longi;
@end




/*!
 @class RouteAdvisor
 @discussion conté tots el mètodes per fer ús del framework
 <ul>
 <li><b> initGraph: </b>Mètode inicial per carregar les dades d’Sparksee. S’ha de realitzar com a primer pas per carregar la base de dades. Una vegada inicialitzada no s’haurà de tornar a fer</li>
 <li><b> getAllFixRoute: </b>Proporciona totes rutes fixes creades. Retorna un llistat de FixRoute</li>
 <li><b> getFixRoute: </b>Proporciona tots els POI d’una ruta fixa. S’ha d’indicar el identificador de la ruta. Retorna un llistat de POI</li>
 <li><b> getDrawPoi: </b>Proporciona un llistat de Coordinate per anar des de una coordenada geogràfica a una altra</li>
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
 @method getDinamicRoutes
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
 @param days número de dies per la visita. El valor ha de ser entre 1 i 5
 @param rate ritme que vol per les visites. El valor ha de ser entre 1 i 3
 @result NSMutableArray<NSMutableArray<PoiSimple>>
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
 @param latitudeIni latitud del punt d’interès inicial;
 @param longitudeIni longitud del punt d’interès inicial;
 @param latitudeEnd latitud del punt d’interès destí;
 @param longitudeEnd longitud del punt d’interès destí;
 @param language llenguatge escullit per obtenir les instruccions
 @result NSMutableArray<InstructionMap>
 */
- (NSMutableArray *) getInstructions:(double)latitudeIni
                                    :(double)longitudeIni
                                    :(double)latitudeEnd
                                    :(double)longitudeEnd
                                    :(NSString *)language;

/*!
 @method getDrawPoi
 @param latitudeIni latitud del punt d’interès inicial
 @param longitudeIni longitud del punt d’interès inicial
 @param latitudeEnd latitud del punt d’interès destí
 @param longitudeEnd longitud del punt d’interès destí
 @discussion Proporciona un llistat de Coordinate per anar des de una coordenada geogràfica a una altra
 @result NSMutableArray<Coordinate>
 */
- (NSMutableArray *)getDrawPoi :(double) latitudeIni
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
- (double) gestDistanceCoordinates:(double)latitudeIni :(double)longitudeIni :(double)latitudeEnd :(double)longitudeEnd;


/*!
 @method setVisited
 @discussion marca com visitat un POI
 @param idRoute identificador del punt d'interés
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
 @param idPoiFind identificador del punt d'interès
 @result POISimple
 */
-(POI *) getPoiAllInfo:(long) idPoiFind;

/*!
 @method getClosestRestaurants
 @discussion proporciona una llista dels 10 restaurants més propers a les coordenades donades
 @param latitude latitud de la posició a tractar
 @param longitude longitud de la posició a tractar
 @param numRestaurant número de restaurants que es volen obtenir
 @result NSMutableArray<NSString>
 */
-(NSMutableArray *) getClosestRestaurants:(double) latitude :(double)longitude :(int)numRestaurant;
/*!
 @method getClosestStops
 @discussion proporciona una llista de les parades de transport més propers a les coordenades donades
 @param latitude latitud de la posició a tractar
 @param longitude longitud de la posició a tractar
 @param numStops número de parades de transport que es volen obtenir
 @result NSMutableArray<NSString>
 */
-(NSMutableArray *) getClosestStops:(double) latitude :(double)longitude :(int)numStops;

@end




