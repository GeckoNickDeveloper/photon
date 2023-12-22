import 'dart:convert';
import 'dart:io';
//import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:photon/exception/photon_bad_request_exception.dart';
import 'package:photon/exception/photon_conflict_exception.dart';
import 'package:photon/exception/photon_forbidden_exception.dart';
import 'package:photon/exception/photon_not_implemented_exception.dart';
import 'package:photon/exception/photon_teapot_exception.dart';
import 'package:photon/exception/photon_unknown_status_exception.dart';
import 'package:photon/models/device_infos.dart';
import 'package:photon/models/photon_history_record.dart';
import 'package:photon/models/photon_image.dart';
import 'package:photon/models/photon_server_model.dart';
import 'package:photon/models/settings.dart';
import 'package:http/http.dart' as http;

class PhotonApiService {
  static PhotonApiService? _instance;

  PhotonApiService._();

  factory PhotonApiService() {
    _instance ??= PhotonApiService._();
    return _instance!;
  }
  


  //=================================== API METHODS
  /// Requires authentication
  /// 
  /// Upload an image to the specified photon server
  /*Future<void> uploadImage(PhotonServerModel server, PhotonImage img) async {
    final device = DeviceInfos();
    final settings = Settings();
    


    // Build uri
    final uri = Uri.http(
      server.uri.authority,
      'upload',
    );

    // Build client
    final dio = Dio(
      BaseOptions(
        connectTimeout: const Duration(milliseconds: 500),
        receiveTimeout: const Duration(milliseconds: 2500),
        followRedirects: false,
        headers: {
          'uuid': device.uuid!,
          'token': server.token
        },
      )
    );

    // Build request
    final data = {
      'path': img.path,
      'file': MultipartFile.fromFileSync(
        img.path,
        filename: img.name,
      )
    };

    try {
      // send data
      final res = await dio.post(uri.toString(), data: data);

      if (res.statusCode != null) {
        _checkError(res.statusCode!);
      }

      if(settings.deleteOnUpload) {
        // TODO implement element delete
      }

    } on DioException catch(e) {
      if (e.response != null) {
        if (e.response!.statusCode != null) {
          _checkError(e.response!.statusCode!);
        } else {
          throw Exception('Big Error');
        }
      } else {
        print(e.toString());
        throw Exception('Error In request sending');
      }
    }
  }*/

  Future<void> upload(PhotonServerModel server, PhotonImage img) async {
    final device = DeviceInfos();
    final settings = Settings();
    
    if (!img.file.existsSync()) {
      return;
    }

    final path = img.path.split('/');
    final realPath = path.sublist(4, path.length - 1).join('/');

    // Build uri
    final uri = Uri.http(
      server.uri.authority,
      'upload',
    );

    // Build request
    final request = http.MultipartRequest('POST', uri);
    request.files.add(
      await http.MultipartFile.fromPath(
        'file',
        img.path,
      )
    );
    request.headers.addAll({
      'uuid': device.uuid!,
      'token': server.token,
    });
    request.fields.addAll({
      'path': realPath
    });

    // Send request
    final response = await request.send();/*await http.post(
      Uri.http(
        server.uri.authority,
        'upload',
      ),
      headers: {
        'uuid': device.uuid!,
        'token': server.token
      },
      body: {
        'path': img.path,
        'file': base64Encode((img.file as File).readAsBytesSync())
      },
    );*/

    _checkError(response.statusCode);

    if(settings.deleteOnUpload) {
      try {
        print('deleting ${img.name}');
        img.file.deleteSync();
      } on Exception {
        print('cannot delete ${img.name}');
      }
    }
  }

  /// Requires authentication
  /// 
  /// Retrieves a list of all the images uploaded to the specified photon server
  Future<List<PhotonHistoryRecord>> history(PhotonServerModel server) async {
    final device = DeviceInfos();
    final List<PhotonHistoryRecord> list = [];

    // Make request
    final response = await http.get(
      Uri.http(
        server.uri.authority,
        'history/${device.uuid!}',
      ),
      headers: {
        'uuid': device.uuid!,
        'token': server.token
      }
    );

    /// Error Handling
    /// 
    /// If no error occours, the function does not throw exceptions
    _checkError(response.statusCode);

    // Parse data
    final data = jsonDecode(response.body);
    for(var i in data) {
      try {
        list.add(PhotonHistoryRecord.fromJson(jsonString: jsonEncode(i)));
        print(i.toString());
      } finally { }
    }

    return list;
  }
  


  /// Must be invoked in order to access API feat /// 
  /// Pairs the device to the server
  Future<void> register(PhotonServerModel server) async {
    final device = DeviceInfos();
    
    // Make request
    final response = await http.put(
      Uri.http(
        server.uri.authority,
        'register',
      ),
      headers: {
        'uuid': device.uuid!,
        'token': server.token
      }
    );

    /// Error Handling
    /// 
    /// If no error occours, the function does not throw exceptions
    _checkError(response.statusCode);
  }



  /// Error handling function to check the status 
  void _checkError(int status) {
    print('STATUS ============================== $status');
    
    switch(status) {
      case 200:
        print('Successful call');
        break;
      case 400:
        print('Bad Request');
        throw PhotonBadRequestException();
      case 403:
        print('Forbidden');
        throw PhotonForbiddenException();
      case 409:
        print('Conflict');
        throw PhotonConflictException();
      case 418:
        print('Teapot');
        throw PhotonTeapotException();
      case 501:
        print('Not implemented');
        throw PhotonNotImplementedException();
      default:
        print('Unknown status');
        throw PhotonUnknownStatusException();
    }
  }
}