/**
 * convert string từ: trần thế anh -> Trần Thế Anh
 * @author: TTANH (20/06/2023)
 * @param {string} rawValue giá trị cần convert
 * @returns giá trị đã convert
 */
function capitalizeFirstLetter(rawValue) {
  try {
    let valueReturn = "";

    for (let i = 0; i < rawValue.length; i++) {
      if (i === 0) {
        valueReturn += rawValue[i].toUpperCase();
      } else {
        if (rawValue[i - 1] === " ") {
          valueReturn += rawValue[i].toUpperCase();
        } else {
          valueReturn += rawValue[i];
        }
      }
    }

    return valueReturn;
  } catch (error) {
    console.log(
      "🚀 ~ file: helper.js:10 ~ capitalizeFirstLetter ~ error:",
      error
    );
  }
}

/**
 * chuyển đổi sang date format
 * @author: TTANH (20/06/2023)
 * @param {string} rawValue string có thể chuyển định dạng sang được date
 * @returns string đã được định dạng theo 30/06/2023
 */
function formatToDate(rawValue) {
  try {
    let valueConvert = new Date(rawValue);

    return `${
      valueConvert.getDay() < 10
        ? "0" + valueConvert.getDay()
        : valueConvert.getDay()
    }/${
      valueConvert.getMonth() + 1 < 10
        ? "0" + (valueConvert.getMonth() + 1)
        : valueConvert.getMonth() + 1
    }/${valueConvert.getFullYear()}`;
  } catch (error) {
    console.log("🚀 ~ file: helper.js:51 ~ formatToDate ~ error:", error);
  }
}

/**
 * chuyển đổi sang định dạng tiền
 * @author: TTANH (20/06/2023)
 * @param {int} rawValue dữ liệu có thể chuyển sang kiểu tiền
 * @returns chuyển đổi thành dữ liệu dạng: 1.000.000đ, nếu 0 thì thành ""
 */
function formatToCurrency(rawValue) {
  try {
    if (rawValue === 0 || rawValue === null) {
      return "";
    }

    const formatter = new Intl.NumberFormat("vi-VN", {
      style: "currency",
      currency: "VND",
    });

    return formatter.format(rawValue);
  } catch (error) {
    console.log("🚀 ~ file: helper.js:58 ~ formatToCurrency ~ error:", error);
  }
}

/**
 * căn text tương ứng từng kiểu
 * @param {string} type xác định kiểu căn text: "left", "right", "center"
 * @returns class tương ứng với mỗi loại align text
 */
function alignText(type) {
  try {
    switch (type) {
      case "left":
        return "text-align--left";
        break;

      case "right":
        return "text-align--right";
        break;

      case "center":
        return "text-align--center";
        break;

      default:
        break;
    }
  } catch (error) {
    console.log("🚀 ~ file: helper.js:89 ~ alignText ~ error:", error);
  }
}
