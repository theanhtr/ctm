import { ValidateConfig } from "../config/config";
import MISAResource from "../resource";
import sprintf from "sprintf-js";

/**
 * hàm kiểm tra chiều dài của một chuỗi
 * @param {string} valueCheck đối tượng cần kiểm tra
 * @param {int} maxLength chiều dài tối đa
 * @param {int?} minLength chiều dài tối thiểu
 * @param {string} nameField tên trường
 * @param {string} language mã ngôn ngữ: VN, EN
 * @returns thông báo lỗi
 * @author: TTANH (29/07/2023)
 */
function lengthValidate(
  valueCheck,
  maxLength,
  minLength = 0,
  nameField = "Trường",
  language = "VN"
) {
  let valueLength = valueCheck.length;

  if (maxLength < 0 || minLength < 0) {
    return MISAResource[language].Validate.ParamPassToFunctionError;
  } else if (valueLength > maxLength) {
    return sprintf.sprintf(
      MISAResource[language].Validate.MaxLengthError,
      nameField,
      maxLength
    );
  } else if (valueLength < minLength) {
    return sprintf.sprintf(
      MISAResource[language].Validate.MinLengthError,
      nameField,
      minLength
    );
  } else {
    return "";
  }
}

/**
 * hàm kiểm tra một chuỗi trống
 * @param {string} valueCheck đối tượng cần kiểm tra
 * @param {string} nameField tên trường
 * @param {string} language mã ngôn ngữ: VN, EN
 * @returns thông báo lỗi
 * @author: TTANH (29/07/2023)
 */
function emptyValidate(valueCheck, nameField = "Trường", language = "VN") {
  let valueLength = valueCheck.length;

  if (valueLength === 0) {
    return sprintf.sprintf(
      MISAResource[language].Validate.EmptyError,
      nameField
    );
  } else {
    return "";
  }
}

/**
 * hàm kiểm tra định dạng theo regex
 * @param {string} valueCheck đối tượng cần kiểm tra
 * @param {string} nameField tên trường
 * @param {string} language mã ngôn ngữ: VN, EN
 * @param {string} regex regex kiểm tra
 * @returns thông báo lỗi
 * @author: TTANH (29/07/2023)
 */
function regexValidate(
  valueCheck,
  nameField = "Trường",
  regex,
  language = "VN"
) {
  if (!String(valueCheck).toLowerCase().match(regex) && valueCheck !== "") {
    return sprintf.sprintf(
      MISAResource[language].Validate.FormatError,
      nameField
    );
  } else {
    return "";
  }
}

export { lengthValidate, emptyValidate, regexValidate };
