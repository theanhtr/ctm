export var headersInfo = [
  {
    id: "EmployeeCode",
    serverName: "EmployeeCode",
    showName: "Mã nhân viên",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: true,
    isSelected: true,
    isCannotChangeChecked: true, //những trường bắt buộc phải thêm
    description: "Nhập mã nhân viên",
  },
  {
    id: "FullName",
    serverName: "FullName",
    showName: "Tên nhân viên",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: true,
    isSelected: true,
    isCannotChangeChecked: true,
    description: "Nhập tên nhân viên",
  },
  {
    id: "DepartmentCode",
    serverName: "DepartmentCode",
    showName: "Mã đơn vị",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: true,
    isSelected: true,
    isCannotChangeChecked: true,
    description: "Nhập mã đơn vị",
  },
  {
    id: "Gender",
    serverName: "Gender",
    showName: "Giới tính",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "Nam; Nữ; Khác",
  },
  {
    id: "DateOfBirth",
    serverName: "DateOfBirth",
    showName: "Ngày sinh",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "",
  },
  {
    id: "IdentityNumber",
    serverName: "IdentityNumber",
    showName: "Số CMND",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "Nhập số chứng minh nhân dân",
  },
  {
    id: "IdentityDate",
    serverName: "IdentityDate",
    showName: "Ngày cấp",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "Ngày cấp chứng minh nhân dân",
  },
  {
    id: "IdentityPlace",
    serverName: "IdentityPlace",
    showName: "Nơi cấp",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "Nơi cấp chứng minh nhân dân",
  },
  {
    id: "Position",
    serverName: "Position",
    showName: "Chức danh",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "",
  },
  {
    id: "SupplierCustomerGroup",
    serverName: "SupplierCustomerGroup",
    showName: "Nhóm KH, NCC",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "Nhóm khách hàng, nhà cung cấp",
  },
  {
    id: "PayAccount",
    serverName: "PayAccount",
    showName: "TK công nợ phải trả",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "",
  },
  {
    id: "ReceiveAccount",
    serverName: "ReceiveAccount",
    showName: "TK công nợ phải thu",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "",
  },
  {
    id: "Salary",
    serverName: "Salary",
    showName: "Lương thỏa thuận",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "",
  },
  {
    id: "SalaryCoefficients",
    serverName: "SalaryCoefficients",
    showName: "Hệ số lương",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "",
  },
  {
    id: "SalaryPaidForInsurance",
    serverName: "SalaryPaidForInsurance",
    showName: "Lương đóng bảo hiểm",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "",
  },
  {
    id: "PersonalTaxCode",
    serverName: "PersonalTaxCode",
    showName: "Mã số thuế",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "",
  },
  {
    id: "TypeOfContract",
    serverName: "TypeOfContract",
    showName: "Loại hợp đồng",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "",
  },
  {
    id: "NumberOfDependents",
    serverName: "NumberOfDependents",
    showName: "Số người phụ thuộc",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "",
  },
  {
    id: "AccountNumber",
    serverName: "AccountNumber",
    showName: "Số tài khoản",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "",
  },
  {
    id: "BankName",
    serverName: "BankName",
    showName: "Tên ngân hàng",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "",
  },
  {
    id: "BankBranch",
    serverName: "BankBranch",
    showName: "Chi nhánh TK ngân hàng",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "",
  },
  {
    id: "BankProvince",
    serverName: "BankProvince",
    showName: "Tỉnh/TP ngân hàng",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "",
  },
  {
    id: "ContactAddress",
    serverName: "ContactAddress",
    showName: "Địa chỉ",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "",
  },
  {
    id: "ContactPhoneNumber",
    serverName: "ContactPhoneNumber",
    showName: "ĐT di động",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "",
  },
  {
    id: "ContactLandlinePhoneNumber",
    serverName: "ContactLandlinePhoneNumber",
    showName: "ĐT cố định",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "",
  },
  {
    id: "ContactEmail",
    serverName: "ContactEmail",
    showName: "Email",
    excelColumnIndex: 0,
    isShow: true,
    isRequired: false,
    isSelected: false,
    isCannotChangeChecked: false,
    description: "",
  },
];