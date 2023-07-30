const MISAResource = {
  VN: {
    AddEmployeeDataNameField: {
      employeeId: "Nhân viên",
      employeeCode: "Mã code nhân viên",
      fullName: "Tên nhân viên",
      gender: "Giới tính",
      dateOfBirth: "Ngày sinh",

      identityNumber: "Số CMND",
      identityDate: "Ngày cấp CMND",
      identityPlace: "Nơi cấp CMND",

      departmentId: "Đơn vị",
      departmentCode: "Mã đơn vị",
      departmentName: "Tên đơn vị",

      supplierCustomerGroup: "Nhóm khách hàng, nhà cung cấp",
      payAccount: "TK công nợ phải trả",
      receiveAccount: "TK công nợ phải thu",

      position: "Chức danh",

      /* thông tin tiền lương */
      salary: "Lương thỏa thuận",
      salaryPaidForInsurance: "Lương đóng bảo hiểm",
      salaryCoefficients: "Hệ số lương",

      personalTaxCode: "Mã số thuế",
      typeOfContract: "Loại hợp đồng",
      numberOfDependents: "Số người phụ thuộc",

      /* tài khoản ngân hàng */
      accountNumber: "Số tài khoản ngân hàng",
      bankName: "Tên ngân hàng",
      bankBranch: "Chi nhánh ngân hàng",
      bankProvince: "Tỉnh/TP của ngân hàng",

      /* thông tin liên hệ */
      contactAddress: "Địa chỉ",
      contactEmail: "Email",
      contactPhoneNumber: "ĐT di động",
      contactLandlinePhoneNumber: "ĐT cố định",
    },

    Validate: {
      ParamPassToFunctionError: "Dữ liệu truyền vào hàm không hợp lệ.",
      MaxLengthError: "Độ dài tối đa của <%s> là %d kí tự.",
      MinLengthError: "Độ dài tối thiểu của <%s> là %d kí tự.",
      EmptyError: "%s không được phép để trống.",
      DateNotGreaterThanToday: "%s không được lớn hơn ngày hiện tại.",
      FormatError: "%s không đúng định dạng.",
    },

    ServerError: {
      ConnectError: "Lỗi đường truyền, vui lòng thử lại sau.",
    },

    ClientError: {
      WrongFormatDate: "Ngày tháng không đúng định dạng dd/MM/yyyy.",
    },

    CustomerCodeInvalidError: {
      NewCodeError: "Lấy mã mới thất bại, vui lòng liên hệ với MISA.",
      Empty: "Mã không được phép để trống.",
    },

    FullNameInvalidError: {
      Empty: "Tên không được phép để trống.",
    },

    DepartmentInvalidError: {
      Empty: "Đơn vị không được phép để trống.",
      NotFound: "Dữ liệu <Đơn vị> không có trong danh mục.",
    },

    EmailInvalidError: {
      Format: "Email không đúng định dạng.",
    },

    ToastTitle: {
      Info: "Thông tin!",
      Warning: "Cảnh báo!",
      Error: "Lỗi!",
      Success: "Thành công!",
    },

    Paging: {
      Title: " bản ghi trên 1 trang",
      Error: " lỗi phân trang",
    },

    DepartmentError: {
      Get: "Lấy thông tin phòng ban bị lỗi.",
    },

    EmployeeError: {
      Get: "Lấy thông tin người dùng bị lỗi.",
    },

    AddEmployee: {
      Success: "Nhân viên đã được thêm.",
      Error: "Gặp lỗi khi thêm nhân viên.",
      SameCodeError: "đã tồn tại trong hệ thống, vui lòng kiểm tra lại.",
    },

    UpdateEmployee: {
      Success: "Thông tin nhân viên đã được cập nhật.",
      Error: "Gặp lỗi khi cập nhật thông tin nhân viên.",
    },

    DeleteEmployee: {
      Success: "Xóa thành công nhân viên ",
      NotFound: "Không tìm thấy nhân viên để xóa.",
      Error: "Gặp lỗi khi xóa nhân viên.",
    },

    DeleteMultipleEmployee: {
      Success: "Xóa thành công ",
      NotFound: "Không tìm thấy nhân viên để xóa.",
      Error: "Gặp lỗi khi xóa nhiều nhân viên.",
    },

    OutConfirmPopup: {
      Title: "Dữ liệu đã bị thay đổi. Bạn có muốn cất không?",
    },

    ExportExcel: {
      Success: "Xuất thành công dữ liệu ra file excel.",
      Error: "Gặp lỗi khi xuất dữ liệu ra file excel.",
    },

    ImportExcel: {
      SessionIsOver:
        "Phiên làm việc của bạn đã hết, vui lòng reload trang để bắt đầu phiên mới.",
    },

    ImportSelectSourceFileNoti: {
      FileNotFound: "Chưa nhập file.",
      MaxSizeError: "File quá lớn, không thể nhập khẩu.",
      FormatError: "Tệp đính kèm không hợp lệ, chỉ chấp file .xlsx.",
      SheetNotFound: "Không tìm thấy sheet.",
      HeaderIndexGreaterThanZero: "Dòng tiêu đề phải lớn hơn 0.",
      HeaderEmpty: "Tên tiêu đề không được để trống.",
      HeaderDuplicate: "Tiêu đề đã bị trùng.",
      SheetIsEmpty: "Sheet không có dữ liệu.",
    },

    ImportHeaderMergeNoti: {
      HeaderRequiredNotMap:
        "Không thể tiếp tục nhập dữ liệu nếu các cột bắt buộc chưa được ghép với cột tương ứng trên tệp Excel. Vui lòng kiểm tra lại.",
    },
  },

  EN: {
    CustomerCodeInvalidError: {
      NewCodeError: "Get new code error, please contact MISA.",
      Empty: "Code is not empty.",
    },
    FullNameInvalidError: {
      Empty: "Name is not empty.",
    },
    DepartmentInvalidError: {
      Empty: "Department is not empty.",
      NotFound: "Department not found.",
    },
    EmailInvalidError: {
      Format: "Email wrong format.",
    },

    ToastTitle: {
      Info: "Info!",
      Warning: "Warning!",
      Error: "Error!",
      Success: "Success!",
    },

    Paging: {
      Title: " record per page",
      Error: " error paging",
    },

    DepartmentError: {
      Get: "Get the department information is error.",
    },

    EmployeeError: {
      Get: "Get the employee information is error.",
    },
    AddEmployee: {
      Success: "Employee has been added.",
      Error: "Error while adding employee.",
      SameCodeError: "already exists in the system, please check again.",
    },
    UpdateEmployee: {
      Success: "Employee information has been updated.",
      Error: "Error while updating employee information.",
    },
    DeleteEmployee: {
      Success: "Successfully deleted employee ",
      NotFound: "Couldn't find an employee to delete.",
      Error: "Got an error when deleting an employee.",
    },
    DeleteMultipleEmployee: {
      Success: "Successfully deleted ",
      NotFound: "Couldn't find an employee to delete.",
      Error: "Got an error when deleting multiple employee.",
    },

    ExportExcel: {
      Success: "Export excel success.",
      Error: "Export excel error.",
    },
  },
};

export default MISAResource;
