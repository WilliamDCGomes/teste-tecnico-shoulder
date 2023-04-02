import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class BaseService extends GetConnect {
  SharedPreferences? sharedPreferences;
  final String baseUrlApi = "https://shoulder.hubin.io/iomanager/api/flows/execute/route/APPEntradaNFE/";

  BaseService() {
    httpClient.timeout = const Duration(seconds: 30);
    allowAutoSignedCert = true;
  }

  Future<String> getToken() async {
    try {
      return "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJhcHAgRXN0b3F1ZSIsInRlbmFudCI6InNob3VsZGVyIiwidHlwZVRva2VuIjoiMiIsImV4cCI6MTAyNTQyNzAwNzQ1NTd9.LMysyyhfImmF-GNYlZ79R3q3txL53uuWv5AyalPHvPM";
    } catch (_) {
      throw Exception();
    }
  }

  bool hasErrorResponse(Response response) {
    return response.unauthorized || response.status.hasError || response.body == null;
  }

  @override
  Future<Response<T>> get<T>(
    String url,
    {
      Map<String, String>? headers,
      String? contentType,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
    }
  ) async {
    final response = await httpClient.get<T>(
      url,
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
    );

    if (!response.unauthorized) return response;

    final token = await getToken();
    return httpClient.get<T>(
      url,
      contentType: contentType,
      query: query,
      headers: {"Authorization": 'Bearer $token'},
      decoder: decoder,
    );
  }

  @override
  Future<Response<T>> post<T>(
    String? url,
    dynamic body,
    {
      String? contentType,
      Map<String, String>? headers,
      Map<String, dynamic>? query,
      Decoder<T>? decoder,
      Progress? uploadProgress,
    }
  ) async {
    final response = await httpClient.post<T>(
      url,
      body: body,
      headers: headers,
      contentType: contentType,
      query: query,
      decoder: decoder,
    );

    if (!response.unauthorized) return response;

    final token = await getToken();
    return httpClient.post<T>(
      url,
      body: body,
      contentType: contentType,
      query: query,
      headers: {"Authorization": 'Bearer $token'},
      decoder: decoder,
    );
  }
}
