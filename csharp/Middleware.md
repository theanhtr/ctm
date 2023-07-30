I) Request pineline?

1. Các middleware kết nối với nhau tạo thành một xích, chuỗi các middleware được gọi là pineline.
2. Là một cơ chế để xử lý một request đầu vào, kết thúc là một response. Nó chỉ ra cách mà ứng dụng phản hồi với HTTP Request.

II) Middleware?

1. Middleware là một phần mềm dùng để xử lý tất cả các:
   +) request trước khi chúng gọi được vào controller.
   +) reponse trước khi chúng được trả về api.

2. Với request middleware có quyền từ chối (ngăn) hoặc gọi đến next component (có thể là controller hoặc middleware tiếp theo).

III) Vai trò middleware

1. Middleware là cầu nối tương tác giữa người dùng và hệ thống, đóng vai trò trung gian giữa request/reponse và các xử lý logic bên trong web server. Ví dụ:
   +) Cần xác thực người dùng.
   +) Yêu cầu đăng nhập.
   +) Chuyển hướng người dùng.
   +) Thay đổi/chuyển hóa các tham số.
   +) Xử lý request đầu vào, reponse được tạo ra.

IV) Sử dụng

1. Trong asp.net core có sẵn một loạt middleware hoặc có thể xây dựng thêm và đưa vào trong một pineline. Ví dụ như:
   +) Authentication Middleware: xác thực và định danh người dùng.
   +) CORS Middleware: cho phép cấu hình CORS cho phép, từ chối từ các nguồn khác.
   +) Logging Middleware: theo dõi y/cầu và lỗi vào bộ ghi log.
   +) Session Middleware: hỗ trợ lưu trữ và truy cập dữ liệu session của user.
   +) Routing Middleware: phân tích url và định tuyến đến các controller tương ứng.

2. Việc thêm middleware và pineline được thực hiện ở Program.cs.

3. Middleware xử lý các http message có dạng:
   +) Nhận đầu vào tham số kiểu HTTPContext (chứa HTTPRequest và HTTPResponse).

V) Tạo middleware

1.  Cấu trúc của middleware:
    +) Có một public contructor với tham số thức nhất là RequestDelegate, các tham số tiếp theo phải được inject từ hệ thống.
    +) Có một trong 2 phương thức Invoke hoặc InvokeAsync với tham số nhận là HTTPContext, những phương thức này trả về Task.
    +) Trong Invoke/InvokeAsync sẽ viết code xử lý tác vụ Middleware, sau đó quyết định chuyển đến Middleware tiếp theo bằng cách gọi RequestDelegate đã truyền trong hàm tạo.

2.  Ví dụ:
    namespace \_02.middleware {
    public class CheckAcessMiddleware {
    // Lưu middlewware tiếp theo trong Pipeline
    private readonly RequestDelegate \_next;
    public CheckAcessMiddleware (RequestDelegate next) => \_next = next;
    public async Task Invoke (HttpContext httpContext) {
    if (httpContext.Request.Path == "/testxxx") {

            Console.WriteLine ("CheckAcessMiddleware: Cấm truy cập");
            await Task.Run (
              async () => {
                string html = "<h1>CAM KHONG DUOC TRUY CAP</h1>";
                httpContext.Response.StatusCode = StatusCodes.Status403Forbidden;
                await httpContext.Response.WriteAsync (html);
              }
            );

          } else {

            // Thiết lập Header cho HttpResponse
            httpContext.Response.Headers.Add ("throughCheckAcessMiddleware", new [] { DateTime.Now.ToString () });

            Console.WriteLine ("CheckAcessMiddleware: Cho truy cập");

            // Chuyển Middleware tiếp theo trong pipeline
            await _next (httpContext);

          }

        }

}
}

+) Đưa Middleware vào pineline
app.UseMiddleware<CheckAcessMiddleware>();

3. Có thể implement IMiddleware và chỉ cần xây dựng phương thức:
   +) Task InvokeAsync(HttpContext context, RequestDelegate next)

4. Truyền dữ liệu giữa các middleware:
   -) Lưu giữa liệu từ Middleware A:
   +) context.Items.Add("dulieu1", "Data Object ..."); với context là HTTPContext
   -) Đọc dữ liệu từ Middleware B:
   +) var data = context.Items["dulieu1"];

V) Tham khảo

1. https://xuanthulab.net/asp-net-core-tao-middleware-va-dang-ky-vao-pipeline-cua-ung-dung-web-c-csharp.html

2. https://viblo.asia/p/tong-quan-ve-middleware-ung-dung-middleware-trong-aspnet-core-RnB5pOz2lPG

3. https://learn.microsoft.com/en-us/aspnet/core/fundamentals/middleware/?view=aspnetcore-7.0
