
import 'package:dio/dio.dart';


class HttpUtil{
    String Bass_Url = "https://www.baidu.com";
    static HttpUtil instance;
    Dio dio;
    Options options;

    static HttpUtil getInstance(){
      if (instance == null){
        instance = new HttpUtil();
      }
      return instance;
    }

    HttpUtil(){
      options = Options(
        baseUrl: Bass_Url,
        connectTimeout: 15000,
        receiveTimeout: 3000,
        headers: {},
      );
      dio = new Dio(options);
    }

    get(url,{data,options,cancelToken}) async{
      Response response;
      try {
        response = await dio.get(
          url,
          data: data,
          cancelToken: cancelToken,
        );
      } on DioError catch (e){
        if (CancelToken.isCancel(e)){
          print('get 请求取消' + e.message);
        }
        print('get 请求发生错误:$e');
      }
      return response.data;
    }

    post(url,{data,options,cancelToken}) async {
      Response response;
      try {

      } on DioError catch (e) {
        if (CancelToken.isCancel(e)) {
          print('post请求取消' + e.message);
        }
        print('post 请求发生错误: $e');
      }
      return response;
    }
}

//Use Demo
//Future getData() async {
//  String url = Api.NEWS_LIST;
//  var data = {'pageIndex': 1, 'pageSize': 10};
//  var response = await HttpUtil().get(url, data: data);
//
//  setState(() {
//    ...
//  });
//}





