using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using MISA.WebFresher052023.CTM.Application;

using MISA.WebFresher052023.CTM.Domain;

namespace MISA.WebFresher052023.CTM.Controllers
{
    /// <summary>
    /// Controller của nhân viên
    /// </summary>
    /// CreatedBy: TTANH (12/07/2023)
    [Route("api/v1/[controller]")]
    [ApiController]
    public class EmployeesController : CodeController<Employee, EmployeeDto, EmployeeCreateDto, EmployeeUpdateDto>
    {
        #region Fields
        private readonly IExcelService<EmployeeExcelDto> _excelService;
        private readonly IEmployeeService _employeeService;
        private readonly IHostEnvironment _hostEnvironment;
        private readonly IFileService _fileService;
        private readonly ICacheService _cacheService;
        private readonly string folderStore;
        #endregion

        #region Constructor
        public EmployeesController(IEmployeeService employeeService, IExcelService<EmployeeExcelDto> excelService, IHostEnvironment hostEnvironment, IFileService fileService, ICacheService cacheService) : base(employeeService)
        {
            _employeeService = employeeService;
            _excelService = excelService;
            _hostEnvironment = hostEnvironment;
            folderStore = Path.Combine(_hostEnvironment.ContentRootPath, AppConst.ClientFolderStoreName);
            _fileService = fileService;
            _cacheService = cacheService;
        }
        #endregion

        #region Methods
        /// <summary>
        /// Hàm xuất dữ liệu ra file excel
        /// </summary>
        /// <param name="searchText">Nội dung tìm kiếm</param>
        /// <returns>Download file</returns>
        /// CreatedBy: TTANH (16/07/2023)
        [HttpGet("excel")]
        public async Task<IActionResult> ExportToExcelAsync([FromQuery] string? searchText)
        {
            var content = await _excelService.ExportToExcelAsync(searchText);

            return File(content, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "Danh_sach_nhan_vien.xlsx");
        }

        /// <summary>
        /// Tải mẫu cơ bản excel cơ bản của nhân viên
        /// </summary>
        /// CreatedBy: TTANH (26/07/2023)
        [HttpGet("excel/template")]
        public async Task<IActionResult> DownloadBasicTemplate()
        {
            var folderServerPath = Path.Combine(_hostEnvironment.ContentRootPath, AppConst.ServerFolderStoreName, "employee-excel-template");
            var filePath = Path.Combine(folderServerPath, "Mau_danh_muc_nhan_vien.xlsx");

            // Kiểm tra xem file có tồn tại hay không
            if (!System.IO.File.Exists(filePath))
            {
                throw new NotFoundException();
            }

            // Đọc nội dung của file Excel
            var content = System.IO.File.ReadAllBytes(filePath);

            return File(content, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "Mau_danh_muc_nhan_vien.xlsx");
        }

        /// <summary>
        /// Tải mẫu excel đầy đủ của nhân viên
        /// </summary>
        /// CreatedBy: TTANH (26/07/2023)
        [HttpGet("excel/template-full")]
        public async Task<IActionResult> DownloadFullTemplate()
        {
            var folderServerPath = Path.Combine(_hostEnvironment.ContentRootPath, AppConst.ServerFolderStoreName, "employee-excel-template");
            var filePath = Path.Combine(folderServerPath, "Mau_danh_muc_nhan_vien_full.xlsx");

            // Kiểm tra xem file có tồn tại hay không
            if (!System.IO.File.Exists(filePath))
            {
                throw new NotFoundException();
            }

            // Đọc nội dung của file Excel
            var content = System.IO.File.ReadAllBytes(filePath);

            return File(content, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "Mau_danh_muc_nhan_vien_full.xlsx");
        }

        /// <summary>
        /// Hàm import file excel
        /// </summary>
        /// CreatedBy: TTANH (17/07/2023)
        [HttpPost("excel")]
        public async Task<IActionResult> ImportExcelAsync(IFormFile excelFile)
        {
            if (excelFile != null && excelFile.Length > 0)
            {
                if (excelFile.Length > AppConst.MaxSizeFileUpload)
                {
                    throw new ValidateException(StatusErrorCode.MaxSizeFileError, ResourceVN.Max_Size_File_Error, excelFile.Length);
                }

                var fileExtention = excelFile.FileName.Split('.').Last<string>();

                if (fileExtention != "xlsx")
                {
                    throw new ValidateException(StatusErrorCode.FormatExcelError, ResourceVN.Format_Excel_Error, fileExtention);
                }

                HttpContext.Session.SetString("ExcelFileId", Guid.NewGuid().ToString());

                var excelFileId = HttpContext.Session.GetString("ExcelFileId");

                var fileName = $"{excelFileId}.xlsx";

                var filePath = _fileService.CreateFile(folderStore, fileName, excelFile);

                HttpContext.Session.SetString("ExcelFilePath", filePath);

                var dataSetting = _excelService.GetExcelSettingData(filePath, ResourceVN.Excel_Employee_Code_Header_Name);

                return StatusCode(StatusCodes.Status200OK, dataSetting);
            }
            else
            {
                throw new ValidateException();
            }
        }

        /// <summary>
        /// Hàm thêm các cài đặt cho file excel
        ///     + Sheet sử dụng (SheetContainsData)
        ///     + Vị trí theo hàng của header (HeaderRowIndex)
        ///     + Phương thức nhập (ImportMode)
        /// </summary>
        /// CreatedBy: TTANH (17/07/2023)
        [HttpPost("excel/add-setting")]
        public async Task<IActionResult> AddSettingExcelAsync([FromBody] ExcelImportSetting importExcelSetting)
        {
            HttpContext.Session.SetString("SheetContainsData", importExcelSetting.SheetContainsData.ToString());
            HttpContext.Session.SetInt32("HeaderRowIndex", importExcelSetting.HeaderRowIndex);
            HttpContext.Session.SetInt32("ImportMode", (int)importExcelSetting.ImportMode);

            var excelFileId = HttpContext.Session.GetString("ExcelFileId");

            if (string.IsNullOrEmpty(excelFileId))
            {
                throw new NotFoundException(StatusErrorCode.SessionIsOver, ResourceVN.Session_Is_Over);
            }

            var fileName = $"{excelFileId}.xlsx";
            var filePath = _fileService.GetFilePath(folderStore, fileName);

            var headersInfo = _excelService.GetHeadersInfo(filePath, importExcelSetting.SheetContainsData, importExcelSetting.HeaderRowIndex);

            return StatusCode(StatusCodes.Status200OK, headersInfo);
        }

        /// <summary>
        /// Hàm thêm các cài đặt cho việc ánh xạ từ header trong excel 
        /// thành tên cột trong server
        /// </summary>
        /// CreatedBy: TTANH (19/07/2023)
        [HttpPost("excel/header-map-column")]
        public async Task<IActionResult> HeaderMapColumnAsync([FromBody] List<ExcelHeaderMapColumn> excelHeadersMapColumns)
        {
            var sheetUsed = HttpContext.Session.GetString("SheetContainsData");
            var headerRowIndex = HttpContext.Session.GetInt32("HeaderRowIndex") ?? 1;
            var importMode = (ImportMode)HttpContext.Session.GetInt32("ImportMode");
            var excelFileId = HttpContext.Session.GetString("ExcelFileId");

            if (string.IsNullOrEmpty(sheetUsed))
            {
                throw new NotFoundException(StatusErrorCode.SessionIsOver, ResourceVN.Session_Is_Over);
            }

            var fileName = $"{excelFileId}.xlsx";
            var filePath = _fileService.GetFilePath(folderStore, fileName);

            var employeesExcel = await _excelService.ReadExcelFile(excelFileId, filePath, sheetUsed, headerRowIndex, excelHeadersMapColumns);

            var employeesExcelValidate = await _employeeService.ExcelDataValidCheck(employeesExcel, importMode);

            //Lưu dữ liệu vào cache
            var expiryTime = DateTimeOffset.Now.AddMinutes(AppConst.ExpiredTime);
            await _cacheService.SetAsync<IEnumerable<EmployeeExcelDto>>(excelFileId, employeesExcelValidate, expiryTime);

            var response = new SuccessResponseFormat(StatusSuccessCode.ImportExcelRequestSuccess, ResourceVN.Import_Excel_Request_Success, null);

            return StatusCode(StatusCodes.Status200OK, response);
        }

        /// <summary>
        /// Api lọc dữ liệu trong file excel
        /// </summary>
        /// <param name="filterExcelDataValidateType">Loại kiểm tra: hợp lệ, không hợp lệ, tất cả</param>
        /// <param name="pageSize">Số bản ghi trên 1 trang</param>
        /// <param name="pageNumber">Thứ tự bao nhiêu</param>
        /// CreatedBy: TTANH (24/07/2023)
        [HttpGet("excel/check-data-filter")]
        public async Task<IActionResult> CheckDataFilterAsync([FromQuery] FilterExcelDataValidateType filterExcelDataValidateType, [FromQuery] int pageSize, [FromQuery] int pageNumber)
        {
            var excelFileId = HttpContext.Session.GetString("ExcelFileId");

            if (string.IsNullOrEmpty(excelFileId))
            {
                throw new NotFoundException(StatusErrorCode.SessionIsOver, ResourceVN.Session_Is_Over);
            }

            var employeesValidate = await _cacheService.GetAsync<IEnumerable<EmployeeExcelDto>>(excelFileId);

            if (string.IsNullOrEmpty(excelFileId) || employeesValidate == null)
            {
                throw new NotFoundException(StatusErrorCode.SessionIsOver, ResourceVN.Session_Is_Over);
            }

            var employeesValidateFilter = _employeeService.FilterExcelData(employeesValidate.ToList(), filterExcelDataValidateType, pageSize, pageNumber);

            return StatusCode(StatusCodes.Status200OK, employeesValidateFilter);
        }

        /// <summary>
        /// Api xác nhận import dữ liệu từ file
        /// </summary>
        /// CreatedBy: TTANH (24/07/2023)
        [HttpPost("excel/confirm-import-excel-file")]
        public async Task<IActionResult> ConfirmImportExcelFile()
        {
            var excelFileId = HttpContext.Session.GetString("ExcelFileId");
            var filePath = HttpContext.Session.GetString("ExcelFilePath");
            var importMode = (ImportMode)HttpContext.Session.GetInt32("ImportMode");

            if (string.IsNullOrEmpty(excelFileId))
            {
                throw new NotFoundException(StatusErrorCode.SessionIsOver, ResourceVN.Session_Is_Over);
            }

            var employeesExcelDto = await _cacheService.GetAsync<IEnumerable<EmployeeExcelDto>>(excelFileId);

            if (employeesExcelDto == null)
            {
                throw new NotFoundException(StatusErrorCode.SessionIsOver, ResourceVN.Session_Is_Over);
            }

            var totalChangeRecord = 0;

            if (importMode == ImportMode.Add)
            {
                totalChangeRecord = await _employeeService.InsertExcelDataAsync(employeesExcelDto.ToList());
            }
            else if (importMode == ImportMode.Update)
            {
                totalChangeRecord = await _employeeService.UpsertExcelDataAsync(employeesExcelDto.ToList());
            }

            _fileService.DeleteFile(filePath);

            return StatusCode(StatusCodes.Status200OK, totalChangeRecord);
        }
        #endregion
    }
}
