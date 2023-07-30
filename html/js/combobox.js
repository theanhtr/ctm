let provincesData = [
  "Hà Nội",
  "Hà Giang",
  "Cao Bằng",
  "Bắc Kạn",
  "Tuyên Quang",
  "Lào Cai",
  "Điện Biên",
  "Lai Châu",
  "Sơn La",
  "Yên Bái",
  "Hoà Bình",
  "Thái Nguyên",
  "Lạng Sơn",
  "Quảng Ninh",
  "Bắc Giang",
  "Phú Thọ",
  "Vĩnh Phúc",
  "Bắc Ninh",
  "Hải Dương",
  "Hải Phòng",
  "Hưng Yên",
  "Thái Bình",
  "Hà Nam",
  "Nam Định",
  "Ninh Bình",
  "Thanh Hóa",
  "Nghệ An",
  "Hà Tĩnh",
  "Quảng Bình",
  "Quảng Trị",
  "Đà Nẵng",
  "Quảng Nam",
  "Quảng Ngãi",
  "Bình Định",
  "Phú Yên",
  "Khánh Hòa",
  "Ninh Thuận",
  "Bình Thuận",
  "Kon Tum",
  "Gia Lai",
  "Đắk Lắk",
  "Đắk Nông",
  "Lâm Đồng",
  "Bình Phước",
  "Tây Ninh",
  "Bình Dương",
  "Đồng Nai",
  "Long An",
  "Tiền Giang",
  "Bến Tre",
  "Trà Vinh",
  "Vĩnh Long",
];

{
  /* <div class="combobox__data-search combobox__data-selected">Hải Phòng</div>; */
  /* <i class="fa-solid fa-check" style="color: var(--green-300);"></i> */
}

//các phần tử
let comboboxContainer = document.querySelector(".combobox-container");

let comboboxDataSearchContainer = comboboxContainer.querySelector(
  ".combobox__infor-container .combobox__data-search-container"
);

let comboboxInforContainer = comboboxContainer.querySelector(
  ".combobox__infor-container"
);

let comboboxDropdownContainer = comboboxInforContainer.querySelector(
  ".combobox__dropdown--container"
);

let comboboxPopupAddValue = comboboxContainer.querySelector(
  ".combobox__popup-add-value"
);

let popupCancelButton = comboboxPopupAddValue.querySelector(
  ".popup-cancel-button"
);

let inputSearch = comboboxContainer.querySelector(
  ".combobox__textfield__data-container__input-container input"
);

let inputCityAdd = comboboxPopupAddValue.querySelector("#city-add");

//load dữ liệu
let searchData = provincesData;

searchData.forEach((province) => {
  comboboxDataSearchContainer.innerHTML += `<div class="combobox__data-search">${province}</div>`;
});

let comboboxDataSearchEles = comboboxDataSearchContainer.querySelectorAll(
  ".combobox__data-search"
);

let resetClickListenerDataSearchEles = () => {
  comboboxDataSearchEles = comboboxDataSearchContainer.querySelectorAll(
    ".combobox__data-search"
  );

  //Sự kiện click chọn 1 phần tử
  comboboxDataSearchEles.forEach((ele) => {
    if (ele.innerText !== inputSearch.value) {
      ele.classList.remove("combobox__data-selected");
    }

    ele.onclick = () => {
      comboboxContainer.classList.remove("combobox--focus");

      comboboxDataSearchContainer.style.display = "none";

      inputSearch.value = ele.innerText;

      ele.classList.add("combobox__data-selected");
    };
  });
};

//Sự kiện nhấn vào drop down box
comboboxDropdownContainer.addEventListener("click", () => {
  inputSearch.focus();
});

//Sự kiện click vào ô input
inputSearch.addEventListener("focusin", () => {
  comboboxContainer.classList.add("combobox--focus");

  comboboxDataSearchContainer.style.display = "block";

  resetClickListenerDataSearchEles();
});

//Sự kiện click outside combobox
window.addEventListener("click", (e) => {
  if (!comboboxContainer.contains(e.target)) {
    comboboxContainer.classList.remove("combobox--focus");

    comboboxDataSearchContainer.style.display = "none";
  }
});

//Sự kiện thay đổi input tìm kiếm
inputSearch.addEventListener("keyup", (event) => {
  let valueTrim = event.target.value.trim();

  if (valueTrim === "") {
    comboboxContainer.classList.remove("combobox--searching");
    comboboxContainer.classList.remove("combobox--result");

    searchData = provincesData;

    comboboxDataSearchContainer.innerHTML = "";

    searchData.forEach((province) => {
      comboboxDataSearchContainer.innerHTML += `<div class="combobox__data-search">${province}</div>`;
    });

    resetClickListenerDataSearchEles();
  } else {
    comboboxContainer.classList.add("combobox--searching");

    comboboxDataSearchContainer.innerHTML = `<i class="fa-solid fa-spinner loading-icon"></i>`;

    searchData = provincesData.filter((province) => {
      return province.toLowerCase().includes(valueTrim.toLowerCase());
    });

    setTimeout(() => {
      if (searchData.length !== 0) {
        comboboxDataSearchContainer.innerHTML = "";

        searchData.forEach((province) => {
          comboboxDataSearchContainer.innerHTML += `<div class="combobox__data-search">${province}</div>`;
        });

        resetClickListenerDataSearchEles();
      } else {
        comboboxDataSearchContainer.innerHTML = `<div class="combobox__data-not-found">Thêm lựa chọn: ${event.target.value}</div>`;

        comboboxDataSearchNotFoundEle =
          comboboxDataSearchContainer.querySelector(
            ".combobox__data-not-found"
          );

        //Sự kiện click ele not found chọn 1 phần tử
        comboboxDataSearchNotFoundEle.onclick = () => {
          comboboxPopupAddValue.style.display = "flex";

          inputCityAdd.value = valueTrim;
        };
      }
      comboboxContainer.classList.remove("combobox--searching");
      comboboxContainer.classList.add("combobox--result");
    }, 300);
  }
});

popupCancelButton.onclick = () => {
  comboboxPopupAddValue.style.display = "none";

  inputCityAdd.value = "";
};
