import 'package:http/http.dart' as http;
class ApiService{
    static const baseUrl = "http://IPAddress:port_no";
    static RegisterUser(Map<String ,dynamic> userData) async {
        const postUrl = Uri.parse('$baseUrl/registerUser');
        try{
            final res = await http.post(postUrl,body:userData);
            if(res.statusCode==200){
                print("user register succesfully");
            }else{
                print("somthing wrong please try again");

            }
        }catch(e){
            debugPrint(e.toString());
        }
    }
}