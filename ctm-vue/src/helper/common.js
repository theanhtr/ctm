/**
 * tìm kiếm vị trí của 1 giá trị
 * @param {Array} arrayFind mảng cần tìm kiếm
 * @param {string} attr thuộc tính cần tìm kiếm
 * @param {*} valueFind giá trị cần tìm kiếm
 * @returns -1 nếu không tìm thấy, 1 số >= 0 nếu tìm thấy
 */
export const findIndexByAttribute = function (arrayFind, attr, valueFind) {
  try {
    if (attr === "") {
      for (let i = 0; i < arrayFind.length; i++) {
        if (arrayFind[i] == valueFind) {
          return i;
        }
      }
    } else {
      for (let i = 0; i < arrayFind.length; i++) {
        if (arrayFind[i][attr] == valueFind) {
          return i;
        }
      }
    }

    return -1;
  } catch (error) {
    console.log("🚀 ~ file: index.js:5 ~ findIndexByAttribute ~ error:", error);
  }
};

/**
 * sắp xếp array theo thuộc tính bằng merge sort
 * @author: TTANH (04/07/2023)
 * @param {*} arrayIn array muốn sắp xếp
 * @param {*} attr thuộc tính muốn so sánh
 * @param {boolean} isFromHighToLow xác định xem có sắp xếp theo chiều từ cao đến thấp không
 * @returns array đã được sắp xếp
 */
export const sortArrayByAttribute = function (
  arrayIn,
  attr,
  isFromHighToLow = true
) {
  return mergeSortByAttribute(arrayIn, attr, isFromHighToLow);
};

/**
 * thuật toán merge sort, tách array ra làm đôi
 * @author: TTANH (04/07/2023)
 * @param {*} arr array muốn sắp xếp
 * @param {*} attr thuộc tính muốn so sánh
 * @param {boolean} isFromHighToLow xác định xem có sắp xếp theo chiều từ cao đến thấp không
 * @returns array đã được sắp xếp
 */
const mergeSortByAttribute = function (arr, attr, isFromHighToLow) {
  try {
    if (arr.length <= 1) return arr;

    const right = [...arr];

    const middlePoint = arr.length / 2;
    const left = right.splice(0, middlePoint);

    return mergeUnsortedArrsByAttribute(
      mergeSortByAttribute(left, attr, isFromHighToLow),
      mergeSortByAttribute(right, attr, isFromHighToLow),
      attr,
      isFromHighToLow
    );
  } catch (error) {
    console.log(
      "🚀 ~ file: common.js:38 ~ mergeSortByAttribute ~ error:",
      error
    );
  }
};

/**
 * merge array left, right vào và sắp xếp
 * @author: TTANH (04/07/2023)
 * @param {*} left mảng bên trái
 * @param {*} right mảng bên phải
 * @param {*} attr thuộc tính muốn so sánh
 * @param {boolean} isFromHighToLow xác định xem có sắp xếp theo chiều từ cao đến thấp không
 * @returns array đã được sắp xếp
 */
const mergeUnsortedArrsByAttribute = function (
  left,
  right,
  attr,
  isFromHighToLow
) {
  try {
    const sortedItems = [];

    while (left.length && right.length) {
      if (isFromHighToLow) {
        if (left[0][attr] >= right[0][attr]) {
          sortedItems.push(left.shift());
        } else {
          sortedItems.push(right.shift());
        }
      } else {
        if (left[0][attr] <= right[0][attr]) {
          sortedItems.push(left.shift());
        } else {
          sortedItems.push(right.shift());
        }
      }
    }

    return [...sortedItems, ...left, ...right];
  } catch (error) {
    console.log(
      "🚀 ~ file: common.js:60 ~ mergeUnsortedArrsByAttribute ~ error:",
      error
    );
  }
};

/**
 * hàm tạo ra uuid
 * @author: TTANH (01/07/2023)
 * @returns 1 uuid mới
 */
export const generateUuid = function () {
  try {
    return ([1e7] + -1e3 + -4e3 + -8e3 + -1e11).replace(/[018]/g, (c) =>
      (
        c ^
        (crypto.getRandomValues(new Uint8Array(1))[0] & (15 >> (c / 4)))
      ).toString(16)
    );
  } catch (error) {
    console.log("🚀 ~ file: common.js:30 ~ generateUuid ~ error:", error);
  }
};

/**
 * kiểm tra xem một đối tượng có rỗng hay không
 * @param {object} object đối tượng cần kiểm tra
 * @returns true: rỗng, false: không rỗng
 * @author: TTANH (29/07/2023)
 */
export const isObjectEmpty = function (object) {
  return Object.keys(object).length === 0;
};
