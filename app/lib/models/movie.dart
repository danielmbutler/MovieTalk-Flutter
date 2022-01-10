/*
* Copyright 2021 Amazon.com, Inc. or its affiliates. All Rights Reserved.
*
* Licensed under the Apache License, Version 2.0 (the "License").
* You may not use this file except in compliance with the License.
* A copy of the License is located at
*
*  http://aws.amazon.com/apache2.0
*
* or in the "license" file accompanying this file. This file is distributed
* on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either
* express or implied. See the License for the specific language governing
* permissions and limitations under the License.
*/

// NOTE: This file is generated and may not follow lint rules defined in your app
// Generated files can be excluded from analysis in analysis_options.yaml
// For more info, see: https://dart.dev/guides/language/analysis-options#excluding-code-from-analysis

// ignore_for_file: public_member_api_docs, file_names, unnecessary_new, prefer_if_null_operators, prefer_const_constructors, slash_for_doc_comments, annotate_overrides, non_constant_identifier_names, unnecessary_string_interpolations, prefer_adjacent_string_concatenation, unnecessary_const, dead_code

import 'package:amplify_datastore_plugin_interface/amplify_datastore_plugin_interface.dart';
import 'package:flutter/foundation.dart';


/** This is an auto generated class representing the Movie type in your schema. */
@immutable
class Movie extends Model {
  static const classType = const _MovieModelType();
  final String id;
  final String? _title;
  final String? _latestMessage;
  final String? _latestMessageTime;
  final String? _img;
  final String? _overview;
  final String? _rating;

  @override
  getInstanceType() => classType;
  
  @override
  String getId() {
    return id;
  }
  
  String? get title {
    return _title;
  }
  
  String? get latestMessage {
    return _latestMessage;
  }
  
  String? get latestMessageTime {
    return _latestMessageTime;
  }
  
  String? get img {
    return _img;
  }
  
  String? get overview {
    return _overview;
  }
  
  String? get rating {
    return _rating;
  }
  
  const Movie._internal({required this.id, title, latestMessage, latestMessageTime, img, overview, rating}): _title = title, _latestMessage = latestMessage, _latestMessageTime = latestMessageTime, _img = img, _overview = overview, _rating = rating;
  
  factory Movie({String? id, String? title, String? latestMessage, String? latestMessageTime, String? img, String? overview, String? rating}) {
    return Movie._internal(
      id: id == null ? UUID.getUUID() : id,
      title: title,
      latestMessage: latestMessage,
      latestMessageTime: latestMessageTime,
      img: img,
      overview: overview,
      rating: rating);
  }
  
  bool equals(Object other) {
    return this == other;
  }
  
  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    return other is Movie &&
      id == other.id &&
      _title == other._title &&
      _latestMessage == other._latestMessage &&
      _latestMessageTime == other._latestMessageTime &&
      _img == other._img &&
      _overview == other._overview &&
      _rating == other._rating;
  }
  
  @override
  int get hashCode => toString().hashCode;
  
  @override
  String toString() {
    var buffer = new StringBuffer();
    
    buffer.write("Movie {");
    buffer.write("id=" + "$id" + ", ");
    buffer.write("title=" + "$_title" + ", ");
    buffer.write("latestMessage=" + "$_latestMessage" + ", ");
    buffer.write("latestMessageTime=" + "$_latestMessageTime" + ", ");
    buffer.write("img=" + "$_img" + ", ");
    buffer.write("overview=" + "$_overview" + ", ");
    buffer.write("rating=" + "$_rating");
    buffer.write("}");
    
    return buffer.toString();
  }
  
  Movie copyWith({String? id, String? title, String? latestMessage, String? latestMessageTime, String? img, String? overview, String? rating}) {
    return Movie(
      id: id ?? this.id,
      title: title ?? this.title,
      latestMessage: latestMessage ?? this.latestMessage,
      latestMessageTime: latestMessageTime ?? this.latestMessageTime,
      img: img ?? this.img,
      overview: overview ?? this.overview,
      rating: rating ?? this.rating);
  }
  
  Movie.fromJson(Map<String, dynamic> json)  
    : id = json['id'],
      _title = json['title'],
      _latestMessage = json['latestMessage'],
      _latestMessageTime = json['latestMessageTime'],
      _img = json['img'],
      _overview = json['overview'],
      _rating = json['rating'];
  
  Map<String, dynamic> toJson() => {
    'id': id, 'title': _title, 'latestMessage': _latestMessage, 'latestMessageTime': _latestMessageTime, 'img': _img, 'overview': _overview, 'rating': _rating
  };

  static final QueryField ID = QueryField(fieldName: "movie.id");
  static final QueryField TITLE = QueryField(fieldName: "title");
  static final QueryField LATESTMESSAGE = QueryField(fieldName: "latestMessage");
  static final QueryField LATESTMESSAGETIME = QueryField(fieldName: "latestMessageTime");
  static final QueryField IMG = QueryField(fieldName: "img");
  static final QueryField OVERVIEW = QueryField(fieldName: "overview");
  static final QueryField RATING = QueryField(fieldName: "rating");
  static var schema = Model.defineSchema(define: (ModelSchemaDefinition modelSchemaDefinition) {
    modelSchemaDefinition.name = "Movie";
    modelSchemaDefinition.pluralName = "Movies";
    
    modelSchemaDefinition.authRules = [
      AuthRule(
        authStrategy: AuthStrategy.PUBLIC,
        operations: [
          ModelOperation.CREATE,
          ModelOperation.UPDATE,
          ModelOperation.DELETE,
          ModelOperation.READ
        ])
    ];
    
    modelSchemaDefinition.addField(ModelFieldDefinition.id());
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Movie.TITLE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Movie.LATESTMESSAGE,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Movie.LATESTMESSAGETIME,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Movie.IMG,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Movie.OVERVIEW,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
    
    modelSchemaDefinition.addField(ModelFieldDefinition.field(
      key: Movie.RATING,
      isRequired: false,
      ofType: ModelFieldType(ModelFieldTypeEnum.string)
    ));
  });
}

class _MovieModelType extends ModelType<Movie> {
  const _MovieModelType();
  
  @override
  Movie fromJson(Map<String, dynamic> jsonData) {
    return Movie.fromJson(jsonData);
  }
}