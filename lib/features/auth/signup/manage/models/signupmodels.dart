class SignupModels {
    SignupModels({
        required this.status,
        required this.message,
        required this.data,
    });

    final bool? status;
    final String? message;
    final dynamic data;

    factory SignupModels.fromJson(Map<String, dynamic> json){ 
        return SignupModels(
            status: json["status"],
            message: json["message"],
            data: json["data"],
        );
    }

    Map<String, dynamic> toJson() => {
        "status": status,
        "message": message,
        "data": data,
    };

}
