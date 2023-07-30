using AutoMapper;
using MISA.WebFresher052023.CTM.Domain;
using MISA.WebFresher052023.CTM.Application;

namespace MISA.WebFresher052023.CTM.Infrastructure
{
    public class EmployeeExcelService : ExcelService<Employee, EmployeeDto, EmployeeExcelDto>
    {
        public EmployeeExcelService(IEmployeeRepository employeeRepository, IMapper mapper, IExcelWorker<EmployeeDto, EmployeeExcelDto> employeeExcelWorker) : base(employeeRepository, mapper, employeeExcelWorker)
        {
        }
    }
}
