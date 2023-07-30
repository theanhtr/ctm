-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 30, 2023 lúc 09:09 AM
-- Phiên bản máy phục vụ: 10.4.28-MariaDB
-- Phiên bản PHP: 8.1.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `misa.web202305_mf1666_ttanh`
--
CREATE DATABASE IF NOT EXISTS `misa.web202305_mf1666_ttanh` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `misa.web202305_mf1666_ttanh`;

DELIMITER $$
--
-- Thủ tục
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_AllTable_Count` (IN `tableName` VARCHAR(255))  SQL SECURITY INVOKER COMMENT 'Procedure để đếm số bản ghi trong 1 bảng.' BEGIN
    SET @query = CONCAT('SELECT COUNT(1) FROM ', tableName);
    PREPARE stmt FROM @query;
    EXECUTE stmt;

    /* giải phóng tài nguyên */
    DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_AllTable_Delete` (IN `tableName` VARCHAR(255), IN `tableId` VARCHAR(255), IN `id` CHAR(36))  SQL SECURITY INVOKER COMMENT 'Procedure xóa 1 bản ghi.' BEGIN
    SET @query = CONCAT('DELETE FROM ', tableName, ' WHERE ', tableId, ' = \'', id, '\'');
    PREPARE stmt FROM @query;
    EXECUTE stmt;

    /* giải phóng tài nguyên */
    DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_AllTable_DeleteList` (IN `tableName` VARCHAR(255), IN `tableId` VARCHAR(255), IN `ids` TEXT)  SQL SECURITY INVOKER COMMENT 'Procedure xóa nhiều bản ghi theo id.' BEGIN
    SET @query = CONCAT('DELETE FROM ', tableName, ' WHERE ', tableId, ' IN (', ids, ')');
    PREPARE stmt FROM @query;
    EXECUTE stmt;

    /* giải phóng tài nguyên */
    DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_AllTable_GetAll` (IN `tableName` VARCHAR(255))  SQL SECURITY INVOKER COMMENT 'Procedure lấy tất cả bản ghi trong 1 bảng.' BEGIN
    SET @query = CONCAT('SELECT * FROM ', tableName);
    PREPARE stmt FROM @query;
    EXECUTE stmt;

  /* giải phóng tài nguyên */
  DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_AllTable_GetAllByColumnName` (IN `tableName` VARCHAR(255), IN `columnName` VARCHAR(255))  SQL SECURITY INVOKER COMMENT 'Procedure lấy tất cả bản ghi của một bảng nhưng chỉ lấy một cột.' BEGIN
    SET @query = CONCAT('SELECT ', columnName, ' FROM ', tableName);
    PREPARE stmt FROM @query;
    EXECUTE stmt;

    /* giải phóng tài nguyên */
    DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_AllTable_GetByCode` (IN `tableName` VARCHAR(255), IN `tableCode` VARCHAR(255), IN `code` VARCHAR(20))  SQL SECURITY INVOKER COMMENT 'Procedure lấy bản ghi theo mã code.' BEGIN
    SET @query = CONCAT('SELECT * FROM ', tableName, ' entity WHERE entity.', tableCode, ' = \'', code, '\'');
    PREPARE stmt FROM @query;
    EXECUTE stmt;

    /* giải phóng tài nguyên */
    DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_AllTable_GetById` (IN `tableName` VARCHAR(255), IN `tableId` VARCHAR(255), IN `id` CHAR(36))  SQL SECURITY INVOKER COMMENT 'Procedure lấy một bản ghi theo id.' BEGIN
DECLARE cr_stack_depth_handler INTEGER/*[cr_debug.1]*/;
DECLARE cr_stack_depth INTEGER DEFAULT cr_debug.ENTER_MODULE2('Proc_AllTable_GetById', 'misa.web202305_mf1666_ttanh', 7, 100637)/*[cr_debug.1]*/;
    CALL cr_debug.UPDATE_WATCH3('tableName', tableName, 'VARCHAR(255)', cr_stack_depth)/*[cr_debug.2]*/;
CALL cr_debug.UPDATE_WATCH3('tableId', tableId, 'VARCHAR(255)', cr_stack_depth)/*[cr_debug.2]*/;
CALL cr_debug.UPDATE_WATCH3('id', id, 'CHAR(36)', cr_stack_depth)/*[cr_debug.2]*/;
CALL cr_debug.TRACE(3, 3, 0, 5, 0, cr_stack_depth)/*[cr_debug.2]*/;
CALL cr_debug.TRACE(4, 4, 4, 106, 0, cr_stack_depth)/*[cr_debug.2]*/;
SET @query = CONCAT('SELECT * FROM ', tableName, ' entity WHERE entity.', tableId, ' = \'', id, '\'');
CALL cr_debug.UPDATE_WATCH3('@query', @query, '', cr_stack_depth)/*[cr_debug.1]*/;
    CALL cr_debug.TRACE(5, 5, 4, 29, 0, cr_stack_depth)/*[cr_debug.2]*/;
PREPARE stmt FROM @query;
    CALL cr_debug.TRACE(6, 6, 4, 17, 100, cr_stack_depth)/*[cr_debug.2]*/;
EXECUTE stmt;
CALL cr_debug.UPDATE_SYSTEM_CALLS(100)/*[cr_debug.1]*/;

    /* giải phóng tài nguyên */
    CALL cr_debug.TRACE(9, 9, 4, 28, 0, cr_stack_depth)/*[cr_debug.2]*/;
DEALLOCATE PREPARE stmt;
CALL cr_debug.TRACE(10, 10, 0, 3, 0, cr_stack_depth)/*[cr_debug.2]*/;
SET cr_stack_depth = cr_stack_depth - 1/*[cr_debug.2]*/;
CALL cr_debug.LEAVE_MODULE(cr_stack_depth)/*[cr_debug.2]*/;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_AllTable_GetListByColumnValues` (IN `tableName` VARCHAR(255), IN `columnName` VARCHAR(255), IN `values` TEXT)  SQL SECURITY INVOKER COMMENT 'Procedure lấy ra danh sách bản ghi theo một chuỗi các giá trị của một trường.' BEGIN
    SET @query = CONCAT('SELECT * FROM ', tableName, ' entity WHERE entity.', columnName, ' IN (', `values`, ')');
    PREPARE stmt FROM @query;
    EXECUTE stmt;

    /* giải phóng tài nguyên */
    DEALLOCATE PREPARE stmt;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Department_Filter` (IN `pageSize` INT, IN `pageNumber` INT, IN `searchText` VARCHAR(255))  SQL SECURITY INVOKER COMMENT 'Procedure lọc phòng ban.' BEGIN
  DECLARE startIndex int;
  SET startIndex = (pageNumber - 1) * pageSize;
  
  SELECT *
  FROM department d
  WHERE 
    (searchText IS NULL 
      OR (d.DepartmentCode LIKE CONCAT('%', searchText, '%')
          OR d.DepartmentName LIKE CONCAT('%', searchText, '%')
         )
    )
  LIMIT startIndex, pageSize;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Department_Insert` (IN `DepartmentId` CHAR(36), IN `DepartmentCode` VARCHAR(20), IN `DepartmentName` VARCHAR(100), IN `CreatedDate` DATETIME, IN `CreatedBy` VARCHAR(100))  SQL SECURITY INVOKER COMMENT 'Procedure thêm phòng ban.' BEGIN
  INSERT INTO department (DepartmentId, DepartmentCode, DepartmentName, CreatedDate, CreatedBy)
  VALUES (DepartmentId, DepartmentCode, DepartmentName, CreatedDate, CreatedBy);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Department_Update` (IN `DepartmentId` CHAR(36), IN `DepartmentCode` VARCHAR(20), IN `DepartmentName` VARCHAR(100), IN `ModifiedDate` DATETIME, IN `ModifiedBy` VARCHAR(255), IN `id` CHAR(36))  SQL SECURITY INVOKER COMMENT 'Procedure cập nhật thông tin phòng ban.' BEGIN
  UPDATE department d 
  SET d.DepartmentId = DepartmentId,
      d.DepartmentCode = DepartmentCode,
      d.DepartmentName = DepartmentName,
      d.ModifiedDate = ModifiedDate,
      d.ModifiedBy = ModifiedBy
  WHERE d.DepartmentId = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Employee_Filter` (IN `pageSize` INT, IN `pageNumber` INT, IN `searchText` VARCHAR(255))  SQL SECURITY INVOKER COMMENT 'Procedure lọc nhân viên.' BEGIN
  DECLARE startIndex int;
  SET startIndex = (pageNumber - 1) * pageSize;
  
  SELECT *
  FROM employee e
  WHERE 
    (searchText IS NULL 
      OR (e.EmployeeCode LIKE CONCAT('%', searchText, '%')
          OR e.FullName LIKE CONCAT('%', searchText, '%') 
          OR e.DepartmentCode LIKE CONCAT('%', searchText, '%') 
          OR e.DepartmentName LIKE CONCAT('%', searchText, '%') 
          OR e.IdentityNumber LIKE CONCAT('%', searchText, '%') 
          OR e.`Position` LIKE CONCAT('%', searchText, '%')
         )
    )
  ORDER BY GREATEST(COALESCE(e.ModifiedDate, '0000-00-00'), e.CreatedDate) DESC
  LIMIT startIndex, pageSize;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Employee_Insert` (IN `EmployeeId` CHAR(36), IN `EmployeeCode` VARCHAR(20), IN `FullName` VARCHAR(100), IN `DepartmentId` CHAR(36), IN `DepartmentCode` VARCHAR(20), IN `DepartmentName` VARCHAR(255), IN `Gender` INT(2), IN `DateOfBirth` DATE, IN `Position` VARCHAR(100), IN `SupplierCustomerGroup` VARCHAR(255), IN `IdentityNumber` VARCHAR(25), IN `IdentityDate` DATE, IN `IdentityPlace` VARCHAR(255), IN `PayAccount` VARCHAR(100), IN `ReceiveAccount` VARCHAR(100), IN `Salary` DECIMAL(18,4), IN `SalaryCoefficients` DECIMAL(18,4), IN `SalaryPaidForInsurance` DECIMAL(18,4), IN `PersonalTaxCode` VARCHAR(25), IN `TypeOfContract` VARCHAR(255), IN `NumberOfDependents` INT(10), IN `AccountNumber` VARCHAR(25), IN `BankName` VARCHAR(255), IN `BankBranch` VARCHAR(255), IN `BankProvince` VARCHAR(255), IN `ContactAddress` VARCHAR(255), IN `ContactPhoneNumber` VARCHAR(50), IN `ContactLandlinePhoneNumber` VARCHAR(50), IN `ContactEmail` VARCHAR(100), IN `CreatedDate` DATETIME, IN `CreatedBy` VARCHAR(100))  SQL SECURITY INVOKER COMMENT 'Procedure thêm nhân viên.' BEGIN
  INSERT INTO employee (EmployeeId, EmployeeCode, FullName, DepartmentId, DepartmentCode, DepartmentName, Gender, DateOfBirth, `Position`, SupplierCustomerGroup, IdentityNumber, IdentityDate, IdentityPlace, PayAccount, ReceiveAccount, Salary, SalaryCoefficients, SalaryPaidForInsurance, PersonalTaxCode, TypeOfContract, NumberOfDependents, AccountNumber, BankName, BankBranch, BankProvince, ContactAddress, ContactPhoneNumber, ContactLandlinePhoneNumber, ContactEmail, CreatedDate, CreatedBy)
  VALUES (EmployeeId, EmployeeCode, FullName, DepartmentId, DepartmentCode, DepartmentName, Gender, DateOfBirth, Position, SupplierCustomerGroup, IdentityNumber, IdentityDate, IdentityPlace, PayAccount, ReceiveAccount, Salary, SalaryCoefficients, SalaryPaidForInsurance, PersonalTaxCode, TypeOfContract, NumberOfDependents, AccountNumber, BankName, BankBranch, BankProvince, ContactAddress, ContactPhoneNumber, ContactLandlinePhoneNumber, ContactEmail, CreatedDate, CreatedBy);
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Employee_InsertList` (IN `values` TEXT)  SQL SECURITY INVOKER COMMENT 'Procedure thêm nhiều bản ghi.' BEGIN
DECLARE cr_stack_depth_handler INTEGER/*[cr_debug.1]*/;
DECLARE cr_stack_depth INTEGER DEFAULT cr_debug.ENTER_MODULE2('Proc_Employee_InsertList', 'misa.web202305_mf1666_ttanh', 7, 100637)/*[cr_debug.1]*/;
    CALL cr_debug.UPDATE_WATCH3('`values`', `values`, 'TEXT', cr_stack_depth)/*[cr_debug.2]*/;
CALL cr_debug.TRACE(3, 3, 0, 5, 0, cr_stack_depth)/*[cr_debug.2]*/;
CALL cr_debug.TRACE(4, 4, 4, 523, 0, cr_stack_depth)/*[cr_debug.2]*/;
SET @columnsInsert = '(EmployeeId, EmployeeCode, FullName, DepartmentId, DepartmentCode, DepartmentName, Gender, DateOfBirth, `Position`, SupplierCustomerGroup, IdentityNumber, IdentityDate, IdentityPlace, PayAccount, ReceiveAccount, Salary, SalaryCoefficients, SalaryPaidForInsurance, PersonalTaxCode, TypeOfContract, NumberOfDependents, AccountNumber, BankName, BankBranch, BankProvince, ContactAddress, ContactPhoneNumber, ContactLandlinePhoneNumber, ContactEmail, CreatedDate, CreatedBy, ModifiedDate, ModifiedBy)';
CALL cr_debug.UPDATE_WATCH3('@columnsInsert', @columnsInsert, '', cr_stack_depth)/*[cr_debug.1]*/;
    CALL cr_debug.TRACE(5, 5, 4, 87, 0, cr_stack_depth)/*[cr_debug.2]*/;
SET @query = CONCAT('INSERT INTO employee ', @columnsInsert, ' VALUES ', `values`);
CALL cr_debug.UPDATE_WATCH3('@query', @query, '', cr_stack_depth)/*[cr_debug.1]*/;
CALL cr_debug.UPDATE_WATCH3('@columnsInsert', @columnsInsert, '', cr_stack_depth)/*[cr_debug.1]*/;
    CALL cr_debug.TRACE(6, 6, 4, 29, 0, cr_stack_depth)/*[cr_debug.2]*/;
PREPARE stmt FROM @query;
    CALL cr_debug.TRACE(7, 7, 4, 17, 100, cr_stack_depth)/*[cr_debug.2]*/;
EXECUTE stmt;
CALL cr_debug.UPDATE_SYSTEM_CALLS(100)/*[cr_debug.1]*/;

    /* giải phóng tài nguyên */
    CALL cr_debug.TRACE(10, 10, 4, 28, 0, cr_stack_depth)/*[cr_debug.2]*/;
DEALLOCATE PREPARE stmt;
CALL cr_debug.TRACE(11, 11, 0, 3, 0, cr_stack_depth)/*[cr_debug.2]*/;
SET cr_stack_depth = cr_stack_depth - 1/*[cr_debug.2]*/;
CALL cr_debug.LEAVE_MODULE(cr_stack_depth)/*[cr_debug.2]*/;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Employee_NewCode` ()  SQL SECURITY INVOKER COMMENT 'Procedure lấy mã nhân viên mới không trùng.' BEGIN
  DECLARE LastestCode varchar(20);

  -- Lấy tiền tố của mã nhân viên tạo mới nhất
  SELECT
  SUBSTRING_INDEX (e.EmployeeCode, '-', 1) INTO LastestCode
  FROM employee e
  ORDER BY e.CreatedDate DESC LIMIT 1;

  -- Tìm hậu tố lớn nhất của tiền tố vừa tìm được
  SELECT
    CONCAT(LastestCode, '-', MAX(CAST(SUBSTRING_INDEX (EmployeeCode, '-', -1) AS UNSIGNED)) + 1) AS MaxCode
  FROM employee
  WHERE EmployeeCode LIKE CONCAT(LastestCode, '%');
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Employee_Update` (IN `EmployeeId` CHAR(36), IN `EmployeeCode` VARCHAR(20), IN `FullName` VARCHAR(100), IN `DepartmentId` CHAR(36), IN `DepartmentCode` VARCHAR(20), IN `DepartmentName` VARCHAR(255), IN `Gender` INT(2), IN `DateOfBirth` DATE, IN `Position` VARCHAR(100), IN `SupplierCustomerGroup` VARCHAR(255), IN `IdentityNumber` VARCHAR(25), IN `IdentityDate` DATE, IN `IdentityPlace` VARCHAR(255), IN `PayAccount` VARCHAR(100), IN `ReceiveAccount` VARCHAR(100), IN `Salary` DECIMAL(18,4), IN `SalaryCoefficients` DECIMAL(18,4), IN `SalaryPaidForInsurance` DECIMAL(18,4), IN `PersonalTaxCode` VARCHAR(25), IN `TypeOfContract` VARCHAR(255), IN `NumberOfDependents` INT(10), IN `AccountNumber` VARCHAR(25), IN `BankName` VARCHAR(255), IN `BankBranch` VARCHAR(255), IN `BankProvince` VARCHAR(255), IN `ContactAddress` VARCHAR(255), IN `ContactPhoneNumber` VARCHAR(50), IN `ContactLandlinePhoneNumber` VARCHAR(50), IN `ContactEmail` VARCHAR(100), IN `ModifiedDate` DATETIME, IN `ModifiedBy` VARCHAR(255), IN `id` CHAR(36))  MODIFIES SQL DATA SQL SECURITY INVOKER COMMENT 'Procedure cập nhật thông tin nhân viên.' BEGIN
  UPDATE employee e
  SET e.EmployeeCode = EmployeeCode,
    e.FullName = FullName,
    e.DepartmentId = DepartmentId,
    e.DepartmentCode = DepartmentCode,
    e.DepartmentName = DepartmentName,
    e.Gender = Gender,
    e.DateOfBirth = DateOfBirth,
    e.`Position` = Position,
    e.SupplierCustomerGroup = SupplierCustomerGroup,
    e.IdentityNumber = IdentityNumber,
    e.IdentityDate = IdentityDate,
    e.IdentityPlace = IdentityPlace,
    e.PayAccount = PayAccount,
    e.ReceiveAccount = ReceiveAccount,
    e.Salary = Salary,
    e.SalaryCoefficients = SalaryCoefficients,
    e.SalaryPaidForInsurance = SalaryPaidForInsurance,
    e.PersonalTaxCode = PersonalTaxCode,
    e.TypeOfContract = TypeOfContract,
    e.NumberOfDependents = NumberOfDependents,
    e.AccountNumber = AccountNumber,
    e.BankName = BankName,
    e.BankBranch = BankBranch,
    e.BankProvince = BankProvince,
    e.ContactAddress = ContactAddress,
    e.ContactPhoneNumber = ContactPhoneNumber,
    e.ContactLandlinePhoneNumber = ContactLandlinePhoneNumber,
    e.ContactEmail = ContactEmail,
    e.ModifiedDate = ModifiedDate,
    e.ModifiedBy = ModifiedBy
  WHERE e.EmployeeId = id;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Employee_UpdateList` (IN `values` TEXT)  SQL SECURITY INVOKER COMMENT 'Procedure cập nhật nhiều bản ghi.' BEGIN
    /* Dựa trên cơ chế insert nhưng gặp trùng */
    SET @columnsInsert = '(EmployeeCode, FullName, DepartmentId, DepartmentCode, DepartmentName, Gender, DateOfBirth, `Position`, SupplierCustomerGroup, IdentityNumber, IdentityDate, IdentityPlace, PayAccount, ReceiveAccount, Salary, SalaryCoefficients, SalaryPaidForInsurance, PersonalTaxCode, TypeOfContract, NumberOfDependents, AccountNumber, BankName, BankBranch, BankProvince, ContactAddress, ContactPhoneNumber, ContactLandlinePhoneNumber, ContactEmail, ModifiedDate, ModifiedBy)';
    SET @columnsUpdate = '
      FullName=VALUES(FullName), 
      DepartmentId=VALUES(DepartmentId),
      DepartmentCode=VALUES(DepartmentCode), 
      DepartmentName=VALUES(DepartmentName),
      Gender=VALUES(Gender), 
      DateOfBirth=VALUES(DateOfBirth),
      `Position`=VALUES(`Position`),
      SupplierCustomerGroup=VALUES(SupplierCustomerGroup),
      IdentityNumber=VALUES(IdentityNumber), 
      IdentityDate=VALUES(IdentityDate),
      IdentityPlace=VALUES(IdentityPlace),
      PayAccount=VALUES(PayAccount),
      ReceiveAccount=VALUES(ReceiveAccount), 
      Salary=VALUES(Salary),
      SalaryCoefficients=VALUES(SalaryCoefficients),
      SalaryPaidForInsurance=VALUES(SalaryPaidForInsurance),
      PersonalTaxCode=VALUES(PersonalTaxCode), 
      TypeOfContract=VALUES(TypeOfContract),
      NumberOfDependents=VALUES(NumberOfDependents),
      AccountNumber=VALUES(AccountNumber), 
      BankName=VALUES(BankName),
      BankBranch=VALUES(BankBranch), 
      BankProvince=VALUES(BankProvince),
      ContactAddress=VALUES(ContactAddress),
      ContactPhoneNumber=VALUES(ContactPhoneNumber),
      ContactLandlinePhoneNumber=VALUES(ContactLandlinePhoneNumber),
      ContactEmail=VALUES(ContactEmail), 
      ModifiedDate=VALUES(ModifiedDate),
      ModifiedBy=VALUES(ModifiedBy);';
    SET @query = CONCAT('INSERT INTO employee ', @columnsInsert, ' VALUES ', `values`, ' ON DUPLICATE KEY UPDATE EmployeeCode = VALUES(EmployeeCode),', @columnsUpdate);
    PREPARE stmt FROM @query;
    EXECUTE stmt;

    /* giải phóng tài nguyên */
    DEALLOCATE PREPARE stmt;
END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `department`
--

CREATE TABLE `department` (
  `DepartmentId` char(36) NOT NULL COMMENT 'Id phòng ban',
  `DepartmentCode` varchar(20) NOT NULL COMMENT 'Mã phòng ban',
  `DepartmentName` varchar(255) NOT NULL COMMENT 'Tên phòng ban',
  `CreatedDate` datetime NOT NULL COMMENT 'Ngày tạo',
  `CreatedBy` varchar(100) DEFAULT NULL COMMENT 'Tạo bởi',
  `ModifiedDate` datetime DEFAULT NULL COMMENT 'Ngày sửa',
  `ModifiedBy` varchar(255) DEFAULT NULL COMMENT 'Sửa bởi'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Thông tin phòng ban';

--
-- Đang đổ dữ liệu cho bảng `department`
--

INSERT INTO `department` (`DepartmentId`, `DepartmentCode`, `DepartmentName`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`) VALUES
('142cb08f-7c31-21fa-8e90-67245e8b283e', 'PB-0460', 'Phòng nhân sự', '1970-01-01 00:07:13', 'Letha Bolt', '1970-01-01 00:00:04', 'Abraham Acevedo'),
('17120d02-6ab5-3e43-18cb-66948daf6128', 'PB-9483', 'Phòng đào tạo', '2001-10-05 03:39:34', 'Miyoko Mckinney', '1971-05-16 09:45:54', 'Hong Beaudoin'),
('469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', '2019-06-30 12:29:53', 'Vanita Kelleher', '1975-01-31 18:53:18', 'Retta Lord'),
('4e272fc4-7875-78d6-7d32-6a1673ffca7c', 'PB-2675', 'Phòng hành chính', '2015-02-25 11:35:34', 'Marcos Abraham', '1970-01-01 00:00:08', 'Treena Lind'),
('80de23af-ea3d-45cf-bc91-bfa0ef4e3677', 'CHange-1', 'Sửa phòng ban', '2023-07-16 16:45:18', 'TTANH', '2023-07-16 16:46:07', 'ANHTT');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employee`
--

CREATE TABLE `employee` (
  `EmployeeId` char(36) NOT NULL COMMENT 'Id nhân viên',
  `EmployeeCode` varchar(20) NOT NULL COMMENT 'Mã nhân viên',
  `FullName` varchar(100) NOT NULL COMMENT 'Tên nhân viên',
  `DepartmentId` char(36) NOT NULL COMMENT 'Id phòng ban',
  `DepartmentCode` varchar(20) NOT NULL COMMENT 'Mã code phòng ban',
  `DepartmentName` varchar(255) NOT NULL COMMENT 'Tên phòng ban',
  `Gender` int(2) DEFAULT NULL COMMENT 'Giới tính (0 - Nam; 1 - Nữ; 2 - Khác)',
  `DateOfBirth` date DEFAULT NULL COMMENT 'Ngày sinh',
  `Position` varchar(100) DEFAULT NULL COMMENT 'Chức danh',
  `SupplierCustomerGroup` varchar(255) DEFAULT NULL COMMENT 'Nhóm khách hàng, nhà cung cấp',
  `IdentityNumber` varchar(25) DEFAULT NULL COMMENT 'Số CMND',
  `IdentityDate` date DEFAULT NULL COMMENT 'Ngày cấp',
  `IdentityPlace` varchar(255) DEFAULT NULL COMMENT 'Nơi cấp',
  `PayAccount` varchar(100) DEFAULT NULL COMMENT 'TK công nợ phải trả',
  `ReceiveAccount` varchar(100) DEFAULT NULL COMMENT 'TK công nợ phải thu',
  `Salary` decimal(18,4) DEFAULT NULL COMMENT 'Lương thỏa thuận',
  `SalaryCoefficients` decimal(18,4) DEFAULT NULL COMMENT 'Hệ số lương',
  `SalaryPaidForInsurance` decimal(18,4) DEFAULT NULL COMMENT 'Lương đóng bảo hiểm',
  `PersonalTaxCode` varchar(25) DEFAULT NULL COMMENT 'Mã số thuế',
  `TypeOfContract` varchar(255) DEFAULT NULL COMMENT 'Loại hợp đồng',
  `NumberOfDependents` int(10) DEFAULT NULL COMMENT 'Số người phụ thuộc',
  `AccountNumber` varchar(25) DEFAULT NULL COMMENT 'Số tài khoản ngân hàng',
  `BankName` varchar(255) DEFAULT NULL COMMENT 'Tên ngân hàng',
  `BankBranch` varchar(255) DEFAULT NULL COMMENT 'Chi nhánh ngân hàng',
  `BankProvince` varchar(255) DEFAULT NULL COMMENT 'Tỉnh/TP của ngân hàng',
  `ContactAddress` varchar(255) DEFAULT NULL COMMENT 'Địa chỉ',
  `ContactPhoneNumber` varchar(50) DEFAULT NULL COMMENT 'Điện thoại di động',
  `ContactLandlinePhoneNumber` varchar(50) DEFAULT NULL COMMENT 'ĐT cố định',
  `ContactEmail` varchar(100) DEFAULT NULL COMMENT 'Email',
  `CreatedDate` datetime DEFAULT NULL COMMENT 'Ngày tạo',
  `CreatedBy` varchar(100) DEFAULT NULL COMMENT 'Người tạo',
  `ModifiedDate` datetime DEFAULT NULL COMMENT 'Ngày sửa',
  `ModifiedBy` varchar(100) DEFAULT NULL COMMENT 'Người sửa'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Thông tin nhân viên';

--
-- Đang đổ dữ liệu cho bảng `employee`
--

INSERT INTO `employee` (`EmployeeId`, `EmployeeCode`, `FullName`, `DepartmentId`, `DepartmentCode`, `DepartmentName`, `Gender`, `DateOfBirth`, `Position`, `SupplierCustomerGroup`, `IdentityNumber`, `IdentityDate`, `IdentityPlace`, `PayAccount`, `ReceiveAccount`, `Salary`, `SalaryCoefficients`, `SalaryPaidForInsurance`, `PersonalTaxCode`, `TypeOfContract`, `NumberOfDependents`, `AccountNumber`, `BankName`, `BankBranch`, `BankProvince`, `ContactAddress`, `ContactPhoneNumber`, `ContactLandlinePhoneNumber`, `ContactEmail`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`) VALUES
('049769a1-21fc-47c8-8ca6-2cc2958c3434', 'NV-1007', 'Shaughn Eilers', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 0, '2022-11-21', 'Nhân viên Update', NULL, NULL, NULL, NULL, NULL, NULL, 15000000.0000, 2.0000, 9500000.0000, '8695235611', 'Cư trú và có HĐLĐ từ 3 th', 1, '545112151', 'Ngân hàng Techcombank', 'Thanh Hóa', 'Thanh Hóa', '3197 Spenser Way', NULL, NULL, 'seilers1@nymag.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('04b3eb7b-6c5f-4388-a160-b39a33243839', 'NV-1143', 'Menard Brazil', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-12-05', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000035.0000, 36.0000, 4725035.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 35, '25446', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '66890 Red Cloud Crossing', NULL, NULL, 'mbrazil11@desdev.cn', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('057ff569-f105-4d2b-ab35-ed3c6c8c4b9f', 'NV-1130', 'Honey Putson', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-10-20', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000022.0000, 23.0000, 4725022.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 22, '25433', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '39 Mendota Park', NULL, NULL, 'hputsono@uiuc.edu', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('06de0d84-b549-45cc-b935-b88db96ab63e', 'NV-1019', 'Concettina Tudball', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-12-24', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000011.0000, 12.0000, 4725011.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 11, '25422', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '921 Elgar Alley', NULL, NULL, 'ctudballd@baidu.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('0a20c785-c30a-4d2a-a5ca-4dd2137fd9fa', 'NV-1120', 'Bogart Larvor', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-07-19', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000012.0000, 13.0000, 4725012.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 12, '25423', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '471 Garrison Trail', NULL, NULL, 'blarvore@github.io', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('126b6cf0-7bb8-4089-90d6-c1edc8768d82', 'NV-1055', 'Magnum Fibben', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-04-23', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000047.0000, 48.0000, 4725047.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 47, '25458', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '87193 Maywood Parkway', NULL, NULL, 'mfibben1d@sphinn.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('13f3fba6-fb2a-4d36-b6cf-3d5a70370293', 'NV-1118', 'Gunner Christmas', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-05-30', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000010.0000, 11.0000, 4725010.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 10, '25421', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '4571 Kenwood Pass', NULL, NULL, 'gchristmasc@mayoclinic.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('140229cd-f427-4bb8-8cf2-cf30426f3e2f', 'AB2-1001', 'Menard Brazil', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-12-05', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000035.0000, 36.0000, 4725035.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 35, '25446', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '66890 Red Cloud Crossing', NULL, NULL, 'mbrazil11@desdev.cn', '2023-07-28 20:45:24', 'USER ADD', NULL, NULL),
('1cff4295-51fe-4aaa-8d33-37a71acb01f6', 'NV-1148', 'Sandro Holworth', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-12-03', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000040.0000, 41.0000, 4725040.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 40, '25451', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '06927 Veith Plaza', NULL, NULL, 'sholworth16@list-manage.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('1e0b41bf-ee6c-4e60-8f94-ada98ac643f5', 'AB2-1003', 'fàd', '142cb08f-7c31-21fa-8e90-67245e8b283e', 'PB-0460', 'Phòng nhân sự', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-29 10:04:22', 'USER ADD', NULL, NULL),
('1e6d50e2-2560-472f-8f6c-0dee221dbea9', 'NV-1037', 'Sonya Gabbot', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-09-24', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000029.0000, 30.0000, 4725029.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 29, '25440', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '187 Acker Street', NULL, NULL, 'sgabbotv@usgs.gov', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('1eebcf4d-fec1-4363-8eb9-af4d2677cd27', 'NV-1027', 'Taylor Triswell', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-07-13', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000019.0000, 20.0000, 4725019.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 19, '25430', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '1 Morningstar Terrace', NULL, NULL, 'ttriswelll@hud.gov', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('1f2d11f7-3d59-453e-826e-a81b74e40fd6', 'NV-1137', 'Sonya Gabbot', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-09-24', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000029.0000, 30.0000, 4725029.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 29, '25440', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '187 Acker Street', NULL, NULL, 'sgabbotv@usgs.gov', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('2323841c-761e-4000-9236-9d52072c26fa', 'AB2-1004', 'fád', '142cb08f-7c31-21fa-8e90-67245e8b283e', 'PB-0460', 'Phòng nhân sự', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '0912945494', NULL, 'theann090602@gmail.com', '2023-07-29 11:51:41', 'USER ADD', NULL, NULL),
('255fc2bd-8f42-424b-a9da-42b3459acc9d', 'NV-1047', 'Mariann Axe', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-09-24', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000039.0000, 40.0000, 4725039.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 39, '25450', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '93835 Melody Avenue', NULL, NULL, 'maxe15@123-reg.co.uk', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('2c591863-b299-41ec-a318-02127def7fb3', 'NV-1016', 'Rosie Harriskine', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-05-01', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000008.0000, 9.0000, 4725008.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 8, '25419', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '3180 Union Terrace', NULL, NULL, 'rharriskinea@ft.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('2d6756d9-f989-440e-9a71-d0cce04fe4c9', 'NV-1111', 'Karol Jacqueminot', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-02-16', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000003.0000, 4.0000, 4725003.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 3, '25414', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '3 Westend Way', NULL, NULL, 'kjacqueminot5@merriam-webster.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('2dca39cb-dbdd-410e-9a63-be3e7bb430de', 'NV-1355', 'Magnum Fibben', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-04-23', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000047.0000, 48.0000, 4725047.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 47, '25458', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '87193 Maywood Parkway', NULL, NULL, 'mfibben1d@sphinn.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('2ec8542e-d649-4223-b7fb-588eec023cdd', 'NV-1344', 'Stevy Canas', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2020-11-01', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000036.0000, 37.0000, 4725036.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 36, '25447', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '8114 Elmside Crossing', NULL, NULL, 'scanas12@theglobeandmail.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('3189d13d-cb88-4e54-b663-6ea31a0cc61e', 'NV-1034', 'Orly Neeves', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-05-30', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000026.0000, 27.0000, 4725026.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 26, '25437', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '4 Mitchell Road', NULL, NULL, 'oneevess@bbc.co.uk', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('322a352c-a005-49df-aaff-8fabc2c033ff', 'NV-1150', 'Kalie Jellico', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-06-16', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000042.0000, 43.0000, 4725042.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 42, '25453', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '7 Sullivan Court', NULL, NULL, 'kjellico18@umn.edu', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('32b3daa8-ee3d-4c2d-a877-157ad97234c1', 'NV-1326', 'Lizabeth Valentino', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-07-23', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000018.0000, 19.0000, 4725018.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 18, '25429', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '40 Gulseth Alley', NULL, NULL, 'lvalentinok@oaic.gov.au', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('334a1b55-7c1f-416d-86c0-a1415c7ac1b9', 'NV-1122', 'Kassie Benion', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-02-08', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000014.0000, 15.0000, 4725014.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 14, '25425', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '147 Mifflin Junction', NULL, NULL, 'kbeniong@youku.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('3764058c-89df-4c73-95a9-b02ddeb5347b', 'NV-1121', 'Hermia Father', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-05-22', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000013.0000, 14.0000, 4725013.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 13, '25424', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '200 Cherokee Alley', NULL, NULL, 'hfatherf@ebay.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('37d40f31-b406-4ad0-9bf7-33b0f71511bd', 'NV-1107', 'Shaughn Eilers', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 0, '2022-11-21', 'Nhân viên Update', NULL, NULL, NULL, NULL, NULL, NULL, 15000000.0000, 2.0000, 9500000.0000, '8695235611', 'Cư trú và có HĐLĐ từ 3 th', 1, '545112151', 'Ngân hàng Techcombank', 'Thanh Hóa', 'Thanh Hóa', '3197 Spenser Way', NULL, NULL, 'seilers1@nymag.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('38133cb7-96d7-407a-a222-6920e63eee02', 'NV-1045', 'Adolph Tather', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-04-22', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000037.0000, 38.0000, 4725037.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 37, '25448', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '19701 Fair Oaks Crossing', NULL, NULL, 'atather13@nytimes.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('39c16212-c1b6-423c-8165-529dfee26bd8', 'NV-1112', 'Alberto Cawthra', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-12-21', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000004.0000, 5.0000, 4725004.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 4, '25415', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '5 Stuart Terrace', NULL, NULL, 'acawthra6@disqus.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('3a5587e6-dc61-40a6-b5c9-3673e5f7eb3d', 'NV-1145', 'Adolph Tather', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-04-22', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000037.0000, 38.0000, 4725037.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 37, '25448', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '19701 Fair Oaks Crossing', NULL, NULL, 'atather13@nytimes.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('3bfbce56-499c-4b6d-bdee-c7fb1d2f6367', 'NV-1354', 'Julie Crommett', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-04-16', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000046.0000, 47.0000, 4725046.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 46, '25457', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '4178 Dovetail Street', NULL, NULL, 'jcrommett1c@furl.net', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('417fce63-ae6a-4025-bbf3-ffc77fc41ed0', 'NV-1049', 'Caleb Nerger', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2020-12-20', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000041.0000, 42.0000, 4725041.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 41, '25452', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '7 Hintze Hill', NULL, NULL, 'cnerger17@oaic.gov.au', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('42203310-5606-43ec-82c1-3cff5cfff20a', 'NV-1042', 'Francklyn Sivier', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-10-12', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000034.0000, 35.0000, 4725034.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 34, '25445', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '6569 Mosinee Court', NULL, NULL, 'fsivier10@skyrock.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('42b320ca-46d2-4df2-8137-12e199f0e6a9', 'NV-1342', 'Francklyn Sivier', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-10-12', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000034.0000, 35.0000, 4725034.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 34, '25445', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '6569 Mosinee Court', NULL, NULL, 'fsivier10@skyrock.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('4417303d-e5b9-476c-9b2e-150f8f67273c', 'NV-1022', 'Kassie Benion', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-02-08', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000014.0000, 15.0000, 4725014.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 14, '25425', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '147 Mifflin Junction', NULL, NULL, 'kbeniong@youku.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('44894741-73f2-4d6c-a4a3-51b8a752b6b5', 'NV-1125', 'Obadias Holtham', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-05-28', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000017.0000, 18.0000, 4725017.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 17, '25428', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '94782 6th Parkway', NULL, NULL, 'oholthamj@vimeo.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('44e963b3-3680-4182-bfcf-43a35c8af080', 'NV-1314', 'Arvie Pilcher', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-01-27', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000006.0000, 7.0000, 4725006.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 6, '25417', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '276 Ludington Court', NULL, NULL, 'apilcher8@nature.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('4558f3f8-0485-4767-9540-07f05a801ef1', 'NV-1006', 'Richmond Tildesley', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 0, '2022-10-22', 'Giám đốc Update', NULL, NULL, NULL, NULL, NULL, NULL, 30000000.0000, 3.0000, 14250000.0000, '7859865265', 'Cư trú và có HĐLĐ từ 3 th', 2, '8715545', 'Ngân hàng TMCP Quân đội', 'Trần Duy Hưng', 'Hà Nội', '941 Mccormick Trail', NULL, NULL, 'rtildesley0@clickbank.net', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('474f32e5-6515-4fad-8ad2-e791fa8cb141', 'NV-1050', 'Kalie Jellico', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-06-16', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000042.0000, 43.0000, 4725042.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 42, '25453', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '7 Sullivan Court', NULL, NULL, 'kjellico18@umn.edu', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('484af122-7f12-450d-8622-76f37273a11f', 'NV-1134', 'Orly Neeves', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-05-30', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000026.0000, 27.0000, 4725026.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 26, '25437', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '4 Mitchell Road', NULL, NULL, 'oneevess@bbc.co.uk', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('4961acee-5650-43a1-ba8f-5dc38ca6b0de', 'NV-1330', 'Honey Putson', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-10-20', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000022.0000, 23.0000, 4725022.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 22, '25433', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '39 Mendota Park', NULL, NULL, 'hputsono@uiuc.edu', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('4b8b5c12-5f14-4d81-9258-9d28cd8a96ec', 'NV-1014', 'Arvie Pilcher', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-01-27', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000006.0000, 7.0000, 4725006.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 6, '25417', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '276 Ludington Court', NULL, NULL, 'apilcher8@nature.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('4c289afd-552e-4c7f-8376-251b57de50bd', 'NV-1051', 'Lenci Fifield', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-02-07', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000043.0000, 44.0000, 4725043.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 43, '25454', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '59 Nevada Point', NULL, NULL, 'lfifield19@netlog.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('4c7cabb4-83c4-4223-adf5-4b3f2580b575', 'NV-1142', 'Francklyn Sivier', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-10-12', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000034.0000, 35.0000, 4725034.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 34, '25445', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '6569 Mosinee Court', NULL, NULL, 'fsivier10@skyrock.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('4ee38c7e-8b80-4728-8ad7-1962984e3012', 'NV-1317', 'Terry Locock', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-04-21', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000009.0000, 10.0000, 4725009.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 9, '25420', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '77 Bonner Junction', NULL, NULL, 'tlocockb@mlb.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('4fff61c9-1d49-4dc4-9828-f2912d8608c4', 'NV-1349', 'Caleb Nerger', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2020-12-20', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000041.0000, 42.0000, 4725041.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 41, '25452', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '7 Hintze Hill', NULL, NULL, 'cnerger17@oaic.gov.au', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('513e114f-f1c3-4867-b36a-cf4761bc6225', 'NV-1023', 'Burtie Beddoes', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-03-01', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000015.0000, 16.0000, 4725015.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 15, '25426', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '1 Monterey Park', NULL, NULL, 'bbeddoesh@phpbb.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('53b4cb2d-6ab2-43cc-b1d3-3e805ceab754', 'NV-1116', 'Rosie Harriskine', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-05-01', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000008.0000, 9.0000, 4725008.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 8, '25419', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '3180 Union Terrace', NULL, NULL, 'rharriskinea@ft.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('54f407ca-b713-40b6-88cd-ff0583a7a814', 'NV-1313', 'Rubin Leydon', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-01-21', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000005.0000, 6.0000, 4725005.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 5, '25416', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '6770 Reinke Alley', NULL, NULL, 'rleydon7@ebay.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('5701231d-9f64-419a-be51-1290ae73c8ea', 'NV-1039', 'Jake Lanbertoni', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-10-14', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000031.0000, 32.0000, 4725031.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 31, '25442', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '32734 Cambridge Parkway', NULL, NULL, 'jlanbertonix@unesco.org', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('599ab9a2-b4d9-44e1-9ab8-ba7b473fafb9', 'NV-1133', 'Orel Bodman', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2020-11-12', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000025.0000, 26.0000, 4725025.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 25, '25436', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '16 Bunker Hill Lane', NULL, NULL, 'obodmanr@printfriendly.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('5c484836-d65b-4b95-8a23-f442f4039c68', 'NV-1149', 'Caleb Nerger', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2020-12-20', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000041.0000, 42.0000, 4725041.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 41, '25452', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '7 Hintze Hill', NULL, NULL, 'cnerger17@oaic.gov.au', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('5d205d25-652a-4650-92c2-df2cc533fd66', 'NV-1139', 'Jake Lanbertoni', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-10-14', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000031.0000, 32.0000, 4725031.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 31, '25442', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '32734 Cambridge Parkway', NULL, NULL, 'jlanbertonix@unesco.org', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('63804d38-3295-4e9f-9a23-39a0e8d03457', 'NV-1157', 'Thêm mới 1', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 0, '2023-04-10', 'nhân viên', NULL, '036202012169', '2023-01-22', 'Nam Định', NULL, NULL, 12000048.0000, 49.0000, 4725048.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 48, '25459', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', 'Xuân Hòa, Xuân Trường, Nam Định', '912945494', '946020547', 'trtheanh.work@gmail.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('6801fb02-d8c9-439c-b496-2ae64d3dc40a', 'NV-1043', 'Menard Brazil', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-12-05', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000035.0000, 36.0000, 4725035.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 35, '25446', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '66890 Red Cloud Crossing', NULL, NULL, 'mbrazil11@desdev.cn', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('6c6172ce-0a31-49ec-b8e0-8cff72cfb88b', 'AB2-1006', 'fja', '17120d02-6ab5-3e43-18cb-66948daf6128', 'PB-9483', 'Phòng đào tạo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-29 13:45:20', 'USER ADD', NULL, NULL),
('6dcff11c-a5aa-4ed9-8fed-12255b8f893d', 'NV-1347', 'Mariann Axe', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-09-24', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000039.0000, 40.0000, 4725039.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 39, '25450', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '93835 Melody Avenue', NULL, NULL, 'maxe15@123-reg.co.uk', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('71d4a489-702c-4361-b0da-72f25a28b280', 'NV-1147', 'Mariann Axe', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-09-24', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000039.0000, 40.0000, 4725039.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 39, '25450', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '93835 Melody Avenue', NULL, NULL, 'maxe15@123-reg.co.uk', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('7266b2bc-ff10-49b6-bee9-d135b70dff72', 'NV-1156', 'Trần Thế Anh', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 0, '2023-04-10', 'Chủ tịch hội đồng quản trị', NULL, '036202012169', '2023-01-22', 'Nam Định', NULL, NULL, 12000048.0000, 49.0000, 4725048.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 48, '25459', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', 'Xuân Hòa, Xuân Trường, Nam Định', '912945494', '946020547', 'trtheanh.work@gmail.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('742e5b09-dbca-4dec-8029-489164a7c149', 'NV-1144', 'Stevy Canas', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2020-11-01', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000036.0000, 37.0000, 4725036.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 36, '25447', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '8114 Elmside Crossing', NULL, NULL, 'scanas12@theglobeandmail.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('77ff67b4-20be-434e-8a2e-c9c03efe37fd', 'NV-1128', 'Glenine Wrightim', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-09-14', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000020.0000, 21.0000, 4725020.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 20, '25431', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '10431 Derek Terrace', NULL, NULL, 'gwrightimm@list-manage.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('793164b2-9cb1-460e-a9d7-498cb8af9c6c', 'NV-1348', 'Sandro Holworth', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-12-03', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000040.0000, 41.0000, 4725040.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 40, '25451', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '06927 Veith Plaza', NULL, NULL, 'sholworth16@list-manage.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('796ce928-5e36-4ba8-9435-eea3a0b1d31f', 'NV-1306', 'Richmond Tildesley', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 0, '2022-10-22', 'Giám đốc Update', NULL, NULL, NULL, NULL, NULL, NULL, 30000000.0000, 3.0000, 14250000.0000, '7859865265', 'Cư trú và có HĐLĐ từ 3 tháng trở lên', 2, '8715545', 'Ngân hàng TMCP Quân đội', 'Trần Duy Hưng', 'Hà Nội', '941 Mccormick Trail', NULL, NULL, 'rtildesley0@clickbank.net', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('7ab9fa12-98cf-4ac7-a1b2-48244bdad1a4', 'NV-1026', 'Lizabeth Valentino', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-07-23', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000018.0000, 19.0000, 4725018.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 18, '25429', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '40 Gulseth Alley', NULL, NULL, 'lvalentinok@oaic.gov.au', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('7b7c7c1d-876f-4341-bca5-b1c3bac5a0e0', 'NV-1106', 'Richmond Tildesley', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 0, '2022-10-22', 'Giám đốc Update', NULL, NULL, NULL, NULL, NULL, NULL, 30000000.0000, 3.0000, 14250000.0000, '7859865265', 'Cư trú và có HĐLĐ từ 3 th', 2, '8715545', 'Ngân hàng TMCP Quân đội', 'Trần Duy Hưng', 'Hà Nội', '941 Mccormick Trail', NULL, NULL, 'rtildesley0@clickbank.net', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('7d109969-a165-4372-9ffb-83c3474afb8d', 'NV-1321', 'Hermia Father', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-05-22', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000013.0000, 14.0000, 4725013.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 13, '25424', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '200 Cherokee Alley', NULL, NULL, 'hfatherf@ebay.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('8154e004-f55d-48aa-9046-55ef9f6c84ba', 'NV-1114', 'Arvie Pilcher', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-01-27', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000006.0000, 7.0000, 4725006.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 6, '25417', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '276 Ludington Court', NULL, NULL, 'apilcher8@nature.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('84293717-51e9-4d60-98bf-fe18c88bff25', 'NV-1035', 'Rochette Luttger', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-03-26', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000027.0000, 28.0000, 4725027.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 27, '25438', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '4 Claremont Place', NULL, NULL, 'rluttgert@bloomberg.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('855b6ec6-7512-459a-b8ea-97b06cb7c2cb', 'NV-1036', 'Heloise Hinz', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-07-11', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000028.0000, 29.0000, 4725028.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 28, '25439', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '8882 Boyd Court', NULL, NULL, 'hhinzu@hud.gov', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('87ca39ea-cf1d-42b5-865b-1c1faaf86b92', 'NV-1325', 'Obadias Holtham', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-05-28', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000017.0000, 18.0000, 4725017.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 17, '25428', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '94782 6th Parkway', NULL, NULL, 'oholthamj@vimeo.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('8885cb47-3af9-4aae-bd16-4d97446c3f56', 'NV-1113', 'Rubin Leydon', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-01-21', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000005.0000, 6.0000, 4725005.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 5, '25416', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '6770 Reinke Alley', NULL, NULL, 'rleydon7@ebay.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('88febafc-d398-41c4-86bf-4d682dc70780', 'NV-1041', 'Nicola Glassborow', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-03-06', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000033.0000, 34.0000, 4725033.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 33, '25444', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '8621 Dorton Terrace', NULL, NULL, 'nglassborowz@tripadvisor.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('8978aa05-a6c2-4968-bd35-3714c032b8db', 'NV-1124', 'Denys Baxendale', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-06-09', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000016.0000, 17.0000, 4725016.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 16, '25427', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '0280 Lunder Road', NULL, NULL, 'dbaxendalei@wikia.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('8fbf00c4-2947-4315-b970-08bba7f26eb3', 'AB2-1002', 'Thế Anh', '17120d02-6ab5-3e43-18cb-66948daf6128', 'PB-9483', 'Phòng đào tạo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-28 20:46:51', 'USER ADD', NULL, NULL),
('8fdd5158-fbd1-422b-9e55-31c59386f229', 'NV-1357', 'Trần Thế Anh', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 0, '2002-06-09', 'Quản lý dự án', NULL, '036202012169', '2022-01-22', 'nam định', NULL, NULL, 10000.0000, 1.0000, 1.0000, '1', '1', 1, '1', '1', '1', '1', 'hà nội', '0912945494', '0912945494', 'theanh090602@gmail.com', '2023-07-30 12:26:23', 'USER ADD', NULL, NULL),
('91da0954-59a6-4ab0-9a77-e2a84c0a466c', 'NV-1018', 'Gunner Christmas', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-05-30', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000010.0000, 11.0000, 4725010.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 10, '25421', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '4571 Kenwood Pass', NULL, NULL, 'gchristmasc@mayoclinic.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('9277f28f-d9a2-438b-993c-2d195f6b683e', 'NV-1024', 'Denys Baxendale', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-06-09', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000016.0000, 17.0000, 4725016.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 16, '25427', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '0280 Lunder Road', NULL, NULL, 'dbaxendalei@wikia.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('95abf459-d0b1-44c2-ad9f-7fecdf43dffd', 'NV-1020', 'Bogart Larvor', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-07-19', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000012.0000, 13.0000, 4725012.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 12, '25423', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '471 Garrison Trail', NULL, NULL, 'blarvore@github.io', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('9608016b-4317-4672-8f1e-42e562b2b975', 'NV-1328', 'Glenine Wrightim', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-09-14', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000020.0000, 21.0000, 4725020.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 20, '25431', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '10431 Derek Terrace', NULL, NULL, 'gwrightimm@list-manage.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('972f2893-1a09-435a-b705-9fa3886af9d3', 'NV-1320', 'Bogart Larvor', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-07-19', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000012.0000, 13.0000, 4725012.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 12, '25423', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '471 Garrison Trail', NULL, NULL, 'blarvore@github.io', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('97a10dc1-7277-4022-8ce3-48ec06d43393', 'NV-1031', 'Arlina Dalgety', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-01-31', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000023.0000, 24.0000, 4725023.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 23, '25434', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '8634 Porter Place', NULL, NULL, 'adalgetyp@instagram.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('9ada3535-07db-407f-b4f7-fb102cc23128', 'NV-1021', 'Hermia Father', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-05-22', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000013.0000, 14.0000, 4725013.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 13, '25424', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '200 Cherokee Alley', NULL, NULL, 'hfatherf@ebay.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('9ca83fd3-3469-4d82-a7bc-65de2dbaa493', 'NV-1351', 'Lenci Fifield', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-02-07', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000043.0000, 44.0000, 4725043.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 43, '25454', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '59 Nevada Point', NULL, NULL, 'lfifield19@netlog.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('9e4f20db-9292-4d06-a062-dd7d6ba724f9', 'NV-1033', 'Orel Bodman', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2020-11-12', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000025.0000, 26.0000, 4725025.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 25, '25436', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '16 Bunker Hill Lane', NULL, NULL, 'obodmanr@printfriendly.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('9e9084ac-ce7c-4ea3-b0be-5e52345c3fae', 'NV-1154', 'Julie Crommett', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-04-16', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000046.0000, 47.0000, 4725046.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 46, '25457', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '4178 Dovetail Street', NULL, NULL, 'jcrommett1c@furl.net', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('a00d1894-f221-4bda-8c4e-365b0ac3967e', 'NV-1155', 'Magnum Fibben', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-04-23', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000047.0000, 48.0000, 4725047.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 47, '25458', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '87193 Maywood Parkway', NULL, NULL, 'mfibben1d@sphinn.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('a01c9720-e018-4fdd-ad86-461037d927ba', 'NV-1353', 'Pepita Stutely', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-11-13', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000045.0000, 46.0000, 4725045.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 45, '25456', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '726 Chive Center', NULL, NULL, 'pstutely1b@salon.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('a3a0d158-05dd-4422-8402-4dd7d38fe3ba', 'NV-1057', 'Thêm mới 1', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 0, '2023-04-10', 'nhân viên', NULL, '036202012169', '2023-01-22', 'Nam Định', NULL, NULL, 12000048.0000, 49.0000, 4725048.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 48, '25459', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', 'Xuân Hòa, Xuân Trường, Nam Định', '912945494', '946020547', 'trtheanh.work@gmail.com', '2023-07-28 18:11:41', 'TTANH Tạo mới', NULL, NULL),
('a568a7ce-fc0b-4646-b974-1822af51cf05', 'NV-1011', 'Karol Jacqueminot', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-02-16', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000003.0000, 4.0000, 4725003.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 3, '25414', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '3 Westend Way', NULL, NULL, 'kjacqueminot5@merriam-webster.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('a6728134-14a0-4a38-a632-1b940280dbf6', 'NV-1151', 'Lenci Fifield', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-02-07', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000043.0000, 44.0000, 4725043.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 43, '25454', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '59 Nevada Point', NULL, NULL, 'lfifield19@netlog.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('a6bf58a4-0fa8-4f37-bcb4-ea010cefaa83', 'NV-1352', 'Washington Haythorne', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-07-13', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000044.0000, 45.0000, 4725044.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 44, '25455', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '39 Fairfield Street', NULL, NULL, 'whaythorne1a@bloglovin.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('a86cd61f-c063-4c7a-bbc9-f4343a0ff9a1', 'NV-1046', 'Elise Emmott', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-09-26', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000038.0000, 39.0000, 4725038.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 38, '25449', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '7392 Columbus Crossing', NULL, NULL, 'eemmott14@webs.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('a927bc4e-2168-4032-bb2e-0859212e18b5', 'NV-1012', 'Alberto Cawthra', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-12-21', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000004.0000, 5.0000, 4725004.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 4, '25415', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '5 Stuart Terrace', NULL, NULL, 'acawthra6@disqus.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('aa24fc8e-de47-4142-b90a-331c93735e09', 'NV-1052', 'Washington Haythorne', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-07-13', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000044.0000, 45.0000, 4725044.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 44, '25455', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '39 Fairfield Street', NULL, NULL, 'whaythorne1a@bloglovin.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('aeb71e2a-3294-4ad2-96fa-4ce5f255574b', 'NV-1146', 'Elise Emmott', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-09-26', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000038.0000, 39.0000, 4725038.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 38, '25449', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '7392 Columbus Crossing', NULL, NULL, 'eemmott14@webs.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('aebffdfd-6bed-4cf7-aa8d-57b42c51f7ba', 'NV-1141', 'Nicola Glassborow', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-03-06', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000033.0000, 34.0000, 4725033.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 33, '25444', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '8621 Dorton Terrace', NULL, NULL, 'nglassborowz@tripadvisor.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('b09544a6-0243-4a98-a290-4561da8e5f23', 'NV-1030', 'Honey Putson', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-10-20', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000022.0000, 23.0000, 4725022.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 22, '25433', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '39 Mendota Park', NULL, NULL, 'hputsono@uiuc.edu', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('b209f013-c171-4323-8d2e-ab6aeb9bd0b1', 'NV-1053', 'Pepita Stutely', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-11-13', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000045.0000, 46.0000, 4725045.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 45, '25456', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '726 Chive Center', NULL, NULL, 'pstutely1b@salon.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('b66fca3a-2662-420e-b7ca-8e42c7c276b9', 'NV-1013', 'Rubin Leydon', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-01-21', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000005.0000, 6.0000, 4725005.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 5, '25416', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '6770 Reinke Alley', NULL, NULL, 'rleydon7@ebay.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('b6c61d6a-e58e-45d2-8963-bd837997e786', 'NV-1119', 'Concettina Tudball', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-12-24', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000011.0000, 12.0000, 4725011.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 11, '25422', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '921 Elgar Alley', NULL, NULL, 'ctudballd@baidu.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('b734d83f-613e-491f-b321-4d6a66852127', 'NV-1316', 'Rosie Harriskine', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-05-01', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000008.0000, 9.0000, 4725008.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 8, '25419', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '3180 Union Terrace', NULL, NULL, 'rharriskinea@ft.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('b74f5d00-b9d6-4b89-86eb-52e5207b84c2', 'NV-1123', 'Burtie Beddoes', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-03-01', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000015.0000, 16.0000, 4725015.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 15, '25426', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '1 Monterey Park', NULL, NULL, 'bbeddoesh@phpbb.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('b767752a-2d80-4b8e-95ee-c13328f33ef0', 'NV-1117', 'Terry Locock', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-04-21', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000009.0000, 10.0000, 4725009.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 9, '25420', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '77 Bonner Junction', NULL, NULL, 'tlocockb@mlb.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('b776d0f6-69cf-4b68-85ea-90568fc58a87', 'NV-1152', 'Washington Haythorne', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-07-13', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000044.0000, 45.0000, 4725044.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 44, '25455', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '39 Fairfield Street', NULL, NULL, 'whaythorne1a@bloglovin.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('b7b8b02e-654a-48d0-8bd1-28e24905950b', 'NV-1109', 'Locke Ireson', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-10-25', 'Nhân viên vip', NULL, '036202012169', '1990-04-10', 'Nam Định', NULL, NULL, 12000001.0000, 2.1000, 4725001.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 1, '25412', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '9256 Coolidge Point', '912945494', '912945494', 'lireson3@hostgator.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('ba5d80ad-313b-40dd-bb39-5d6f0cddfdcd', 'NV-1028', 'Glenine Wrightim', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-09-14', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000020.0000, 21.0000, 4725020.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 20, '25431', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '10431 Derek Terrace', NULL, NULL, 'gwrightimm@list-manage.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('bcae9730-79c6-4742-a1c1-4f6784037c70', 'AB2-1000', 'Thế Anh', '17120d02-6ab5-3e43-18cb-66948daf6128', 'PB-9483', 'Phòng đào tạo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-28 18:16:32', 'TTANH Tạo mới', NULL, NULL),
('be4cf010-454f-4aee-ba6d-bba1849bcccf', 'NV-1346', 'Elise Emmott', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-09-26', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000038.0000, 39.0000, 4725038.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 38, '25449', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '7392 Columbus Crossing', NULL, NULL, 'eemmott14@webs.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL);
INSERT INTO `employee` (`EmployeeId`, `EmployeeCode`, `FullName`, `DepartmentId`, `DepartmentCode`, `DepartmentName`, `Gender`, `DateOfBirth`, `Position`, `SupplierCustomerGroup`, `IdentityNumber`, `IdentityDate`, `IdentityPlace`, `PayAccount`, `ReceiveAccount`, `Salary`, `SalaryCoefficients`, `SalaryPaidForInsurance`, `PersonalTaxCode`, `TypeOfContract`, `NumberOfDependents`, `AccountNumber`, `BankName`, `BankBranch`, `BankProvince`, `ContactAddress`, `ContactPhoneNumber`, `ContactLandlinePhoneNumber`, `ContactEmail`, `CreatedDate`, `CreatedBy`, `ModifiedDate`, `ModifiedBy`) VALUES
('c044bc60-a9f7-4119-973d-a5f279d3e27b', 'NV-1318', 'Gunner Christmas', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-05-30', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000010.0000, 11.0000, 4725010.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 10, '25421', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '4571 Kenwood Pass', NULL, NULL, 'gchristmasc@mayoclinic.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('c21da672-367e-4371-a006-1aa6a99d14a0', 'NV-1015', 'Osbourne Wooster', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-01-20', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000007.0000, 8.0000, 4725007.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 7, '25418', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '9138 Oak Street', NULL, NULL, 'owooster9@auda.org.au', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('c4edc007-514d-4720-b30f-133b14f90001', 'NV-1038', 'Dougie Tumbridge', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-04-21', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000030.0000, 31.0000, 4725030.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 30, '25441', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '76200 Pond Terrace', NULL, NULL, 'dtumbridgew@imgur.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('c5222018-17c3-4853-96a6-7c8114dd982a', 'NV-1331', 'Arlina Dalgety', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-01-31', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000023.0000, 24.0000, 4725023.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 23, '25434', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '8634 Porter Place', NULL, NULL, 'adalgetyp@instagram.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('c765bebb-8d51-46a4-8001-6067fc9530f8', 'NV-1140', 'Sheilah Willcox', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-06-17', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000032.0000, 33.0000, 4725032.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 32, '25443', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '8002 Hagan Road', NULL, NULL, 'swillcoxy@japanpost.jp', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('c7e2ef89-1647-4711-9814-6f5d53ebca9a', 'NV-1339', 'Jake Lanbertoni', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-10-14', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000031.0000, 32.0000, 4725031.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 31, '25442', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '32734 Cambridge Parkway', NULL, NULL, 'jlanbertonix@unesco.org', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('c8be9d26-daf0-4139-95ce-9e833c533ebb', 'NV-1312', 'Alberto Cawthra', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-12-21', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000004.0000, 5.0000, 4725004.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 4, '25415', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '5 Stuart Terrace', NULL, NULL, 'acawthra6@disqus.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('cb7bff10-5d41-4c80-a4db-5108c6be3675', 'NV-1138', 'Dougie Tumbridge', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-04-21', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000030.0000, 31.0000, 4725030.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 30, '25441', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '76200 Pond Terrace', NULL, NULL, 'dtumbridgew@imgur.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('cb8a975b-b01d-460b-b556-f7f2b6627a08', 'NV-1040', 'Sheilah Willcox', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-06-17', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000032.0000, 33.0000, 4725032.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 32, '25443', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '8002 Hagan Road', NULL, NULL, 'swillcoxy@japanpost.jp', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('cc238750-689a-479d-bf6d-999948fabaec', 'NV-1336', 'Heloise Hinz', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-07-11', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000028.0000, 29.0000, 4725028.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 28, '25439', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '8882 Boyd Court', NULL, NULL, 'hhinzu@hud.gov', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('ccbfc79f-b0f2-4672-8ae2-29a7de4d4723', 'NV-1056', 'Trần Thế Anh', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 0, '2023-04-10', 'Chủ tịch hội đồng quản trị', NULL, '036202012169', '2023-01-22', 'Nam Định', NULL, NULL, 12000048.0000, 49.0000, 4725048.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 48, '25459', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', 'Xuân Hòa, Xuân Trường, Nam Định', '912945494', '946020547', 'trtheanh.work@gmail.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('ccecc45d-1dc5-4739-bf29-74345eaed760', 'NV-1319', 'Concettina Tudball', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-12-24', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000011.0000, 12.0000, 4725011.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 11, '25422', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '921 Elgar Alley', NULL, NULL, 'ctudballd@baidu.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('cd0f50ae-0f17-4fe0-b1b0-d836ebdff6c9', 'NV-1338', 'Dougie Tumbridge', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-04-21', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000030.0000, 31.0000, 4725030.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 30, '25441', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '76200 Pond Terrace', NULL, NULL, 'dtumbridgew@imgur.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('cdd2d938-e229-40f3-a563-f8e85d8b2110', 'NV-1329', 'Zuzana Wetheril', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-10-30', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000021.0000, 22.0000, 4725021.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 21, '25432', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '20361 Shelley Avenue', NULL, NULL, 'zwetheriln@icio.us', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('cec22f46-ede7-458d-88c1-cb77698b7933', 'NV-1323', 'Burtie Beddoes', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-03-01', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000015.0000, 16.0000, 4725015.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 15, '25426', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '1 Monterey Park', NULL, NULL, 'bbeddoesh@phpbb.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('cfa7a7b8-84cc-4711-adfb-e188dc31d06e', 'NV-1008', 'Raynard Jopke', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-01-18', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000000.0000, 1.0000, 4725000.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 0, '25411', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '9394 North Road', NULL, NULL, 'rjopke2@newyorker.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('cfb02733-c458-4693-8698-a69a45948876', 'NV-1337', 'Sonya Gabbot', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-09-24', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000029.0000, 30.0000, 4725029.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 29, '25440', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '187 Acker Street', NULL, NULL, 'sgabbotv@usgs.gov', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('cfb2d8f0-f5bc-4b90-9184-fa7c953fd1b3', 'NV-1126', 'Lizabeth Valentino', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-07-23', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000018.0000, 19.0000, 4725018.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 18, '25429', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '40 Gulseth Alley', NULL, NULL, 'lvalentinok@oaic.gov.au', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('d01d2564-0ba8-4bb7-94f0-fe3eeb74ebf5', 'NV-1060', 'Locke Ireson', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-10-25', 'Nhân viên vip', NULL, '036202012169', '1990-04-10', 'Nam Định', NULL, NULL, 12000001.0000, 2.1000, 4725001.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 1, '25412', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '9256 Coolidge Point', '912945494', '912945494', 'lireson3@hostgator.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('d3464249-b4d1-4c76-a8bb-28b0bd00ed11', 'NV-1017', 'Terry Locock', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-04-21', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000009.0000, 10.0000, 4725009.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 9, '25420', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '77 Bonner Junction', NULL, NULL, 'tlocockb@mlb.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('d4e604f5-a3a8-44a3-a4ad-82be47e2e6ee', 'NV-1032', 'Waldo Heinz', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-12-11', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000024.0000, 25.0000, 4725024.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 24, '25435', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '37 La Follette Crossing', NULL, NULL, 'wheinzq@twitpic.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('d89ed9ff-92cf-4a94-9fe1-a18994b04174', 'NV-1135', 'Rochette Luttger', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-03-26', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000027.0000, 28.0000, 4725027.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 27, '25438', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '4 Claremont Place', NULL, NULL, 'rluttgert@bloomberg.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('dbdd1488-3182-44d7-8d7c-49688e4978f1', 'NV-1332', 'Waldo Heinz', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-12-11', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000024.0000, 25.0000, 4725024.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 24, '25435', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '37 La Follette Crossing', NULL, NULL, 'wheinzq@twitpic.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('dd62a536-096b-4dd7-b8b6-8a2bf110ffd1', 'NV-1127', 'Taylor Triswell', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-07-13', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000019.0000, 20.0000, 4725019.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 19, '25430', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '1 Morningstar Terrace', NULL, NULL, 'ttriswelll@hud.gov', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('dd7904c5-9738-423f-bf96-6dc26376c5a7', 'NV-1350', 'Kalie Jellico', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-06-16', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000042.0000, 43.0000, 4725042.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 42, '25453', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '7 Sullivan Court', NULL, NULL, 'kjellico18@umn.edu', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('ddd72da2-234c-49a9-9d71-b4fec34f0469', 'A-1001', 'Thay đổi excel', '17120d02-6ab5-3e43-18cb-66948daf6128', 'PB-9483', 'Phòng đào tạo', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-28 18:16:32', 'TTANH Tạo mới', NULL, NULL),
('df94982a-c89e-423c-9022-ed8b2c2f4f79', 'NV-1115', 'Osbourne Wooster', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-01-20', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000007.0000, 8.0000, 4725007.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 7, '25418', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '9138 Oak Street', NULL, NULL, 'owooster9@auda.org.au', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('e0ee6bd8-51cd-4e7f-9e5d-3295f1d3932e', 'NV-1131', 'Arlina Dalgety', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-01-31', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000023.0000, 24.0000, 4725023.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 23, '25434', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '8634 Porter Place', NULL, NULL, 'adalgetyp@instagram.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('e18fa527-5d91-460c-aef4-9412eb605e2c', 'NV-1335', 'Rochette Luttger', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-03-26', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000027.0000, 28.0000, 4725027.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 27, '25438', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '4 Claremont Place', NULL, NULL, 'rluttgert@bloomberg.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('e18fe39b-91a9-4356-a207-b9ac38a0915d', 'NV-1311', 'Karol Jacqueminot', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-02-16', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000003.0000, 4.0000, 4725003.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 3, '25414', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '3 Westend Way', NULL, NULL, 'kjacqueminot5@merriam-webster.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('e47953d1-a43f-4af4-87fe-4f4915056f10', 'NV-1334', 'Orly Neeves', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-05-30', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000026.0000, 27.0000, 4725026.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 26, '25437', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '4 Mitchell Road', NULL, NULL, 'oneevess@bbc.co.uk', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('e7edf6b0-ce15-4bf5-8d72-a86a0f3db35d', 'NV-1048', 'Sandro Holworth', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-12-03', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000040.0000, 41.0000, 4725040.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 40, '25451', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '06927 Veith Plaza', NULL, NULL, 'sholworth16@list-manage.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('e85d4196-f337-443d-9613-b084567028e0', 'NV-1322', 'Kassie Benion', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-02-08', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000014.0000, 15.0000, 4725014.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 14, '25425', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '147 Mifflin Junction', NULL, NULL, 'kbeniong@youku.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('e8d90658-87a7-49a6-8099-d95e9b409f82', 'NV-1136', 'Heloise Hinz', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-07-11', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000028.0000, 29.0000, 4725028.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 28, '25439', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '8882 Boyd Court', NULL, NULL, 'hhinzu@hud.gov', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('e94e7d8e-fc2d-4fad-be03-701f1b33699e', 'NV-1029', 'Zuzana Wetheril', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-10-30', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000021.0000, 22.0000, 4725021.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 21, '25432', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '20361 Shelley Avenue', NULL, NULL, 'zwetheriln@icio.us', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('ebf06878-b857-41f6-888f-d4589321fe97', 'NV-1153', 'Pepita Stutely', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-11-13', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000045.0000, 46.0000, 4725045.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 45, '25456', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '726 Chive Center', NULL, NULL, 'pstutely1b@salon.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('ed9ba407-66e2-4022-b524-cfb95423f86d', 'NV-1308', 'Raynard Jopke', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-01-18', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000000.0000, 1.0000, 4725000.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 0, '25411', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '9394 North Road', NULL, NULL, 'rjopke2@newyorker.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('efa5c937-11bc-480a-b59a-6154762c6f28', 'NV-1132', 'Waldo Heinz', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-12-11', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000024.0000, 25.0000, 4725024.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 24, '25435', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '37 La Follette Crossing', NULL, NULL, 'wheinzq@twitpic.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('f193e335-20bd-42ea-b04d-2dfc95d516f8', 'NV-1129', 'Zuzana Wetheril', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-10-30', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000021.0000, 22.0000, 4725021.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 21, '25432', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '20361 Shelley Avenue', NULL, NULL, 'zwetheriln@icio.us', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL),
('f4a71434-50fa-492c-b948-2c52dfc57f05', 'NV-1025', 'Obadias Holtham', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2021-05-28', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000017.0000, 18.0000, 4725017.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 17, '25428', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '94782 6th Parkway', NULL, NULL, 'oholthamj@vimeo.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('f5ceb51f-9bf7-4057-8d51-e92747f2ffc5', 'NV-1341', 'Nicola Glassborow', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-03-06', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000033.0000, 34.0000, 4725033.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 33, '25444', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '8621 Dorton Terrace', NULL, NULL, 'nglassborowz@tripadvisor.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('f5d9c193-e12c-4328-8201-dd2bbfa495d2', 'NV-1356', 'Trần Thế Anh', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 0, '2023-04-10', 'Chủ tịch hội đồng quản trị', NULL, '036202012169', '2023-01-22', 'Nam Định', NULL, NULL, 12000048.0000, 49.0000, 4725048.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 48, '25459', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', 'Xuân Hòa, Xuân Trường, Nam Định', '912945494', '946020547', 'trtheanh.work@gmail.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('f6f6e69e-07f0-42ca-b2ca-5d8d0b8ba021', 'AB2-1005', 'thế anh trần', '17120d02-6ab5-3e43-18cb-66948daf6128', 'PB-9483', 'Phòng đào tạo', 0, '2002-06-09', 'giám đốc', NULL, '0912313', NULL, '91', NULL, NULL, NULL, NULL, NULL, NULL, 'sdfaodfidjsàkldfjdlkàksdjấlfjdáklfjsalkdfjalksfdjlskjfdlsakjfdlạ', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-29 13:36:31', 'USER ADD', NULL, NULL),
('fbba8eeb-7261-4bb3-a911-498d2d39027f', 'NV-1044', 'Stevy Canas', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2020-11-01', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000036.0000, 37.0000, 4725036.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 36, '25447', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '8114 Elmside Crossing', NULL, NULL, 'scanas12@theglobeandmail.com', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('fce0a146-eedb-4a46-bf40-becd2ca0bbb8', 'NV-1054', 'Julie Crommett', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-04-16', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000046.0000, 47.0000, 4725046.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 46, '25457', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '4178 Dovetail Street', NULL, NULL, 'jcrommett1c@furl.net', '2023-07-28 17:55:43', 'TTANH Tạo mới', '2023-07-28 18:11:41', 'TTANH Cập nhật'),
('fced3276-87e8-4aa1-bcbb-4f1e40ed8a93', 'NV-1309', 'Locke Ireson', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2022-10-25', 'Nhân viên vip', NULL, '036202012169', '1990-04-10', 'Nam Định', NULL, NULL, 12000001.0000, 2.1000, 4725001.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 1, '25412', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '9256 Coolidge Point', '912945494', '912945494', 'lireson3@hostgator.com', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('fd7641d6-5fb2-4c13-a2c3-59c13f61ce7c', 'NV-1340', 'Sheilah Willcox', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-06-17', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000032.0000, 33.0000, 4725032.0000, '8956454525', 'Cư trú và không ký HĐLĐ/HĐLĐ dưới 3 tháng', 32, '25443', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '8002 Hagan Road', NULL, NULL, 'swillcoxy@japanpost.jp', '2023-07-29 13:48:57', 'TTANH Tạo mới', NULL, NULL),
('fed46eb0-af28-41a6-be27-e01c80857960', 'NV-1108', 'Raynard Jopke', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '2023-01-18', 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, 12000000.0000, 1.0000, 4725000.0000, '8956454525', 'Cư trú và không ký HĐLĐ/H', 0, '25411', 'Ngân hàng Á Châu', 'Hà Thành', 'Hà Nội', '9394 North Road', NULL, NULL, 'rjopke2@newyorker.com', '2023-07-28 18:12:27', 'TTANH Tạo mới', NULL, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `employeelayout`
--

CREATE TABLE `employeelayout` (
  `EmployeeLayoutId` char(36) NOT NULL COMMENT 'Khóa chính theo Guid.',
  `ServerColumnName` varchar(255) NOT NULL COMMENT 'Tên của cột trên server để lấy dữ liệu từ api.',
  `ClientColumnName` varchar(255) NOT NULL COMMENT 'Tên cột hiển thị trên màn hình.',
  `ColumnWidth` int(11) NOT NULL COMMENT 'Kích thước cột hiển thị trên màn hình.',
  `ColumnTextAlign` varchar(255) NOT NULL COMMENT 'Loại căn giữa của cột hiển thị trên màn hình (center - căn giữa; left - căn trái; right - căn phải)',
  `ColumnFormat` varchar(255) NOT NULL COMMENT 'Loại format của các phần tử trong cột (text - chữ; date - ngày tháng; currency - tiền tệ)',
  `ColumnIsShow` tinyint(1) NOT NULL COMMENT 'Xác định xem cột này có được hiển thị không.',
  `ColumnIsPin` tinyint(1) NOT NULL COMMENT 'Xác định xem cột có được ghim không.'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci COMMENT='Lưu trữ thông tin bố cục của phân hệ quản lý nhân viên.';

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangfireaggregatedcounter`
--

CREATE TABLE `hangfireaggregatedcounter` (
  `Id` int(11) NOT NULL,
  `Key` varchar(100) NOT NULL,
  `Value` int(11) NOT NULL,
  `ExpireAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hangfireaggregatedcounter`
--

INSERT INTO `hangfireaggregatedcounter` (`Id`, `Key`, `Value`, `ExpireAt`) VALUES
(1, 'stats:succeeded', 120, NULL),
(2, 'stats:succeeded:2023-07-24', 24, '2023-08-24 18:00:16'),
(27, 'stats:succeeded:2023-07-25', 16, '2023-08-25 15:00:28'),
(45, 'stats:succeeded:2023-07-26', 15, '2023-08-26 16:00:05'),
(62, 'stats:succeeded:2023-07-27', 24, '2023-08-27 16:05:10'),
(89, 'stats:succeeded:2023-07-28', 15, '2023-08-28 13:50:13'),
(106, 'stats:succeeded:2023-07-29', 13, '2023-08-29 07:00:25'),
(118, 'stats:succeeded:2023-07-29-06', 2, '2023-07-30 06:50:14'),
(120, 'stats:succeeded:2023-07-29-07', 1, '2023-07-30 07:00:25'),
(121, 'stats:succeeded:2023-07-30', 13, '2023-08-30 07:00:33'),
(122, 'stats:succeeded:2023-07-30-01', 2, '2023-07-31 01:51:12'),
(124, 'stats:succeeded:2023-07-30-02', 2, '2023-07-31 02:50:46'),
(126, 'stats:succeeded:2023-07-30-03', 2, '2023-07-31 03:50:48'),
(128, 'stats:succeeded:2023-07-30-04', 2, '2023-07-31 04:50:28'),
(130, 'stats:succeeded:2023-07-30-05', 2, '2023-07-31 05:50:10'),
(132, 'stats:succeeded:2023-07-30-06', 2, '2023-07-31 06:50:02'),
(134, 'stats:succeeded:2023-07-30-07', 1, '2023-07-31 07:00:33');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangfirecounter`
--

CREATE TABLE `hangfirecounter` (
  `Id` int(11) NOT NULL,
  `Key` varchar(100) NOT NULL,
  `Value` int(11) NOT NULL,
  `ExpireAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangfiredistributedlock`
--

CREATE TABLE `hangfiredistributedlock` (
  `Resource` varchar(100) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangfirehash`
--

CREATE TABLE `hangfirehash` (
  `Id` int(11) NOT NULL,
  `Key` varchar(100) NOT NULL,
  `Field` varchar(40) NOT NULL,
  `Value` longtext DEFAULT NULL,
  `ExpireAt` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hangfirehash`
--

INSERT INTO `hangfirehash` (`Id`, `Key`, `Field`, `Value`, `ExpireAt`) VALUES
(1, 'recurring-job:IScheduleService.ClearFiles', 'Queue', 'default', NULL),
(2, 'recurring-job:IScheduleService.ClearFiles', 'Cron', '*/50 * * * *', NULL),
(3, 'recurring-job:IScheduleService.ClearFiles', 'TimeZoneId', 'UTC', NULL),
(4, 'recurring-job:IScheduleService.ClearFiles', 'Job', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', NULL),
(5, 'recurring-job:IScheduleService.ClearFiles', 'CreatedAt', '2023-07-24T06:39:48.3311497Z', NULL),
(6, 'recurring-job:IScheduleService.ClearFiles', 'NextExecution', '2023-07-30T07:50:00.0000000Z', NULL),
(7, 'recurring-job:IScheduleService.ClearFiles', 'V', '2', NULL),
(8, 'recurring-job:IScheduleService.ClearFiles', 'LastExecution', '2023-07-30T07:00:30.6184213Z', NULL),
(10, 'recurring-job:IScheduleService.ClearFiles', 'LastJobId', '120', NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangfirejob`
--

CREATE TABLE `hangfirejob` (
  `Id` int(11) NOT NULL,
  `StateId` int(11) DEFAULT NULL,
  `StateName` varchar(20) DEFAULT NULL,
  `InvocationData` longtext NOT NULL,
  `Arguments` longtext NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `ExpireAt` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hangfirejob`
--

INSERT INTO `hangfirejob` (`Id`, `StateId`, `StateName`, `InvocationData`, `Arguments`, `CreatedAt`, `ExpireAt`) VALUES
(106, 318, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-29 06:50:06.751449', '2023-07-30 06:50:14.990573'),
(107, 321, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-29 07:00:22.468555', '2023-07-30 07:00:25.512341'),
(108, 324, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-30 01:46:22.528086', '2023-07-31 01:46:32.593733'),
(109, 327, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-30 01:51:07.919646', '2023-07-31 01:51:12.843111'),
(110, 330, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-30 02:00:07.269524', '2023-07-31 02:00:13.424637'),
(111, 333, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-30 02:50:40.374254', '2023-07-31 02:50:46.303404'),
(112, 336, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-30 03:00:12.332185', '2023-07-31 03:00:16.844361'),
(113, 339, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-30 03:50:38.295329', '2023-07-31 03:50:48.230616'),
(114, 342, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-30 04:20:46.647826', '2023-07-31 04:20:56.658769'),
(115, 345, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-30 04:50:18.412936', '2023-07-31 04:50:28.310127'),
(116, 348, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-30 05:00:49.046651', '2023-07-31 05:00:58.855477'),
(117, 351, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-30 05:50:00.676766', '2023-07-31 05:50:10.364228'),
(118, 354, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-30 06:00:46.481393', '2023-07-31 06:00:46.951704'),
(119, 357, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-30 06:50:00.040693', '2023-07-31 06:50:02.589041'),
(120, 360, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-30 07:00:30.623945', '2023-07-31 07:00:33.253530');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangfirejobparameter`
--

CREATE TABLE `hangfirejobparameter` (
  `Id` int(11) NOT NULL,
  `JobId` int(11) NOT NULL,
  `Name` varchar(40) NOT NULL,
  `Value` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hangfirejobparameter`
--

INSERT INTO `hangfirejobparameter` (`Id`, `JobId`, `Name`, `Value`) VALUES
(421, 106, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(422, 106, 'Time', '1690613406'),
(423, 106, 'CurrentCulture', '\"en-US\"'),
(424, 106, 'CurrentUICulture', '\"en-US\"'),
(425, 107, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(426, 107, 'Time', '1690614022'),
(427, 107, 'CurrentCulture', '\"en-US\"'),
(428, 107, 'CurrentUICulture', '\"en-US\"'),
(429, 108, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(430, 108, 'Time', '1690681582'),
(431, 108, 'CurrentCulture', '\"en-US\"'),
(432, 108, 'CurrentUICulture', '\"en-US\"'),
(433, 109, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(434, 109, 'Time', '1690681867'),
(435, 109, 'CurrentCulture', '\"en-US\"'),
(436, 109, 'CurrentUICulture', '\"en-US\"'),
(437, 110, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(438, 110, 'Time', '1690682407'),
(439, 110, 'CurrentCulture', '\"en-US\"'),
(440, 110, 'CurrentUICulture', '\"en-US\"'),
(441, 111, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(442, 111, 'Time', '1690685440'),
(443, 111, 'CurrentCulture', '\"en-US\"'),
(444, 111, 'CurrentUICulture', '\"en-US\"'),
(445, 112, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(446, 112, 'Time', '1690686012'),
(447, 112, 'CurrentCulture', '\"en-US\"'),
(448, 112, 'CurrentUICulture', '\"en-US\"'),
(449, 113, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(450, 113, 'Time', '1690689038'),
(451, 113, 'CurrentCulture', '\"en-US\"'),
(452, 113, 'CurrentUICulture', '\"en-US\"'),
(453, 114, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(454, 114, 'Time', '1690690846'),
(455, 114, 'CurrentCulture', '\"en-US\"'),
(456, 114, 'CurrentUICulture', '\"en-US\"'),
(457, 115, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(458, 115, 'Time', '1690692618'),
(459, 115, 'CurrentCulture', '\"en-US\"'),
(460, 115, 'CurrentUICulture', '\"en-US\"'),
(461, 116, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(462, 116, 'Time', '1690693249'),
(463, 116, 'CurrentCulture', '\"en-US\"'),
(464, 116, 'CurrentUICulture', '\"en-US\"'),
(465, 117, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(466, 117, 'Time', '1690696200'),
(467, 117, 'CurrentCulture', '\"en-US\"'),
(468, 117, 'CurrentUICulture', '\"en-US\"'),
(469, 118, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(470, 118, 'Time', '1690696846'),
(471, 118, 'CurrentCulture', '\"en-US\"'),
(472, 118, 'CurrentUICulture', '\"en-US\"'),
(473, 119, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(474, 119, 'Time', '1690699800'),
(475, 119, 'CurrentCulture', '\"en-US\"'),
(476, 119, 'CurrentUICulture', '\"en-US\"'),
(477, 120, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(478, 120, 'Time', '1690700430'),
(479, 120, 'CurrentCulture', '\"en-US\"'),
(480, 120, 'CurrentUICulture', '\"en-US\"');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangfirejobqueue`
--

CREATE TABLE `hangfirejobqueue` (
  `Id` int(11) NOT NULL,
  `JobId` int(11) NOT NULL,
  `FetchedAt` datetime(6) DEFAULT NULL,
  `Queue` varchar(50) NOT NULL,
  `FetchToken` varchar(36) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangfirejobstate`
--

CREATE TABLE `hangfirejobstate` (
  `Id` int(11) NOT NULL,
  `JobId` int(11) NOT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Reason` varchar(100) DEFAULT NULL,
  `Data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangfirelist`
--

CREATE TABLE `hangfirelist` (
  `Id` int(11) NOT NULL,
  `Key` varchar(100) NOT NULL,
  `Value` longtext DEFAULT NULL,
  `ExpireAt` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangfireserver`
--

CREATE TABLE `hangfireserver` (
  `Id` varchar(100) NOT NULL,
  `Data` longtext NOT NULL,
  `LastHeartbeat` datetime(6) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hangfireserver`
--

INSERT INTO `hangfireserver` (`Id`, `Data`, `LastHeartbeat`) VALUES
('trtheanh:23904:281881c2-7f2f-4537-97bd-d7a323286299', '{\"WorkerCount\":20,\"Queues\":[\"default\"],\"StartedAt\":\"2023-07-30T05:14:38.3818411Z\"}', '2023-07-30 07:09:11.320565');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangfireset`
--

CREATE TABLE `hangfireset` (
  `Id` int(11) NOT NULL,
  `Key` varchar(100) NOT NULL,
  `Value` varchar(256) NOT NULL,
  `Score` float NOT NULL,
  `ExpireAt` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hangfireset`
--

INSERT INTO `hangfireset` (`Id`, `Key`, `Value`, `Score`, `ExpireAt`) VALUES
(1, 'recurring-jobs', 'IScheduleService.ClearFiles', 1690700000, NULL);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hangfirestate`
--

CREATE TABLE `hangfirestate` (
  `Id` int(11) NOT NULL,
  `JobId` int(11) NOT NULL,
  `Name` varchar(20) NOT NULL,
  `Reason` varchar(100) DEFAULT NULL,
  `CreatedAt` datetime(6) NOT NULL,
  `Data` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_general_ci;

--
-- Đang đổ dữ liệu cho bảng `hangfirestate`
--

INSERT INTO `hangfirestate` (`Id`, `JobId`, `Name`, `Reason`, `CreatedAt`, `Data`) VALUES
(316, 106, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-29 06:50:06.780224', '{\"EnqueuedAt\":\"2023-07-29T06:50:06.7731945Z\",\"Queue\":\"default\"}'),
(317, 106, 'Processing', NULL, '2023-07-29 06:50:14.948237', '{\"StartedAt\":\"2023-07-29T06:50:14.9366596Z\",\"ServerId\":\"trtheanh:20348:fdd7c6d5-b151-47b7-9bff-337980e4b130\",\"WorkerId\":\"e173cb4d-8f3d-4513-a15d-90d5b3b18019\"}'),
(318, 106, 'Succeeded', NULL, '2023-07-29 06:50:14.983151', '{\"SucceededAt\":\"2023-07-29T06:50:14.9711565Z\",\"PerformanceDuration\":\"8\",\"Latency\":\"8211\"}'),
(319, 107, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-29 07:00:22.477133', '{\"EnqueuedAt\":\"2023-07-29T07:00:22.4763783Z\",\"Queue\":\"default\"}'),
(320, 107, 'Processing', NULL, '2023-07-29 07:00:25.500521', '{\"StartedAt\":\"2023-07-29T07:00:25.4980466Z\",\"ServerId\":\"trtheanh:20348:fdd7c6d5-b151-47b7-9bff-337980e4b130\",\"WorkerId\":\"f19da77f-158f-4dc6-b0f0-38757904b2ee\"}'),
(321, 107, 'Succeeded', NULL, '2023-07-29 07:00:25.510150', '{\"SucceededAt\":\"2023-07-29T07:00:25.5062931Z\",\"PerformanceDuration\":\"1\",\"Latency\":\"3036\"}'),
(322, 108, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-30 01:46:22.590221', '{\"EnqueuedAt\":\"2023-07-30T01:46:22.5723583Z\",\"Queue\":\"default\"}'),
(323, 108, 'Processing', NULL, '2023-07-30 01:46:32.545228', '{\"StartedAt\":\"2023-07-30T01:46:32.5313842Z\",\"ServerId\":\"trtheanh:26412:678235d6-f5cd-4615-927b-10acbe8aba1b\",\"WorkerId\":\"3c2d5123-7460-44dd-8b7e-0378619067a8\"}'),
(324, 108, 'Succeeded', NULL, '2023-07-30 01:46:32.586737', '{\"SucceededAt\":\"2023-07-30T01:46:32.5697733Z\",\"PerformanceDuration\":\"11\",\"Latency\":\"10029\"}'),
(325, 109, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-30 01:51:07.934215', '{\"EnqueuedAt\":\"2023-07-30T01:51:07.9332064Z\",\"Queue\":\"default\"}'),
(326, 109, 'Processing', NULL, '2023-07-30 01:51:12.826207', '{\"StartedAt\":\"2023-07-30T01:51:12.8218618Z\",\"ServerId\":\"trtheanh:26412:678235d6-f5cd-4615-927b-10acbe8aba1b\",\"WorkerId\":\"363247cf-64b0-4561-b2fd-71dcbfcaf0b6\"}'),
(327, 109, 'Succeeded', NULL, '2023-07-30 01:51:12.842255', '{\"SucceededAt\":\"2023-07-30T01:51:12.8359888Z\",\"PerformanceDuration\":\"1\",\"Latency\":\"4914\"}'),
(328, 110, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-30 02:00:07.285710', '{\"EnqueuedAt\":\"2023-07-30T02:00:07.2846954Z\",\"Queue\":\"default\"}'),
(329, 110, 'Processing', NULL, '2023-07-30 02:00:13.402363', '{\"StartedAt\":\"2023-07-30T02:00:13.3976030Z\",\"ServerId\":\"trtheanh:26412:678235d6-f5cd-4615-927b-10acbe8aba1b\",\"WorkerId\":\"421de2b1-1249-4c70-8836-186f6e19fdf4\"}'),
(330, 110, 'Succeeded', NULL, '2023-07-30 02:00:13.418512', '{\"SucceededAt\":\"2023-07-30T02:00:13.4126147Z\",\"PerformanceDuration\":\"1\",\"Latency\":\"6141\"}'),
(331, 111, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-30 02:50:40.381293', '{\"EnqueuedAt\":\"2023-07-30T02:50:40.3804782Z\",\"Queue\":\"default\"}'),
(332, 111, 'Processing', NULL, '2023-07-30 02:50:46.284947', '{\"StartedAt\":\"2023-07-30T02:50:46.2815558Z\",\"ServerId\":\"trtheanh:26412:678235d6-f5cd-4615-927b-10acbe8aba1b\",\"WorkerId\":\"5ce4ff5f-b35e-475f-bb60-54351f09c170\"}'),
(333, 111, 'Succeeded', NULL, '2023-07-30 02:50:46.301081', '{\"SucceededAt\":\"2023-07-30T02:50:46.2914594Z\",\"PerformanceDuration\":\"1\",\"Latency\":\"5915\"}'),
(334, 112, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-30 03:00:12.347451', '{\"EnqueuedAt\":\"2023-07-30T03:00:12.3465704Z\",\"Queue\":\"default\"}'),
(335, 112, 'Processing', NULL, '2023-07-30 03:00:16.822143', '{\"StartedAt\":\"2023-07-30T03:00:16.8165956Z\",\"ServerId\":\"trtheanh:26412:678235d6-f5cd-4615-927b-10acbe8aba1b\",\"WorkerId\":\"382887b6-ddc7-4be7-925d-dc648c5645c1\"}'),
(336, 112, 'Succeeded', NULL, '2023-07-30 03:00:16.839165', '{\"SucceededAt\":\"2023-07-30T03:00:16.8333629Z\",\"PerformanceDuration\":\"2\",\"Latency\":\"4498\"}'),
(337, 113, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-30 03:50:38.328146', '{\"EnqueuedAt\":\"2023-07-30T03:50:38.3115898Z\",\"Queue\":\"default\"}'),
(338, 113, 'Processing', NULL, '2023-07-30 03:50:48.204738', '{\"StartedAt\":\"2023-07-30T03:50:48.1944762Z\",\"ServerId\":\"trtheanh:11556:e21b9dae-cd94-47f7-9090-17e9395e7b80\",\"WorkerId\":\"8914a3cf-0232-4ed6-816c-ea933531ef31\"}'),
(339, 113, 'Succeeded', NULL, '2023-07-30 03:50:48.227796', '{\"SucceededAt\":\"2023-07-30T03:50:48.2173035Z\",\"PerformanceDuration\":\"7\",\"Latency\":\"9914\"}'),
(340, 114, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-30 04:20:46.674801', '{\"EnqueuedAt\":\"2023-07-30T04:20:46.6741954Z\",\"Queue\":\"default\"}'),
(341, 114, 'Processing', NULL, '2023-07-30 04:20:56.643444', '{\"StartedAt\":\"2023-07-30T04:20:56.6403943Z\",\"ServerId\":\"trtheanh:11556:7eddd9bc-4701-4588-9573-7826928c5319\",\"WorkerId\":\"2186e231-3fb4-4405-ad43-3ef0418675a8\"}'),
(342, 114, 'Succeeded', NULL, '2023-07-30 04:20:56.656441', '{\"SucceededAt\":\"2023-07-30T04:20:56.6485554Z\",\"PerformanceDuration\":\"1\",\"Latency\":\"9999\"}'),
(343, 115, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-30 04:50:18.424378', '{\"EnqueuedAt\":\"2023-07-30T04:50:18.4234512Z\",\"Queue\":\"default\"}'),
(344, 115, 'Processing', NULL, '2023-07-30 04:50:28.297655', '{\"StartedAt\":\"2023-07-30T04:50:28.2949614Z\",\"ServerId\":\"trtheanh:11556:7eddd9bc-4701-4588-9573-7826928c5319\",\"WorkerId\":\"f6e99660-1180-4e00-94a5-24ca81f75a03\"}'),
(345, 115, 'Succeeded', NULL, '2023-07-30 04:50:28.309523', '{\"SucceededAt\":\"2023-07-30T04:50:28.3043360Z\",\"PerformanceDuration\":\"1\",\"Latency\":\"9889\"}'),
(346, 116, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-30 05:00:49.054883', '{\"EnqueuedAt\":\"2023-07-30T05:00:49.0543468Z\",\"Queue\":\"default\"}'),
(347, 116, 'Processing', NULL, '2023-07-30 05:00:58.842927', '{\"StartedAt\":\"2023-07-30T05:00:58.8404011Z\",\"ServerId\":\"trtheanh:11556:7eddd9bc-4701-4588-9573-7826928c5319\",\"WorkerId\":\"68440acd-9d9a-46cf-bd18-e4c2fc182ad7\"}'),
(348, 116, 'Succeeded', NULL, '2023-07-30 05:00:58.853048', '{\"SucceededAt\":\"2023-07-30T05:00:58.8485580Z\",\"PerformanceDuration\":\"1\",\"Latency\":\"9800\"}'),
(349, 117, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-30 05:50:00.698796', '{\"EnqueuedAt\":\"2023-07-30T05:50:00.6921343Z\",\"Queue\":\"default\"}'),
(350, 117, 'Processing', NULL, '2023-07-30 05:50:10.337813', '{\"StartedAt\":\"2023-07-30T05:50:10.3277157Z\",\"ServerId\":\"trtheanh:23904:281881c2-7f2f-4537-97bd-d7a323286299\",\"WorkerId\":\"43a42d19-ac65-4d09-a57b-6085ab99715a\"}'),
(351, 117, 'Succeeded', NULL, '2023-07-30 05:50:10.360494', '{\"SucceededAt\":\"2023-07-30T05:50:10.3505741Z\",\"PerformanceDuration\":\"7\",\"Latency\":\"9665\"}'),
(352, 118, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-30 06:00:46.491840', '{\"EnqueuedAt\":\"2023-07-30T06:00:46.4911985Z\",\"Queue\":\"default\"}'),
(353, 118, 'Processing', NULL, '2023-07-30 06:00:46.941549', '{\"StartedAt\":\"2023-07-30T06:00:46.9386837Z\",\"ServerId\":\"trtheanh:23904:281881c2-7f2f-4537-97bd-d7a323286299\",\"WorkerId\":\"92157505-9dc5-4f3c-8f68-4a2f32c19a8e\"}'),
(354, 118, 'Succeeded', NULL, '2023-07-30 06:00:46.951075', '{\"SucceededAt\":\"2023-07-30T06:00:46.9466347Z\",\"PerformanceDuration\":\"1\",\"Latency\":\"463\"}'),
(355, 119, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-30 06:50:00.046419', '{\"EnqueuedAt\":\"2023-07-30T06:50:00.0458825Z\",\"Queue\":\"default\"}'),
(356, 119, 'Processing', NULL, '2023-07-30 06:50:02.579514', '{\"StartedAt\":\"2023-07-30T06:50:02.5769018Z\",\"ServerId\":\"trtheanh:23904:281881c2-7f2f-4537-97bd-d7a323286299\",\"WorkerId\":\"6ad76061-56e0-4951-ae23-2461a37520a6\"}'),
(357, 119, 'Succeeded', NULL, '2023-07-30 06:50:02.588394', '{\"SucceededAt\":\"2023-07-30T06:50:02.5841242Z\",\"PerformanceDuration\":\"1\",\"Latency\":\"2541\"}'),
(358, 120, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-30 07:00:30.637015', '{\"EnqueuedAt\":\"2023-07-30T07:00:30.6353268Z\",\"Queue\":\"default\"}'),
(359, 120, 'Processing', NULL, '2023-07-30 07:00:33.234832', '{\"StartedAt\":\"2023-07-30T07:00:33.2308972Z\",\"ServerId\":\"trtheanh:23904:281881c2-7f2f-4537-97bd-d7a323286299\",\"WorkerId\":\"6ad76061-56e0-4951-ae23-2461a37520a6\"}'),
(360, 120, 'Succeeded', NULL, '2023-07-30 07:00:33.250620', '{\"SucceededAt\":\"2023-07-30T07:00:33.2435368Z\",\"PerformanceDuration\":\"3\",\"Latency\":\"2616\"}');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `department`
--
ALTER TABLE `department`
  ADD PRIMARY KEY (`DepartmentId`),
  ADD UNIQUE KEY `UK_department_DepartmentCode` (`DepartmentCode`),
  ADD KEY `IDX_department_DepartmentName` (`DepartmentName`);

--
-- Chỉ mục cho bảng `employee`
--
ALTER TABLE `employee`
  ADD PRIMARY KEY (`EmployeeId`),
  ADD UNIQUE KEY `UK_employee_EmployeeCode` (`EmployeeCode`),
  ADD KEY `FK_employee_DepartmentId` (`DepartmentId`),
  ADD KEY `IDX_employee_EmployeeName` (`FullName`);

--
-- Chỉ mục cho bảng `employeelayout`
--
ALTER TABLE `employeelayout`
  ADD PRIMARY KEY (`EmployeeLayoutId`),
  ADD UNIQUE KEY `UK_EmployeeLayout_EmployeeLayoutId` (`EmployeeLayoutId`);

--
-- Chỉ mục cho bảng `hangfireaggregatedcounter`
--
ALTER TABLE `hangfireaggregatedcounter`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `IX_HangfireCounterAggregated_Key` (`Key`);

--
-- Chỉ mục cho bảng `hangfirecounter`
--
ALTER TABLE `hangfirecounter`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_HangfireCounter_Key` (`Key`);

--
-- Chỉ mục cho bảng `hangfirehash`
--
ALTER TABLE `hangfirehash`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `IX_HangfireHash_Key_Field` (`Key`,`Field`);

--
-- Chỉ mục cho bảng `hangfirejob`
--
ALTER TABLE `hangfirejob`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_HangfireJob_StateName` (`StateName`);

--
-- Chỉ mục cho bảng `hangfirejobparameter`
--
ALTER TABLE `hangfirejobparameter`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `IX_HangfireJobParameter_JobId_Name` (`JobId`,`Name`),
  ADD KEY `FK_HangfireJobParameter_Job` (`JobId`);

--
-- Chỉ mục cho bảng `hangfirejobqueue`
--
ALTER TABLE `hangfirejobqueue`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `IX_HangfireJobQueue_QueueAndFetchedAt` (`Queue`,`FetchedAt`);

--
-- Chỉ mục cho bảng `hangfirejobstate`
--
ALTER TABLE `hangfirejobstate`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_HangfireJobState_Job` (`JobId`);

--
-- Chỉ mục cho bảng `hangfirelist`
--
ALTER TABLE `hangfirelist`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `hangfireserver`
--
ALTER TABLE `hangfireserver`
  ADD PRIMARY KEY (`Id`);

--
-- Chỉ mục cho bảng `hangfireset`
--
ALTER TABLE `hangfireset`
  ADD PRIMARY KEY (`Id`),
  ADD UNIQUE KEY `IX_HangfireSet_Key_Value` (`Key`,`Value`);

--
-- Chỉ mục cho bảng `hangfirestate`
--
ALTER TABLE `hangfirestate`
  ADD PRIMARY KEY (`Id`),
  ADD KEY `FK_HangfireHangFire_State_Job` (`JobId`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `hangfireaggregatedcounter`
--
ALTER TABLE `hangfireaggregatedcounter`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=135;

--
-- AUTO_INCREMENT cho bảng `hangfirecounter`
--
ALTER TABLE `hangfirecounter`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=361;

--
-- AUTO_INCREMENT cho bảng `hangfirehash`
--
ALTER TABLE `hangfirehash`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=368;

--
-- AUTO_INCREMENT cho bảng `hangfirejob`
--
ALTER TABLE `hangfirejob`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT cho bảng `hangfirejobparameter`
--
ALTER TABLE `hangfirejobparameter`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=481;

--
-- AUTO_INCREMENT cho bảng `hangfirejobqueue`
--
ALTER TABLE `hangfirejobqueue`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;

--
-- AUTO_INCREMENT cho bảng `hangfirejobstate`
--
ALTER TABLE `hangfirejobstate`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hangfirelist`
--
ALTER TABLE `hangfirelist`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `hangfireset`
--
ALTER TABLE `hangfireset`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=157375;

--
-- AUTO_INCREMENT cho bảng `hangfirestate`
--
ALTER TABLE `hangfirestate`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=361;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `employee`
--
ALTER TABLE `employee`
  ADD CONSTRAINT `FK_employee_DepartmentId` FOREIGN KEY (`DepartmentId`) REFERENCES `department` (`DepartmentId`) ON DELETE NO ACTION;

--
-- Các ràng buộc cho bảng `hangfirejobparameter`
--
ALTER TABLE `hangfirejobparameter`
  ADD CONSTRAINT `FK_HangfireJobParameter_Job` FOREIGN KEY (`JobId`) REFERENCES `hangfirejob` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `hangfirejobstate`
--
ALTER TABLE `hangfirejobstate`
  ADD CONSTRAINT `FK_HangfireJobState_Job` FOREIGN KEY (`JobId`) REFERENCES `hangfirejob` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Các ràng buộc cho bảng `hangfirestate`
--
ALTER TABLE `hangfirestate`
  ADD CONSTRAINT `FK_HangfireHangFire_State_Job` FOREIGN KEY (`JobId`) REFERENCES `hangfirejob` (`Id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
