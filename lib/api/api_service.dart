
import 'dart:convert';

import 'package:flutter_codigo3_ecommerce/models/banner.model.dart';
import 'package:flutter_codigo3_ecommerce/models/brand_model.dart';
import 'package:flutter_codigo3_ecommerce/models/product_model.dart';
import 'package:flutter_codigo3_ecommerce/utils/constants.dart';
import 'package:http/http.dart' as http;

class APIService{
  Future<List<BannerModel>> getBanners() async{
    List <BannerModel>listBanner = [];
    String _path = "$pathApi/banner/";
    Uri _uri = Uri.parse(_path);
    http.Response response = await http.get (_uri);
    if(response.statusCode == 200){
      listBanner = json.decode(response.body).map<BannerModel>((e){return BannerModel.fromJson(e);}).toList();
      return listBanner;
    }
    return listBanner;
  }

  Future<List<BrandModel>>getBrands() async {
    List <BrandModel>listBrand = [];
    String _path = "$pathApi/brand/";
    Uri _uri = Uri.parse(_path);
    http.Response response = await http.get(_uri);
    if(response.statusCode == 200){
      listBrand = json.decode(response.body).map<BrandModel>((item)=>BrandModel.fromJson(item)).toList();
      return listBrand;
    }
    return listBrand;
  }
  Future<List<ProductModel>> getProducts() async {
    List <ProductModel> listProduct = [];
    String _path = "$pathApi/product/";
    Uri _uri = Uri.parse(_path);
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      listProduct = json.decode(response.body).map<ProductModel>((item)=>ProductModel.fromJson(item)).toList();
      return listProduct;
    }
    return listProduct;
  }

}