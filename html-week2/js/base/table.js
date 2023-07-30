/**
 * khai báo các biến dùng chung
 * @author: TTANH (20/06/2023)
 */
const pageContainer = mainContainer.querySelector(".page__container");
const filter = pageContainer.querySelector(".filter");
const filterSearch = filter.querySelector(".search-input-container");
const fieldAction = filter.querySelector(".multi-field__action-box");
const fieldSelectedCount = fieldAction.querySelector(".selected-count strong");
const mTable = document.getElementById("table-test");
const thead = mTable.querySelector("thead");
const tbody = mTable.querySelector("tbody");
const theadCheckbox = thead.querySelector(
  ".m-table__checkbox-column .selected-checkbox"
);
let tRowsFunction = tbody.querySelectorAll(".row__function");
let selectedData = [];
let employeeData = [];

/**
 * thực hiện 1 số hành động với table sau khi cửa sổ load xong
 * @author: TTANH (20/06/2023)
 */
window.addEventListener("load", () => {
  try {
    addTableSkeletonLoading();
    loadTableData();
    resizeColumn();
    addTableEventListener();
    selectedData = [];
  } catch (error) {
    console.log(
      "🚀 ~ file: table.js:18 ~ window.addEventListener ~ error:",
      error
    );
  }
});

/**
 * Thêm loading cho table khi gọi api
 * @author: TTANH (20/06/2023)
 */
function addTableSkeletonLoading() {
  try {
    theadCheckbox.checked = false;

    for (let i = 0; i <= 5; i++) {
      tbody.innerHTML += `<tr>
      <td class="m-table__checkbox-column">
        <div
          class="loading-skeleton__element"
          style="
            max-width: 16px;
            max-height: 16px;
            min-width: 16px;
            min-height: 16px;
          "
        ></div>
      </td>
      <td>
        <div class="loading-skeleton__element"></div>
      </td>
      <td>
        <div class="loading-skeleton__element"></div>
      </td>
      <td>
        <div class="loading-skeleton__element"></div>
      </td>
      <td>
        <div class="loading-skeleton__element"></div>
      </td>
      <td>
        <div class="loading-skeleton__element"></div>
      </td>
      <td>
        <div class="loading-skeleton__element"></div>
      </td>
      <td>
        <div class="loading-skeleton__element"></div>
      </td>
      <td>
        <div class="loading-skeleton__element"></div>
      </td>
      <td>
        <div class="loading-skeleton__element"></div>
      </td>
    </tr>`;
    }
  } catch (error) {
    console.log(
      "🚀 ~ file: table.js:16 ~ addTableSkeletonLoading ~ error:",
      error
    );
  }
}

/**
 * Load dữ liệu từ server
 * @author: TTANH (20/06/2023)
 */
function loadTableData() {
  try {
    fetch("https://cukcuk.manhnv.net/api/v1/Customers")
      .then((res) => res.json())
      .then((data) => {
        setTimeout(() => {
          tbody.innerHTML = "";
          employeeData = data;

          employeeData.forEach((employee, index) => {
            let employeeRow = document.createElement("tr");

            employeeRow.innerHTML = `
          <td class="m-table__checkbox-column">
            <input type="checkbox" class="selected-checkbox" />
          </td>
          <td class="row__customer-code ${alignText("left")}">${formatData(
              employee.CustomerCode
            )}</td>
          <td class="${alignText("left")}">
            <div class="row__avatar-name">
              <div class="row__name">${formatData(employee.FullName)}</div>
            </div>
          </td>
          <td class="${alignText("left")}">${formatData(
              employee.Gender,
              "gender"
            )}</td>
          <td class="${alignText("left")}">${formatData(employee.Address)}</td>
          <td class="${alignText("center")}">${formatData(
              employee.DateOfBirth,
              "date"
            )}</td>
          <td class="${alignText("left")}">${formatData(employee.Email)}</td>
          <td class="${alignText("left")}">${formatData(
              employee.PhoneNumber
            )}</td>
          <td class="${alignText("right")}">${formatData(
              employee.DebitAmount,
              "currency"
            )}</td>
          <td class="${alignText("left")}">${formatData(
              employee.CompanyName
            )}</td>
          <td class="row__function">
            <div class="row__function-element"
            title="Chỉnh sửa">
              <img
                src="../../assets/icon/edit.png"
                alt="icon"
                class="row__function-icon"
              />
            </div>
            <div class="row__function-element"
            title="Thông tin thêm">
              <img
                src="../../assets/icon/more_large.png"
                alt="icon"
                class="row__function-icon"
              />
            </div>
          </td>`;

            let rowCheckbox = employeeRow.querySelector(".selected-checkbox");
            rowCheckbox.addEventListener("click", selectOneRow);

            tbody.appendChild(employeeRow);
          });

          tRowsFunction = tbody.querySelectorAll(".row__function");

          theadCheckbox.addEventListener("click", selectAllRow);
        }, 300);
      })
      .catch((err) => {
        console.log("Get table data error: " + err);
      });
  } catch (error) {
    console.log("🚀 ~ file: table.js:53 ~ loadTableData ~ error:", error);
  }
}

/**
 * Thêm một số event cho các ele của table
 * @author: TTANH (20/06/2023)
 */
function addTableEventListener() {
  try {
  } catch (error) {
    console.log(
      "🚀 ~ file: table.js:171 ~ addTableEventListener ~ error:",
      error
    );
  }
}

/**
 * bắt sự kiện để resize column table
 * @author: TTANH (20/06/2023)
 */
function resizeColumn() {
  try {
    const thResizes = mTable.querySelectorAll(".th__resize");
    let currentColumnReizer;

    thResizes.forEach((thResize) => {
      thResize.addEventListener("mousedown", mousedown);
      function mousedown(e) {
        currentColumnReizer = thResize.parentElement;

        let prevX = e.clientX;

        window.addEventListener("mousemove", mousemove);
        window.addEventListener("mouseup", mouseup);

        function mousemove(e) {
          const mTableRect = mTable.getBoundingClientRect();
          const columnRect = currentColumnReizer.getBoundingClientRect();

          currentColumnReizer.style.width =
            columnRect.width + (e.clientX - prevX) + "px";
          currentColumnReizer.style["max-width"] =
            columnRect.width + (e.clientX - prevX) + "px";
          currentColumnReizer.style["min-width"] =
            columnRect.width + (e.clientX - prevX) + "px";

          mTable.style.width = mTableRect.width + (e.clientX - prevX) + "px";

          prevX = e.clientX;
        }

        function mouseup() {
          window.removeEventListener("mousemove", mousemove);
          window.removeEventListener("mouseup", mouseup);
        }
      }
    });
  } catch (error) {
    console.log("🚀 ~ file: table.js:140 ~ resizeColumn ~ error:", error);
  }
}

/**
 * format dữ liệu tùy theo loại cần format
 * @author: TTANH (20/06/2023)
 * @param {*} valueRaw dữ liệu cần format
 * @param {string} type loại format: "currency", "gender", "date", ""
 * @returns trả về dữ liệu đã được format
 */
function formatData(valueRaw, type = "") {
  try {
    switch (type) {
      case "currency":
        return formatToCurrency(valueRaw);
        break;

      case "date":
        return formatToDate(valueRaw);
        break;

      case "gender":
        if (valueRaw === 0) {
          return "Nam";
        } else if (valueRaw === 1) {
          return "Nữ";
        } else if (valueRaw === 2) {
          return "Không tiết lộ";
        } else {
          return "Lỗi";
        }
        break;

      default:
        return valueRaw;
        break;
    }
  } catch (error) {
    console.log("🚀 ~ file: table.js:184 ~ formatData ~ error:", error);
  }
}

/**
 * xử lý khi chọn vào một input checkbox của 1 hàng
 * @author: TTANH (20/06/2023)
 * @param {*} event event
 */
function selectOneRow(event) {
  try {
    //lấy ra t_row
    let row = event.target.parentElement.parentElement;
    let rowSelectedCustomerCode = row.querySelector(
      ".row__customer-code"
    ).innerHTML;

    if (event.target.checked) {
      employeeData.forEach((employee) => {
        if (employee.CustomerCode === rowSelectedCustomerCode) {
          selectedData.push(employee);

          if (selectedData.length === employeeData.length) {
            theadCheckbox.checked = true;
          }

          return;
        }
      });

      filterSearch.style.display = "none";
      fieldAction.style.display = "flex";
      fieldSelectedCount.innerHTML = selectedData.length;
    } else {
      selectedData.forEach((employee, index) => {
        if (employee.CustomerCode === rowSelectedCustomerCode) {
          selectedData = [
            ...selectedData.slice(0, index),
            ...selectedData.slice(index + 1, selectedData.length),
          ];

          theadCheckbox.checked = false;
        }
      });

      if (selectedData.length === 0) {
        filterSearch.style.display = "flex";
        fieldAction.style.display = "none";
      }

      fieldSelectedCount.innerHTML = selectedData.length;
    }
  } catch (error) {
    console.log("🚀 ~ file: table.js:272 ~ selectOneRow ~ error:", error);
  }
}

/**
 * xử lý khi chọn vào input checkbox header
 * @author: TTANH (20/06/2023)
 * @param {*} event event
 */
function selectAllRow(event) {
  try {
    let allRowEle = tbody.querySelectorAll("tr");

    if (event.target.checked) {
      selectedData = [...employeeData];

      allRowEle.forEach((oneRowEle) => {
        let rowSelectedCheckbox = oneRowEle.querySelector(".selected-checkbox");

        rowSelectedCheckbox.checked = true;
      });

      filterSearch.style.display = "none";
      fieldAction.style.display = "flex";
      fieldSelectedCount.innerHTML = selectedData.length;
    } else {
      selectedData = [];

      allRowEle.forEach((oneRowEle) => {
        let rowSelectedCheckbox = oneRowEle.querySelector(".selected-checkbox");

        rowSelectedCheckbox.checked = false;
      });

      filterSearch.style.display = "flex";
      fieldAction.style.display = "none";
      fieldSelectedCount.innerHTML = selectedData.length;
    }
  } catch (error) {
    console.log("🚀 ~ file: table.js:281 ~ selectAllRow ~ error:", error);
  }
}

/**
 * bắt sự kiện khi scroll table và sẽ pin header của table
 * @author: TTANH (20/06/2023)
 * @param {*} event event
 */
function scrollTabel(event) {
  try {
    if (event.target.scrollTop > 48) {
      thead.classList.add("thead--pinned");
    } else {
      thead.classList.remove("thead--pinned");
    }

    tRowsFunction.forEach((rowFunction) => {
      rowFunction.style.left = `calc(100vw - 200px - 48px - 72px - 8px - 20px + ${event.target.scrollLeft}px)`;
    });
  } catch (error) {
    console.log("🚀 ~ file: table.js:125 ~ scrollTabel ~ error:", error);
  }
}
