/**
 * xác định các biến dùng chung với combobox-test
 * @author: TTANH (20/06/2023)
 */
const combobox = document.querySelector(".combobox-test");
const comboboxInputContainer = combobox.querySelector(
  ".combobox__input-container"
);
const comboboxDropdown = combobox.querySelector(".combobox__dropdown");
const comboboxInput = combobox.querySelector(".combobox__input");
const comboboxData = combobox.querySelector(".combobox__data");
const comboboxError = combobox.querySelector(".combobox__error");
let defaultData = []; //data sau khi chưa lọc

/**
 * thực hiện 1 số hành động với combobox sau khi cửa sổ load xong
 * @author: TTANH (20/06/2023)
 */
window.addEventListener("load", () => {
  try {
    addComboboxLoading();
    loadComboboxDefaultData();
    addComboboxEventListener();
  } catch (error) {
    console.log(
      "🚀 ~ file: combobox.js:19 ~ window.addEventListener ~ error:",
      error
    );
  }
});

/**
 * tạo progress load dữ liệu trước khi tải xong từ server
 * @author: TTANH (20/06/2023)
 */
function addComboboxLoading() {
  try {
    comboboxData.innerHTML = `<div id="loading-bar-spinner" class="spinner-small spinner">
                            <div class="spinner-icon"></div>
                          </div>`;
  } catch (error) {
    console.log(
      "🚀 ~ file: combobox.js:33 ~ addComboboxLoading ~ error:",
      error
    );
  }
}

/**
 * Load dữ liệu từ server
 * @author: TTANH (20/06/2023)
 */
function loadComboboxDefaultData() {
  try {
    fetch("https://cukcuk.manhnv.net/api/v1/Departments")
      .then((res) => res.json())
      .then((data) => {
        defaultData = data;
        comboboxInput.addEventListener("keyup", inputChange);

        setTimeout(() => {
          comboboxData.innerHTML = "";

          defaultData.forEach((value) => {
            addComboboxValue(value.DepartmentName);
          });
        }, 1000);
      })
      .catch((error) => {
        console.log("🚀 ~ file: combobox.js:62 ~ error:", error);
      });
  } catch (error) {
    console.log(
      "🚀 ~ file: combobox.js:51 ~ loadComboboxDefaultData ~ error:",
      error
    );
  }
}

/**
 * Thêm một số event cho các ele của combobox
 * @author: TTANH (20/06/2023)
 */
function addComboboxEventListener() {
  try {
    comboboxDropdown.addEventListener("click", clickInputContainer);
    comboboxInput.addEventListener("focus", focusInput);
    window.addEventListener("click", clickOutSideComboboxData);
  } catch (error) {
    console.log(
      "🚀 ~ file: combobox.js:88 ~ addComboboxEventListener ~ error:",
      error
    );
  }
}

/**
 * Hàm để ẩn container chứa các data tìm kiếm
 * @author: TTANH (20/06/2023)
 */
function hiddenComboboxData() {
  try {
    combobox.classList.remove("combobox--focus");
    combobox.classList.remove("combobox--result");
    combobox.classList.remove("combobox--searching");
    comboboxData.style.visibility = "hidden";
    comboboxInput.blur();
  } catch (error) {
    console.log(
      "🚀 ~ file: combobox.js:105 ~ hiddenComboboxData ~ error:",
      error
    );
  }
}

/**
 * Xử lý khi ấn vào container icon cạnh input
 * @author: TTANH (20/06/2023)
 */
function clickInputContainer() {
  try {
    if (combobox.classList.contains("combobox--focus")) {
      hiddenComboboxData();
    } else {
      comboboxInput.focus();
    }
  } catch (error) {
    console.log(
      "🚀 ~ file: combobox.js:124 ~ clickInputContainer ~ error:",
      error
    );
  }
}

/**
 * Xử lý khi focus input
 * @author: TTANH (20/06/2023)
 */
function focusInput() {
  try {
    comboboxData.style.visibility = "unset";
    combobox.classList.add("combobox--focus");
  } catch (error) {
    console.log("🚀 ~ file: combobox.js:141 ~ focusInput ~ error:", error);
  }
}

/**
 * Xử lý khi click ra ngoài combobox
 * @author: TTANH (20/06/2023)
 * @param {*} event event
 */
function clickOutSideComboboxData(event) {
  try {
    if (!combobox.contains(event.target)) {
      hiddenComboboxData();
    }
  } catch (error) {
    console.log(
      "🚀 ~ file: combobox.js:156 ~ clickOutSideComboboxData ~ error:",
      error
    );
  }
}

/**
 * Xử lý khi thêm 1 giá trị không có trong default value
 * @author: TTANH (20/06/2023)
 * @param {string} value giá trị chuỗi cần thêm vào
 */
function addComboboxValue(value) {
  try {
    let comboboxDataChild = document.createElement("div");

    comboboxDataChild.classList.add("combobox__value");

    comboboxDataChild.innerHTML = value;

    comboboxDataChild.onclick = clickDataValue;

    comboboxData.appendChild(comboboxDataChild);
  } catch (error) {
    console.log(
      "🚀 ~ file: combobox.js:175 ~ addComboboxValue ~ error:",
      error
    );
  }
}

/**
 * Xử lý khi click vào 1 dòng data
 * @author: TTANH (20/06/2023)
 * @param {*} event event
 */
function clickDataValue(event) {
  try {
    hiddenComboboxData();

    comboboxDataSearchEles = comboboxData.querySelectorAll(".combobox__value");

    comboboxDataSearchEles.forEach((ele) => {
      ele.classList.remove("combobox__value--selected");
    });

    comboboxInput.value = event.target.innerHTML;

    event.target.classList.add("combobox__value--selected");
    combobox.classList.remove("combobox--focus");
    combobox.classList.remove("combobox--result");
  } catch (error) {
    console.log("🚀 ~ file: combobox.js:192 ~ clickDataValue ~ error:", error);
  }
}

/**
 * Xử lí khi thay đổi input của combobox: tìm kiếm
 * @author: TTANH (20/06/2023)
 * @param {*} event event
 */
function inputChange(event) {
  try {
    let dataSearch = [];
    let valueTrim = event.target.value.trim();

    if (!valueTrim) {
      combobox.classList.remove("combobox--searching");
      combobox.classList.remove("combobox--result");

      dataSearch = defaultData;
      comboboxData.innerHTML = "";

      dataSearch.forEach((value) => {
        addComboboxValue(value.DepartmentName);
      });
    } else {
      combobox.classList.add("combobox--searching");

      comboboxData.innerHTML = `<div id="loading-bar-spinner" class="spinner-small spinner">
                            <div class="spinner-icon"></div>
                          </div>`;

      dataSearch = defaultData.filter((value) => {
        return value.DepartmentName.toLowerCase().includes(
          valueTrim.toLowerCase()
        );
      });

      if (dataSearch.length !== 0) {
        comboboxData.innerHTML = "";

        dataSearch.forEach((value) => {
          addComboboxValue(value.DepartmentName);
        });
      } else {
        let valueNotFound = capitalizeFirstLetter(event.target.value);

        comboboxData.innerHTML = `<div class="combobox__data-not-found">Thêm lựa chọn: ${valueNotFound}</div>`;

        comboboxDataSearchNotFoundEle = comboboxData.querySelector(
          ".combobox__data-not-found"
        );

        //Sự kiện click ele not found
        comboboxDataSearchNotFoundEle.onclick = () => {
          const addPopup = combobox.querySelector(".combobox__add-popup");
          const cityAddPopup = addPopup.querySelector("#city-name");
          cityAddPopup.value = valueNotFound;

          addPopup.style.visibility = "unset";

          const closeButton = addPopup.querySelector(".m__icon--close");

          addPopup.style.animation = "popup--in 0.25s ease forwards";

          closeButton.onclick = () => {
            addPopup.style.animation = "popup--out 0.1s ease forwards";

            setTimeout(() => {
              addPopup.style.visibility = "hidden";
            }, 200);
          };
        };
      }
      combobox.classList.remove("combobox--searching");
      combobox.classList.add("combobox--result");
    }
  } catch (error) {
    console.log("🚀 ~ file: combobox.js:217 ~ inputChange ~ error:", error);
  }
}
