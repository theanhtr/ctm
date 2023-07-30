I) Attribute

1. Cung cấp phương thức để liên kết metadata hoặc thông tin khai báo của tập hợp kiểu, phương thức, thuộc tính...

II) Vai trò

1. Liên kết Metadata
   -) Metadata là các thông tin của một kiểu dữ liệu trong chương trình.
   -) Ví dụ: int i = 42;
   Type type = i.GetType();
   Console.WriteLine(type); //output: System.Int32

2. Khai báo các thuộc tính cho hàm, classes...
   -) Sử dụng []
   -) Ví dụ:
   +) void MethodA([In][Out] ref double x) { }
   +) [Serializable]

3. Attribute cũng nhận các đối số giống hàm.

III) Custom attribute

1.  Khai báo
    [System.AttributeUsage(System.AttributeTargets.Class |
    System.AttributeTargets.Struct)
    ]
    public class AuthorAttribute : System.Attribute
    {
    private string Name;
    public double Version;

        public AuthorAttribute(string name)
        {
            Name = name;
            Version = 1.0;
        }

    }

2.  Sử dụng
    [Author("P. Ackerman", Version = 1.1)]

IV) Tham khảo

1. https://learn.microsoft.com/en-us/dotnet/csharp/advanced-topics/reflection-and-attributes/attribute-tutorial
