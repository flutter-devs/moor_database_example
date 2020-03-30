// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'moor_database.dart';

// **************************************************************************
// MoorGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps, unnecessary_this
class Order extends DataClass implements Insertable<Order> {
  final String price;
  final int id;
  final String productName;
  Order({@required this.price, this.id, @required this.productName});
  factory Order.fromData(Map<String, dynamic> data, GeneratedDatabase db,
      {String prefix}) {
    final effectivePrefix = prefix ?? '';
    final stringType = db.typeSystem.forDartType<String>();
    final intType = db.typeSystem.forDartType<int>();
    return Order(
      price:
          stringType.mapFromDatabaseResponse(data['${effectivePrefix}price']),
      id: intType.mapFromDatabaseResponse(data['${effectivePrefix}id']),
      productName: stringType
          .mapFromDatabaseResponse(data['${effectivePrefix}product_name']),
    );
  }
  factory Order.fromJson(Map<String, dynamic> json,
      {ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return Order(
      price: serializer.fromJson<String>(json['price']),
      id: serializer.fromJson<int>(json['id']),
      productName: serializer.fromJson<String>(json['productName']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer serializer}) {
    serializer ??= moorRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'price': serializer.toJson<String>(price),
      'id': serializer.toJson<int>(id),
      'productName': serializer.toJson<String>(productName),
    };
  }

  @override
  OrdersCompanion createCompanion(bool nullToAbsent) {
    return OrdersCompanion(
      price:
          price == null && nullToAbsent ? const Value.absent() : Value(price),
      id: id == null && nullToAbsent ? const Value.absent() : Value(id),
      productName: productName == null && nullToAbsent
          ? const Value.absent()
          : Value(productName),
    );
  }

  Order copyWith({String price, int id, String productName}) => Order(
        price: price ?? this.price,
        id: id ?? this.id,
        productName: productName ?? this.productName,
      );
  @override
  String toString() {
    return (StringBuffer('Order(')
          ..write('price: $price, ')
          ..write('id: $id, ')
          ..write('productName: $productName')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      $mrjf($mrjc(price.hashCode, $mrjc(id.hashCode, productName.hashCode)));
  @override
  bool operator ==(dynamic other) =>
      identical(this, other) ||
      (other is Order &&
          other.price == this.price &&
          other.id == this.id &&
          other.productName == this.productName);
}

class OrdersCompanion extends UpdateCompanion<Order> {
  final Value<String> price;
  final Value<int> id;
  final Value<String> productName;
  const OrdersCompanion({
    this.price = const Value.absent(),
    this.id = const Value.absent(),
    this.productName = const Value.absent(),
  });
  OrdersCompanion.insert({
    @required String price,
    this.id = const Value.absent(),
    @required String productName,
  })  : price = Value(price),
        productName = Value(productName);
  OrdersCompanion copyWith(
      {Value<String> price, Value<int> id, Value<String> productName}) {
    return OrdersCompanion(
      price: price ?? this.price,
      id: id ?? this.id,
      productName: productName ?? this.productName,
    );
  }
}

class $OrdersTable extends Orders with TableInfo<$OrdersTable, Order> {
  final GeneratedDatabase _db;
  final String _alias;
  $OrdersTable(this._db, [this._alias]);
  final VerificationMeta _priceMeta = const VerificationMeta('price');
  GeneratedTextColumn _price;
  @override
  GeneratedTextColumn get price => _price ??= _constructPrice();
  GeneratedTextColumn _constructPrice() {
    return GeneratedTextColumn(
      'price',
      $tableName,
      false,
    );
  }

  final VerificationMeta _idMeta = const VerificationMeta('id');
  GeneratedIntColumn _id;
  @override
  GeneratedIntColumn get id => _id ??= _constructId();
  GeneratedIntColumn _constructId() {
    return GeneratedIntColumn('id', $tableName, false,
        hasAutoIncrement: true, declaredAsPrimaryKey: true);
  }

  final VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  GeneratedTextColumn _productName;
  @override
  GeneratedTextColumn get productName =>
      _productName ??= _constructProductName();
  GeneratedTextColumn _constructProductName() {
    return GeneratedTextColumn(
      'product_name',
      $tableName,
      false,
    );
  }

  @override
  List<GeneratedColumn> get $columns => [price, id, productName];
  @override
  $OrdersTable get asDslTable => this;
  @override
  String get $tableName => _alias ?? 'orders';
  @override
  final String actualTableName = 'orders';
  @override
  VerificationContext validateIntegrity(OrdersCompanion d,
      {bool isInserting = false}) {
    final context = VerificationContext();
    if (d.price.present) {
      context.handle(
          _priceMeta, price.isAcceptableValue(d.price.value, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (d.id.present) {
      context.handle(_idMeta, id.isAcceptableValue(d.id.value, _idMeta));
    }
    if (d.productName.present) {
      context.handle(_productNameMeta,
          productName.isAcceptableValue(d.productName.value, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Order map(Map<String, dynamic> data, {String tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : null;
    return Order.fromData(data, _db, prefix: effectivePrefix);
  }

  @override
  Map<String, Variable> entityToSql(OrdersCompanion d) {
    final map = <String, Variable>{};
    if (d.price.present) {
      map['price'] = Variable<String, StringType>(d.price.value);
    }
    if (d.id.present) {
      map['id'] = Variable<int, IntType>(d.id.value);
    }
    if (d.productName.present) {
      map['product_name'] = Variable<String, StringType>(d.productName.value);
    }
    return map;
  }

  @override
  $OrdersTable createAlias(String alias) {
    return $OrdersTable(_db, alias);
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(SqlTypeSystem.defaultInstance, e);
  $OrdersTable _orders;
  $OrdersTable get orders => _orders ??= $OrdersTable(this);
  @override
  Iterable<TableInfo> get allTables => allSchemaEntities.whereType<TableInfo>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [orders];
}
