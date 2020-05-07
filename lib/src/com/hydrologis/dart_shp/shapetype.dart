part of dart_shp;

/// Not much but a type safe enumeration of file types as ints and names. The descriptions can easily
/// be tied to a ResourceBundle if someone wants to do that.
///
/// @author Ian Schneider
class ShapeType {
  /// The integer id of this ShapeType. 
  final int id;
  /// The human-readable name for this ShapeType.<br>
  /// Could easily use ResourceBundle for internationialization.
  final String name;
  const ShapeType._(this.id, this.name);

  /// Represents a Null shape (id = 0). 
  static const NULL = ShapeType._(0, 'Null');

  /// Represents a Point shape (id = 1). 
  static const POINT = ShapeType._(1, 'Point');

  /// Represents a PointZ shape (id = 11). 
  static const POINTZ = ShapeType._(11, 'PointZ');

  /// Represents a PointM shape (id = 21). 
  static const POINTM = ShapeType._(21, 'PointM');

  /// Represents an Arc shape (id = 3). 
  static const ARC = ShapeType._(3, 'Arc');

  /// Represents an ArcZ shape (id = 13). 
  static const ARCZ = ShapeType._(13, 'ArcZ');

  /// Represents an ArcM shape (id = 23). 
  static const ARCM = ShapeType._(23, 'ArcM');

  /// Represents a Polygon shape (id = 5). 
  static const POLYGON = ShapeType._(5, 'Polygon');

  /// Represents a PolygonZ shape (id = 15). 
  static const POLYGONZ = ShapeType._(15, 'PolygonZ');

  /// Represents a PolygonM shape (id = 25). 
  static const POLYGONM = ShapeType._(25, 'PolygonM');

  /// Represents a MultiPoint shape (id = 8). 
  static const MULTIPOINT = ShapeType._(8, 'MultiPoint');

  /// Represents a MultiPointZ shape (id = 18). 
  static const MULTIPOINTZ = ShapeType._(18, 'MultiPointZ');

  /// Represents a MultiPointM shape (id = 28). 
  static const MULTIPOINTM = ShapeType._(28, 'MultiPointM');

  /// Represents an Undefined shape (id = -1). 
  static const UNDEFINED = ShapeType._(-1, 'Undefined');

  /// Get the name of this ShapeType.
  ///
  /// @return The name.
  @override
  String toString() {
    return name;
  }

  /// Is this a multipoint shape? Hint- all shapes are multipoint except NULL, UNDEFINED, and the
  /// POINTs.
  ///
  /// @return true if multipoint, false otherwise.
  bool isMultiPoint() {
    if (this == UNDEFINED) {
      return false;
    } else if (this == NULL) {
      return false;
    } else if (this == POINT || this == POINTM || this == POINTZ) {
      return false;
    }
    return true;
  }

  bool isPointType() {
    return id % 10 == 1;
  }

  bool isLineType() {
    return id % 10 == 3;
  }

  bool isPolygonType() {
    return id % 10 == 5;
  }

  bool isMultiPointType() {
    return id % 10 == 8;
  }

  /// Determine the ShapeType for the id.
  ///
  /// @param id The id to search for.
  /// @return The ShapeType for the id.
  static ShapeType forID(int id) {
    switch (id) {
      case 0:
        return NULL;
      case 1:
        return POINT;
      case 11:
        return POINTZ;
      case 21:
        return POINTM;
      case 3:
        return ARC;
      case 13:
        return ARCZ;
      case 23:
        return ARCM;
      case 5:
        return POLYGON;
      case 15:
        return POLYGONZ;
      case 25:
        return POLYGONM;
      case 8:
        return MULTIPOINT;
      case 18:
        return MULTIPOINTZ;
      case 28:
        return MULTIPOINTM;
      default:
        return UNDEFINED;
    }
  }

  // /// Each ShapeType corresponds to a handler. In the future this should probably go else where to
  // /// allow different handlers, or something...
  // ///
  // /// @throws ShapefileException If the ShapeType is bogus.
  // /// @return The correct handler for this ShapeType. Returns a new one.
  // ShapeHandler getShapeHandler(GeometryFactory gf) {
  //   switch (id) {
  //     case 1:
  //     case 11:
  //     case 21:
  //       return new PointHandler(this, gf);
  //     case 3:
  //     case 13:
  //     case 23:
  //       return new MultiLineHandler(this, gf);
  //     case 5:
  //     case 15:
  //     case 25:
  //       return new PolygonHandler(this, gf);
  //     case 8:
  //     case 18:
  //     case 28:
  //       return new MultiPointHandler(this, gf);
  //     default:
  //       return null;
  //   }
  // }
}
