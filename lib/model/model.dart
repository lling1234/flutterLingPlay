/// 统一返回结构模型
class ResultType<T> {
  // 代码，成功为200
  final int code;

  // 数据
  T? data;

  // 消息
  final String msg;

  // 是否成功标志
  final bool success;

  ResultType({
    required this.code,
    this.data,
    required this.msg,
    required this.success,
  });

  ResultType.fromJson(Map<String, dynamic> json)
      : msg = json["msg"],
        data = json["data"],
        code = json["code"],
        success = json["success"];

  ResultType.fromJsonSerialize(
      Map<String, dynamic> json, T Function(Map<String, dynamic>) serialize)
      : msg = json["msg"],
        data = (json["data"] != null && json["data"] is Map)
            ? serialize(json["data"])
            : null,
        code = json["code"],
        success = json["success"];
}

class PageResp<T> {
  final int limit;
  final int total;
  final List<T> result;

  PageResp(this.limit, this.total, this.result);

  static PageResp<T> fromMap<T>(Map<String, dynamic> map, Function mapping) {
    int limit = map["limit"] ?? 0;
    int total = map["total"] ?? 0;
    List<dynamic> result = map["result"] ?? [];

    List<T> ans = result.map((item) => mapping(item) as T).toList();
    return PageResp<T>(limit, total, ans);
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["limit"] = limit;
    json["total"] = total;
    json["result"] = result;
    return json;
  }
}

/// 内核请求模型
class ReqestType {
  // 模块
  final String module;

  // 方法
  final String action;

  // 参数
  final dynamic params;

  ReqestType({
    required this.module,
    required this.action,
    required this.params,
  });

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};
    json["module"] = module;
    json["action"] = action;
    json["params"] = params;
    return json;
  }
}

/// 事件接收模型
class ReceiveType {
  // 目标
  final String target;

  // 数据
  final dynamic data;

  ReceiveType({
    required this.target,
    required this.data,
  });
}

class HttpRequestResult {
  final int code;
  final bool success;
  final dynamic data;
  final dynamic msg;

  HttpRequestResult({
    required this.code,
    required this.success,
    required this.data,
    required this.msg,
  });

  factory HttpRequestResult.fromJson(Map<dynamic, dynamic> json) {
    return HttpRequestResult(
      code: json['code'],
      success: json['success'],
      data: json['data'],
      msg: json['msg'],
    );
  }

  Map<dynamic, dynamic> toJson() {
    return {
      'code': code,
      'success': success,
      'data': data,
      'msg': msg,
    };
  }
}
