-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 28, 2023 lúc 03:45 AM
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
          OR e.PersonalTaxCode LIKE CONCAT('%', searchText, '%') 
          OR e.TypeOfContract LIKE CONCAT('%', searchText, '%') 
          OR e.AccountNumber LIKE CONCAT('%', searchText, '%') 
          OR e.BankName LIKE CONCAT('%', searchText, '%') 
          OR e.BankBranch LIKE CONCAT('%', searchText, '%') 
          OR e.BankProvince LIKE CONCAT('%', searchText, '%') 
          OR e.ContactAddress LIKE CONCAT('%', searchText, '%') 
          OR e.ContactPhoneNumber LIKE CONCAT('%', searchText, '%') 
          OR e.ContactLandlinePhoneNumber LIKE CONCAT('%', searchText, '%') 
          OR e.ContactEmail LIKE CONCAT('%', searchText, '%')
         )
    )
  ORDER BY GREATEST(COALESCE(e.ModifiedDate, '0000-00-00'), e.CreatedDate) DESC
  LIMIT startIndex, pageSize;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Employee_Insert` (IN `EmployeeId` CHAR(36), IN `EmployeeCode` VARCHAR(20), IN `FullName` VARCHAR(100), IN `DepartmentId` CHAR(36), IN `DepartmentCode` VARCHAR(20), IN `DepartmentName` VARCHAR(255), IN `Gender` INT(2), IN `DateOfBirth` DATE, IN `Position` VARCHAR(100), IN `SupplierCustomerGroup` VARCHAR(255), IN `IdentityNumber` VARCHAR(25), IN `IdentityDate` DATE, IN `IdentityPlace` VARCHAR(255), IN `PayAccount` VARCHAR(100), IN `ReceiveAccount` VARCHAR(100), IN `Salary` DECIMAL(18,4), IN `SalaryCoefficients` DECIMAL(18,4), IN `SalaryPaidForInsurance` DECIMAL(18,4), IN `PersonalTaxCode` VARCHAR(25), IN `TypeOfContract` VARCHAR(25), IN `NumberOfDependents` INT(10), IN `AccountNumber` VARCHAR(25), IN `BankName` VARCHAR(255), IN `BankBranch` VARCHAR(255), IN `BankProvince` VARCHAR(255), IN `ContactAddress` VARCHAR(255), IN `ContactPhoneNumber` VARCHAR(50), IN `ContactLandlinePhoneNumber` VARCHAR(50), IN `ContactEmail` VARCHAR(100), IN `CreatedDate` DATETIME, IN `CreatedBy` VARCHAR(100))  SQL SECURITY INVOKER COMMENT 'Procedure thêm nhân viên.' BEGIN
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

CREATE DEFINER=`root`@`localhost` PROCEDURE `Proc_Employee_Update` (IN `EmployeeId` CHAR(36), IN `EmployeeCode` VARCHAR(20), IN `FullName` VARCHAR(100), IN `DepartmentId` CHAR(36), IN `DepartmentCode` VARCHAR(20), IN `DepartmentName` VARCHAR(255), IN `Gender` INT(2), IN `DateOfBirth` DATE, IN `Position` VARCHAR(100), IN `SupplierCustomerGroup` VARCHAR(255), IN `IdentityNumber` VARCHAR(25), IN `IdentityDate` DATE, IN `IdentityPlace` VARCHAR(255), IN `PayAccount` VARCHAR(100), IN `ReceiveAccount` VARCHAR(100), IN `Salary` DECIMAL(18,4), IN `SalaryCoefficients` DECIMAL(18,4), IN `SalaryPaidForInsurance` DECIMAL(18,4), IN `PersonalTaxCode` VARCHAR(25), IN `TypeOfContract` VARCHAR(25), IN `NumberOfDependents` INT(10), IN `AccountNumber` VARCHAR(25), IN `BankName` VARCHAR(255), IN `BankBranch` VARCHAR(255), IN `BankProvince` VARCHAR(255), IN `ContactAddress` VARCHAR(255), IN `ContactPhoneNumber` VARCHAR(50), IN `ContactLandlinePhoneNumber` VARCHAR(50), IN `ContactEmail` VARCHAR(100), IN `ModifiedDate` DATETIME, IN `ModifiedBy` VARCHAR(255), IN `id` CHAR(36))  MODIFIES SQL DATA SQL SECURITY INVOKER COMMENT 'Procedure cập nhật thông tin nhân viên.' BEGIN
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
  `TypeOfContract` varchar(25) DEFAULT NULL COMMENT 'Loại hợp đồng',
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
('5b0d605c-dfdb-478f-bfd6-e64ee54a906c', 'NV-1006', 'Nguyễn Hoàng Nam Update', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 0, NULL, 'Giám đốc Update', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-27 23:11:05', 'TTANH Tạo mới', '2023-07-28 08:40:03', 'TTANH Cập nhật'),
('62d3d2df-29aa-4ef6-b68e-252af5296c49', 'NV-1009', 'Phạm Thị Hoàn', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, '1989-04-10', 'Nhân viên', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-28 08:29:46', 'TTANH Tạo mới', NULL, NULL),
('970ff914-db29-4950-9964-952c35f3e5ba', 'NV-1007', 'Phan Đức Lâm Update', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 0, NULL, 'Nhân viên Update', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-27 23:11:05', 'TTANH Tạo mới', '2023-07-28 08:40:03', 'TTANH Cập nhật'),
('e3ea1b04-0478-4721-bf48-8a64d41d0dc6', 'NV-1008', 'Phạm Thị Hoàn', '469b3ece-744a-45d5-957d-e8c757976496', 'PB-5222', 'Phòng sản xuất', 1, NULL, 'Nhân viên vip', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '2023-07-27 23:11:05', 'TTANH Tạo mới', '2023-07-28 08:40:03', 'TTANH Cập nhật');

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
(1, 'stats:succeeded', 81, NULL),
(2, 'stats:succeeded:2023-07-24', 24, '2023-08-24 18:00:16'),
(27, 'stats:succeeded:2023-07-25', 16, '2023-08-25 15:00:28'),
(45, 'stats:succeeded:2023-07-26', 15, '2023-08-26 16:00:05'),
(62, 'stats:succeeded:2023-07-27', 24, '2023-08-27 16:05:10'),
(66, 'stats:succeeded:2023-07-27-01', 2, '2023-07-28 01:51:11'),
(68, 'stats:succeeded:2023-07-27-02', 2, '2023-07-28 02:50:55'),
(70, 'stats:succeeded:2023-07-27-03', 2, '2023-07-28 03:50:38'),
(72, 'stats:succeeded:2023-07-27-04', 2, '2023-07-28 04:50:21'),
(74, 'stats:succeeded:2023-07-27-06', 2, '2023-07-28 06:50:18'),
(76, 'stats:succeeded:2023-07-27-07', 1, '2023-07-28 07:00:29'),
(77, 'stats:succeeded:2023-07-27-08', 1, '2023-07-28 08:58:11'),
(78, 'stats:succeeded:2023-07-27-09', 2, '2023-07-28 09:51:13'),
(81, 'stats:succeeded:2023-07-27-10', 1, '2023-07-28 10:00:13'),
(82, 'stats:succeeded:2023-07-27-13', 2, '2023-07-28 13:50:05'),
(84, 'stats:succeeded:2023-07-27-14', 2, '2023-07-28 14:55:56'),
(86, 'stats:succeeded:2023-07-27-15', 2, '2023-07-28 15:50:04'),
(88, 'stats:succeeded:2023-07-27-16', 1, '2023-07-28 16:05:10'),
(89, 'stats:succeeded:2023-07-28', 2, '2023-08-28 01:17:21'),
(90, 'stats:succeeded:2023-07-28-00', 1, '2023-07-29 00:15:48'),
(92, 'stats:succeeded:2023-07-28-01', 1, '2023-07-29 01:17:21');

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
(6, 'recurring-job:IScheduleService.ClearFiles', 'NextExecution', '2023-07-28T01:50:00.0000000Z', NULL),
(7, 'recurring-job:IScheduleService.ClearFiles', 'V', '2', NULL),
(8, 'recurring-job:IScheduleService.ClearFiles', 'LastExecution', '2023-07-28T01:17:11.0340118Z', NULL),
(10, 'recurring-job:IScheduleService.ClearFiles', 'LastJobId', '81', NULL);

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
(59, 177, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 01:51:01.963981', '2023-07-28 01:51:11.817455'),
(60, 180, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 02:00:12.142957', '2023-07-28 02:00:12.253381'),
(61, 183, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 02:50:45.193627', '2023-07-28 02:50:55.095663'),
(62, 186, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 03:00:10.370807', '2023-07-28 03:00:15.545168'),
(63, 189, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 03:50:28.360280', '2023-07-28 03:50:38.014121'),
(64, 192, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 04:01:13.974515', '2023-07-28 04:01:18.514905'),
(65, 195, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 04:50:16.922908', '2023-07-28 04:50:21.013250'),
(66, 198, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 06:27:30.421434', '2023-07-28 06:27:39.555184'),
(67, 201, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 06:50:11.127086', '2023-07-28 06:50:18.094675'),
(68, 204, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 07:00:24.780416', '2023-07-28 07:00:29.818034'),
(69, 207, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 08:58:01.502771', '2023-07-28 08:58:11.547806'),
(70, 210, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 09:00:04.888082', '2023-07-28 09:00:11.633537'),
(71, 213, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 09:51:08.113468', '2023-07-28 09:51:13.156387'),
(72, 216, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 10:00:04.729084', '2023-07-28 10:00:13.535508'),
(73, 219, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 13:36:49.792177', '2023-07-28 13:37:01.607829'),
(74, 222, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 13:50:01.612967', '2023-07-28 13:50:05.557130'),
(75, 225, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 14:00:32.329375', '2023-07-28 14:00:36.271638'),
(76, 228, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 14:55:29.710786', '2023-07-28 14:55:56.650435'),
(77, 231, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 15:02:28.161381', '2023-07-28 15:02:38.178606'),
(78, 234, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 15:50:03.007595', '2023-07-28 15:50:04.450779'),
(79, 237, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-27 16:05:00.361755', '2023-07-28 16:05:10.400049'),
(80, 240, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-28 00:15:38.641813', '2023-07-29 00:15:48.696943'),
(81, 243, 'Succeeded', '{\"Type\":\"MISA.WebFresher052023.CTM.Application.IScheduleService, MISA.WebFresher052023.CTM.Application\",\"Method\":\"ClearFiles\",\"ParameterTypes\":\"[\\\"System.String\\\"]\",\"Arguments\":\"[\\\"\\\\\\\"C:\\\\\\\\\\\\\\\\Users\\\\\\\\\\\\\\\\thean\\\\\\\\\\\\\\\\OneDrive\\\\\\\\\\\\\\\\Desktop\\\\\\\\\\\\\\\\misa\\\\\\\\\\\\\\\\web202305\\\\\\\\\\\\\\\\mf1666-ttanh\\\\\\\\\\\\\\\\aspnetcore\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\\\\\\\\\client-files\\\\\\\"\\\"]\"}', '[\"\\\"C:\\\\\\\\Users\\\\\\\\thean\\\\\\\\OneDrive\\\\\\\\Desktop\\\\\\\\misa\\\\\\\\web202305\\\\\\\\mf1666-ttanh\\\\\\\\aspnetcore\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\MISA.WebFresher052023.CTM\\\\\\\\client-files\\\"\"]', '2023-07-28 01:17:11.058017', '2023-07-29 01:17:21.087401');

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
(233, 59, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(234, 59, 'Time', '1690422661'),
(235, 59, 'CurrentCulture', '\"en-US\"'),
(236, 59, 'CurrentUICulture', '\"en-US\"'),
(237, 60, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(238, 60, 'Time', '1690423212'),
(239, 60, 'CurrentCulture', '\"en-US\"'),
(240, 60, 'CurrentUICulture', '\"en-US\"'),
(241, 61, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(242, 61, 'Time', '1690426245'),
(243, 61, 'CurrentCulture', '\"en-US\"'),
(244, 61, 'CurrentUICulture', '\"en-US\"'),
(245, 62, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(246, 62, 'Time', '1690426810'),
(247, 62, 'CurrentCulture', '\"en-US\"'),
(248, 62, 'CurrentUICulture', '\"en-US\"'),
(249, 63, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(250, 63, 'Time', '1690429828'),
(251, 63, 'CurrentCulture', '\"en-US\"'),
(252, 63, 'CurrentUICulture', '\"en-US\"'),
(253, 64, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(254, 64, 'Time', '1690430473'),
(255, 64, 'CurrentCulture', '\"en-US\"'),
(256, 64, 'CurrentUICulture', '\"en-US\"'),
(257, 65, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(258, 65, 'Time', '1690433416'),
(259, 65, 'CurrentCulture', '\"en-US\"'),
(260, 65, 'CurrentUICulture', '\"en-US\"'),
(261, 66, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(262, 66, 'Time', '1690439250'),
(263, 66, 'CurrentCulture', '\"en-US\"'),
(264, 66, 'CurrentUICulture', '\"en-US\"'),
(265, 67, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(266, 67, 'Time', '1690440611'),
(267, 67, 'CurrentCulture', '\"en-US\"'),
(268, 67, 'CurrentUICulture', '\"en-US\"'),
(269, 68, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(270, 68, 'Time', '1690441224'),
(271, 68, 'CurrentCulture', '\"en-US\"'),
(272, 68, 'CurrentUICulture', '\"en-US\"'),
(273, 69, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(274, 69, 'Time', '1690448281'),
(275, 69, 'CurrentCulture', '\"en-US\"'),
(276, 69, 'CurrentUICulture', '\"en-US\"'),
(277, 70, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(278, 70, 'Time', '1690448404'),
(279, 70, 'CurrentCulture', '\"en-US\"'),
(280, 70, 'CurrentUICulture', '\"en-US\"'),
(281, 71, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(282, 71, 'Time', '1690451468'),
(283, 71, 'CurrentCulture', '\"en-US\"'),
(284, 71, 'CurrentUICulture', '\"en-US\"'),
(285, 72, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(286, 72, 'Time', '1690452004'),
(287, 72, 'CurrentCulture', '\"en-US\"'),
(288, 72, 'CurrentUICulture', '\"en-US\"'),
(289, 73, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(290, 73, 'Time', '1690465009'),
(291, 73, 'CurrentCulture', '\"en-US\"'),
(292, 73, 'CurrentUICulture', '\"en-US\"'),
(293, 74, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(294, 74, 'Time', '1690465801'),
(295, 74, 'CurrentCulture', '\"en-US\"'),
(296, 74, 'CurrentUICulture', '\"en-US\"'),
(297, 75, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(298, 75, 'Time', '1690466432'),
(299, 75, 'CurrentCulture', '\"en-US\"'),
(300, 75, 'CurrentUICulture', '\"en-US\"'),
(301, 76, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(302, 76, 'Time', '1690469729'),
(303, 76, 'CurrentCulture', '\"en-US\"'),
(304, 76, 'CurrentUICulture', '\"en-US\"'),
(305, 77, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(306, 77, 'Time', '1690470148'),
(307, 77, 'CurrentCulture', '\"en-US\"'),
(308, 77, 'CurrentUICulture', '\"en-US\"'),
(309, 78, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(310, 78, 'Time', '1690473002'),
(311, 78, 'CurrentCulture', '\"en-US\"'),
(312, 78, 'CurrentUICulture', '\"en-US\"'),
(313, 79, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(314, 79, 'Time', '1690473900'),
(315, 79, 'CurrentCulture', '\"en-US\"'),
(316, 79, 'CurrentUICulture', '\"en-US\"'),
(317, 80, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(318, 80, 'Time', '1690503338'),
(319, 80, 'CurrentCulture', '\"en-US\"'),
(320, 80, 'CurrentUICulture', '\"en-US\"'),
(321, 81, 'RecurringJobId', '\"IScheduleService.ClearFiles\"'),
(322, 81, 'Time', '1690507031'),
(323, 81, 'CurrentCulture', '\"en-US\"'),
(324, 81, 'CurrentUICulture', '\"en-US\"');

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
('trtheanh:16196:d6c06306-435f-4a3c-8e83-c298070a36ab', '{\"WorkerCount\":20,\"Queues\":[\"default\"],\"StartedAt\":\"2023-07-28T01:39:52.2141925Z\"}', '2023-07-28 01:44:52.362277');

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
(1, 'recurring-jobs', 'IScheduleService.ClearFiles', 1690510000, NULL);

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
(175, 59, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 01:51:02.002147', '{\"EnqueuedAt\":\"2023-07-27T01:51:01.9820036Z\",\"Queue\":\"default\"}'),
(176, 59, 'Processing', NULL, '2023-07-27 01:51:11.788095', '{\"StartedAt\":\"2023-07-27T01:51:11.7789991Z\",\"ServerId\":\"trtheanh:22184:54684122-2000-46a7-9145-fccecddba5e9\",\"WorkerId\":\"4585166e-aebd-4352-bd17-c126457f308a\"}'),
(177, 59, 'Succeeded', NULL, '2023-07-27 01:51:11.813364', '{\"SucceededAt\":\"2023-07-27T01:51:11.8024997Z\",\"PerformanceDuration\":\"9\",\"Latency\":\"9828\"}'),
(178, 60, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 02:00:12.166562', '{\"EnqueuedAt\":\"2023-07-27T02:00:12.1656542Z\",\"Queue\":\"default\"}'),
(179, 60, 'Processing', NULL, '2023-07-27 02:00:12.229095', '{\"StartedAt\":\"2023-07-27T02:00:12.2240841Z\",\"ServerId\":\"trtheanh:22184:54684122-2000-46a7-9145-fccecddba5e9\",\"WorkerId\":\"7c04a24b-d352-49f5-b30f-61f4bfbdc6a7\"}'),
(180, 60, 'Succeeded', NULL, '2023-07-27 02:00:12.247429', '{\"SucceededAt\":\"2023-07-27T02:00:12.2403050Z\",\"PerformanceDuration\":\"2\",\"Latency\":\"95\"}'),
(181, 61, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 02:50:45.227671', '{\"EnqueuedAt\":\"2023-07-27T02:50:45.2101390Z\",\"Queue\":\"default\"}'),
(182, 61, 'Processing', NULL, '2023-07-27 02:50:55.058177', '{\"StartedAt\":\"2023-07-27T02:50:55.0471016Z\",\"ServerId\":\"trtheanh:20604:04a3b1be-53c2-4625-bcce-ca52861a4201\",\"WorkerId\":\"c815066b-133b-4a49-a1ef-36c548382bce\"}'),
(183, 61, 'Succeeded', NULL, '2023-07-27 02:50:55.090022', '{\"SucceededAt\":\"2023-07-27T02:50:55.0753551Z\",\"PerformanceDuration\":\"10\",\"Latency\":\"9871\"}'),
(184, 62, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 03:00:10.386678', '{\"EnqueuedAt\":\"2023-07-27T03:00:10.3856908Z\",\"Queue\":\"default\"}'),
(185, 62, 'Processing', NULL, '2023-07-27 03:00:15.513295', '{\"StartedAt\":\"2023-07-27T03:00:15.5080819Z\",\"ServerId\":\"trtheanh:20604:04a3b1be-53c2-4625-bcce-ca52861a4201\",\"WorkerId\":\"ce9c5c91-12ed-4741-95ae-e6a22f333d51\"}'),
(186, 62, 'Succeeded', NULL, '2023-07-27 03:00:15.533329', '{\"SucceededAt\":\"2023-07-27T03:00:15.5257512Z\",\"PerformanceDuration\":\"2\",\"Latency\":\"5152\"}'),
(187, 63, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 03:50:28.369936', '{\"EnqueuedAt\":\"2023-07-27T03:50:28.3690463Z\",\"Queue\":\"default\"}'),
(188, 63, 'Processing', NULL, '2023-07-27 03:50:38.000747', '{\"StartedAt\":\"2023-07-27T03:50:37.9975822Z\",\"ServerId\":\"trtheanh:20604:04a3b1be-53c2-4625-bcce-ca52861a4201\",\"WorkerId\":\"3774d74d-b743-432a-95a2-cd0024d4bfd4\"}'),
(189, 63, 'Succeeded', NULL, '2023-07-27 03:50:38.012057', '{\"SucceededAt\":\"2023-07-27T03:50:38.0076542Z\",\"PerformanceDuration\":\"3\",\"Latency\":\"9643\"}'),
(190, 64, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 04:01:13.983401', '{\"EnqueuedAt\":\"2023-07-27T04:01:13.9827442Z\",\"Queue\":\"default\"}'),
(191, 64, 'Processing', NULL, '2023-07-27 04:01:18.502088', '{\"StartedAt\":\"2023-07-27T04:01:18.4986419Z\",\"ServerId\":\"trtheanh:20604:04a3b1be-53c2-4625-bcce-ca52861a4201\",\"WorkerId\":\"8ba895d7-94d4-4c62-bb0c-a72c2b10f976\"}'),
(192, 64, 'Succeeded', NULL, '2023-07-27 04:01:18.512790', '{\"SucceededAt\":\"2023-07-27T04:01:18.5076542Z\",\"PerformanceDuration\":\"1\",\"Latency\":\"4531\"}'),
(193, 65, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 04:50:16.931199', '{\"EnqueuedAt\":\"2023-07-27T04:50:16.9304772Z\",\"Queue\":\"default\"}'),
(194, 65, 'Processing', NULL, '2023-07-27 04:50:21.002196', '{\"StartedAt\":\"2023-07-27T04:50:20.9989628Z\",\"ServerId\":\"trtheanh:20604:04a3b1be-53c2-4625-bcce-ca52861a4201\",\"WorkerId\":\"1aee99b7-2e79-4bad-bb07-733b8da0b76a\"}'),
(195, 65, 'Succeeded', NULL, '2023-07-27 04:50:21.011034', '{\"SucceededAt\":\"2023-07-27T04:50:21.0075203Z\",\"PerformanceDuration\":\"1\",\"Latency\":\"4082\"}'),
(196, 66, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 06:27:30.428702', '{\"EnqueuedAt\":\"2023-07-27T06:27:30.4278165Z\",\"Queue\":\"default\"}'),
(197, 66, 'Processing', NULL, '2023-07-27 06:27:39.538607', '{\"StartedAt\":\"2023-07-27T06:27:39.5351134Z\",\"ServerId\":\"trtheanh:20604:04a3b1be-53c2-4625-bcce-ca52861a4201\",\"WorkerId\":\"0457b7ae-4e25-4675-8dab-93e8da4a71cd\"}'),
(198, 66, 'Succeeded', NULL, '2023-07-27 06:27:39.552774', '{\"SucceededAt\":\"2023-07-27T06:27:39.5471676Z\",\"PerformanceDuration\":\"1\",\"Latency\":\"9123\"}'),
(199, 67, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 06:50:11.170858', '{\"EnqueuedAt\":\"2023-07-27T06:50:11.1563315Z\",\"Queue\":\"default\"}'),
(200, 67, 'Processing', NULL, '2023-07-27 06:50:18.039743', '{\"StartedAt\":\"2023-07-27T06:50:18.0224043Z\",\"ServerId\":\"trtheanh:18168:1e7f1a7a-2d77-4325-b44b-0a7c81469625\",\"WorkerId\":\"8c19b28f-da15-406a-8263-21f88e9c033b\"}'),
(201, 67, 'Succeeded', NULL, '2023-07-27 06:50:18.086903', '{\"SucceededAt\":\"2023-07-27T06:50:18.0704293Z\",\"PerformanceDuration\":\"13\",\"Latency\":\"6930\"}'),
(202, 68, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 07:00:24.810862', '{\"EnqueuedAt\":\"2023-07-27T07:00:24.7960447Z\",\"Queue\":\"default\"}'),
(203, 68, 'Processing', NULL, '2023-07-27 07:00:29.787392', '{\"StartedAt\":\"2023-07-27T07:00:29.7771787Z\",\"ServerId\":\"trtheanh:1372:93588332-2c82-4178-a2bb-52f2ced517d6\",\"WorkerId\":\"bc07428d-4efc-496c-9075-f34ce6a6e178\"}'),
(204, 68, 'Succeeded', NULL, '2023-07-27 07:00:29.815389', '{\"SucceededAt\":\"2023-07-27T07:00:29.8043497Z\",\"PerformanceDuration\":\"10\",\"Latency\":\"5013\"}'),
(205, 69, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 08:58:01.543008', '{\"EnqueuedAt\":\"2023-07-27T08:58:01.5197715Z\",\"Queue\":\"default\"}'),
(206, 69, 'Processing', NULL, '2023-07-27 08:58:11.507118', '{\"StartedAt\":\"2023-07-27T08:58:11.4895477Z\",\"ServerId\":\"trtheanh:27908:ec981998-3e65-42cd-b1df-b1b7d50cb8c6\",\"WorkerId\":\"92ed72cc-e3dd-4647-8808-7bf08fa885a7\"}'),
(207, 69, 'Succeeded', NULL, '2023-07-27 08:58:11.543360', '{\"SucceededAt\":\"2023-07-27T08:58:11.5296981Z\",\"PerformanceDuration\":\"14\",\"Latency\":\"10012\"}'),
(208, 70, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 09:00:04.894873', '{\"EnqueuedAt\":\"2023-07-27T09:00:04.8942692Z\",\"Queue\":\"default\"}'),
(209, 70, 'Processing', NULL, '2023-07-27 09:00:11.620079', '{\"StartedAt\":\"2023-07-27T09:00:11.6172488Z\",\"ServerId\":\"trtheanh:27908:ec981998-3e65-42cd-b1df-b1b7d50cb8c6\",\"WorkerId\":\"31d05042-2dad-49dc-b647-bd3f7dbd4bdf\"}'),
(210, 70, 'Succeeded', NULL, '2023-07-27 09:00:11.630898', '{\"SucceededAt\":\"2023-07-27T09:00:11.6264902Z\",\"PerformanceDuration\":\"1\",\"Latency\":\"6736\"}'),
(211, 71, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 09:51:08.186322', '{\"EnqueuedAt\":\"2023-07-27T09:51:08.1427051Z\",\"Queue\":\"default\"}'),
(212, 71, 'Processing', NULL, '2023-07-27 09:51:13.105015', '{\"StartedAt\":\"2023-07-27T09:51:13.0898174Z\",\"ServerId\":\"trtheanh:31148:01c203b3-836a-4c42-85cc-b7c75ba4d31f\",\"WorkerId\":\"016dd5a6-76f7-429a-b501-4ff4ad5beb83\"}'),
(213, 71, 'Succeeded', NULL, '2023-07-27 09:51:13.150501', '{\"SucceededAt\":\"2023-07-27T09:51:13.1329862Z\",\"PerformanceDuration\":\"16\",\"Latency\":\"5003\"}'),
(214, 72, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 10:00:04.742980', '{\"EnqueuedAt\":\"2023-07-27T10:00:04.7422132Z\",\"Queue\":\"default\"}'),
(215, 72, 'Processing', NULL, '2023-07-27 10:00:13.513245', '{\"StartedAt\":\"2023-07-27T10:00:13.5089611Z\",\"ServerId\":\"trtheanh:31148:01c203b3-836a-4c42-85cc-b7c75ba4d31f\",\"WorkerId\":\"1746a340-c1e1-4be9-bb62-187ec36292e4\"}'),
(216, 72, 'Succeeded', NULL, '2023-07-27 10:00:13.529822', '{\"SucceededAt\":\"2023-07-27T10:00:13.5235586Z\",\"PerformanceDuration\":\"1\",\"Latency\":\"8792\"}'),
(217, 73, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 13:36:49.833547', '{\"EnqueuedAt\":\"2023-07-27T13:36:49.8161666Z\",\"Queue\":\"default\"}'),
(218, 73, 'Processing', NULL, '2023-07-27 13:37:01.540949', '{\"StartedAt\":\"2023-07-27T13:37:01.4725411Z\",\"ServerId\":\"trtheanh:2340:1e75820c-e729-4f0e-a48a-fd7f1844683d\",\"WorkerId\":\"8cce2d76-a88c-46e5-a70f-e2d6f8a5f7ca\"}'),
(219, 73, 'Succeeded', NULL, '2023-07-27 13:37:01.603614', '{\"SucceededAt\":\"2023-07-27T13:37:01.5883615Z\",\"PerformanceDuration\":\"18\",\"Latency\":\"11777\"}'),
(220, 74, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 13:50:01.641879', '{\"EnqueuedAt\":\"2023-07-27T13:50:01.6298704Z\",\"Queue\":\"default\"}'),
(221, 74, 'Processing', NULL, '2023-07-27 13:50:05.518550', '{\"StartedAt\":\"2023-07-27T13:50:05.5082699Z\",\"ServerId\":\"trtheanh:13456:7eb7614d-dcf7-437c-be3d-b6a73cd1f2fe\",\"WorkerId\":\"c4a55194-d5ae-4d95-a332-ce9c5952d392\"}'),
(222, 74, 'Succeeded', NULL, '2023-07-27 13:50:05.551659', '{\"SucceededAt\":\"2023-07-27T13:50:05.5385879Z\",\"PerformanceDuration\":\"13\",\"Latency\":\"3911\"}'),
(223, 75, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 14:00:32.337179', '{\"EnqueuedAt\":\"2023-07-27T14:00:32.3365566Z\",\"Queue\":\"default\"}'),
(224, 75, 'Processing', NULL, '2023-07-27 14:00:36.252270', '{\"StartedAt\":\"2023-07-27T14:00:36.2497511Z\",\"ServerId\":\"trtheanh:13456:7eb7614d-dcf7-437c-be3d-b6a73cd1f2fe\",\"WorkerId\":\"4c4b6789-1ece-4514-aa43-213815a92fc1\"}'),
(225, 75, 'Succeeded', NULL, '2023-07-27 14:00:36.270907', '{\"SucceededAt\":\"2023-07-27T14:00:36.2657198Z\",\"PerformanceDuration\":\"10\",\"Latency\":\"3926\"}'),
(226, 76, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 14:55:29.753264', '{\"EnqueuedAt\":\"2023-07-27T14:55:29.7268897Z\",\"Queue\":\"default\"}'),
(227, 76, 'Processing', NULL, '2023-07-27 14:55:56.539997', '{\"StartedAt\":\"2023-07-27T14:55:56.4279288Z\",\"ServerId\":\"trtheanh:9840:a8322417-1012-4571-a0d5-7f645492d9ab\",\"WorkerId\":\"964d7395-9bf4-474a-ac5d-b637ff5cfe40\"}'),
(228, 76, 'Succeeded', NULL, '2023-07-27 14:55:56.640158', '{\"SucceededAt\":\"2023-07-27T14:55:56.6172676Z\",\"PerformanceDuration\":\"33\",\"Latency\":\"26872\"}'),
(229, 77, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 15:02:28.208667', '{\"EnqueuedAt\":\"2023-07-27T15:02:28.1842641Z\",\"Queue\":\"default\"}'),
(230, 77, 'Processing', NULL, '2023-07-27 15:02:38.144818', '{\"StartedAt\":\"2023-07-27T15:02:38.1331999Z\",\"ServerId\":\"trtheanh:17008:46b99380-8c15-4745-9dc9-1f6b50ca9195\",\"WorkerId\":\"0976b408-a469-41ea-a306-93a07dc19f46\"}'),
(231, 77, 'Succeeded', NULL, '2023-07-27 15:02:38.175272', '{\"SucceededAt\":\"2023-07-27T15:02:38.1638222Z\",\"PerformanceDuration\":\"12\",\"Latency\":\"9989\"}'),
(232, 78, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 15:50:03.042394', '{\"EnqueuedAt\":\"2023-07-27T15:50:03.0344414Z\",\"Queue\":\"default\"}'),
(233, 78, 'Processing', NULL, '2023-07-27 15:50:04.413955', '{\"StartedAt\":\"2023-07-27T15:50:04.4024310Z\",\"ServerId\":\"trtheanh:13488:83ced225-2949-439a-be43-9d7735f79fe7\",\"WorkerId\":\"cea35759-388f-4551-abd3-214e3704e156\"}'),
(234, 78, 'Succeeded', NULL, '2023-07-27 15:50:04.448939', '{\"SucceededAt\":\"2023-07-27T15:50:04.4374793Z\",\"PerformanceDuration\":\"12\",\"Latency\":\"1417\"}'),
(235, 79, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-27 16:05:00.394616', '{\"EnqueuedAt\":\"2023-07-27T16:05:00.3757571Z\",\"Queue\":\"default\"}'),
(236, 79, 'Processing', NULL, '2023-07-27 16:05:10.367822', '{\"StartedAt\":\"2023-07-27T16:05:10.3542320Z\",\"ServerId\":\"trtheanh:30620:da28188e-7710-4c8c-aec0-ec1f24ef3068\",\"WorkerId\":\"396544ae-5f8a-4594-81de-bad1631b3078\"}'),
(237, 79, 'Succeeded', NULL, '2023-07-27 16:05:10.396118', '{\"SucceededAt\":\"2023-07-27T16:05:10.3832308Z\",\"PerformanceDuration\":\"9\",\"Latency\":\"10011\"}'),
(238, 80, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-28 00:15:38.681568', '{\"EnqueuedAt\":\"2023-07-28T00:15:38.6584154Z\",\"Queue\":\"default\"}'),
(239, 80, 'Processing', NULL, '2023-07-28 00:15:48.663121', '{\"StartedAt\":\"2023-07-28T00:15:48.6512906Z\",\"ServerId\":\"trtheanh:21860:9f8d6da0-f2cc-42e7-8b39-b4cc6e7c9481\",\"WorkerId\":\"755fe4dc-6e24-413f-b550-fa0c4bc2b3c2\"}'),
(240, 80, 'Succeeded', NULL, '2023-07-28 00:15:48.692423', '{\"SucceededAt\":\"2023-07-28T00:15:48.6809704Z\",\"PerformanceDuration\":\"9\",\"Latency\":\"10029\"}'),
(241, 81, 'Enqueued', 'Triggered by recurring job scheduler', '2023-07-28 01:17:11.102278', '{\"EnqueuedAt\":\"2023-07-28T01:17:11.0779329Z\",\"Queue\":\"default\"}'),
(242, 81, 'Processing', NULL, '2023-07-28 01:17:21.060076', '{\"StartedAt\":\"2023-07-28T01:17:21.0492623Z\",\"ServerId\":\"trtheanh:20396:f4d60bc7-f749-4723-b35a-b809d2439db4\",\"WorkerId\":\"c8ad21ad-7918-4e82-a005-d46089d301fd\"}'),
(243, 81, 'Succeeded', NULL, '2023-07-28 01:17:21.083652', '{\"SucceededAt\":\"2023-07-28T01:17:21.0736663Z\",\"PerformanceDuration\":\"8\",\"Latency\":\"10006\"}');

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=93;

--
-- AUTO_INCREMENT cho bảng `hangfirecounter`
--
ALTER TABLE `hangfirecounter`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

--
-- AUTO_INCREMENT cho bảng `hangfirehash`
--
ALTER TABLE `hangfirehash`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=251;

--
-- AUTO_INCREMENT cho bảng `hangfirejob`
--
ALTER TABLE `hangfirejob`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT cho bảng `hangfirejobparameter`
--
ALTER TABLE `hangfirejobparameter`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=325;

--
-- AUTO_INCREMENT cho bảng `hangfirejobqueue`
--
ALTER TABLE `hangfirejobqueue`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

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
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=113160;

--
-- AUTO_INCREMENT cho bảng `hangfirestate`
--
ALTER TABLE `hangfirestate`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=244;

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
