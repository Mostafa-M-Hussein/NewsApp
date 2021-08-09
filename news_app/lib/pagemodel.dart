import 'package:flutter/material.dart' ;
class PageModel
{
  String _images  ;
  IconData _icons ;
  String _title  ;
  String _description ;

  PageModel(this._title , this._description , this._icons , this._images ) ;

  String get images => _images ;

  IconData get icon => _icons ;


  String get description => _description  ;

  String get title => _title ;




}