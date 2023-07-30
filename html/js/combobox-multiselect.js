{
  /* <div class="combobox-multiselect__infor-data-selected">
  <div class="combobox-multiselect__infor-data-selected__value">test</div>

  <div class="combobox-multiselect__infor-data-selected__close-btn">
    <i class="fa-solid fa-xmark"></i>
  </div>
</div> */
}

{
  /* <div class="combobox-multiselect__data-search combobox-multiselect__data-selected">
  <div class="combobox-multiselect__data-search__value">test</div>

  <div class="combobox-multiselect__data-search__select-icon">
    <i class="fa-solid fa-check"></i>
  </div>
</div> */
}

//all value selected
let valueSelectedArr = [];

//các phần tử
let comboboxMultiselectContainer = document.querySelector(
  ".combobox-multiselect-container"
);

let comboboxMultiselectDataSearchContainer =
  comboboxMultiselectContainer.querySelector(
    ".combobox-multiselect__infor-container .combobox-multiselect__data-search-container"
  );

let comboboxMultiselectInforContainer =
  comboboxMultiselectContainer.querySelector(
    ".combobox-multiselect__infor-container"
  );

let comboboxMultiselectDropdownContainer =
  comboboxMultiselectInforContainer.querySelector(
    ".combobox-multiselect__dropdown--container"
  );

let comboboxMultiselectPopupAddValue =
  comboboxMultiselectContainer.querySelector(
    ".combobox-multiselect__popup-add-value"
  );

let inputMultiselectSearch = comboboxMultiselectContainer.querySelector(
  ".combobox-multiselect__textfield__data-container__input-container input"
);

//load dữ liệu
let searchMultiselectData = provincesData;

searchMultiselectData.forEach((province) => {
  comboboxMultiselectDataSearchContainer.innerHTML += `
  <div class="combobox-multiselect__data-search">
    <div class="combobox-multiselect__data-search__value">${province}</div>

    <div class="combobox-multiselect__data-search__select-icon">
      <i class="fa-solid fa-check"></i>
    </div>
  </div>
  `;
});

let comboboxMultiselectDataSearchEles =
  comboboxMultiselectDataSearchContainer.querySelectorAll(
    ".combobox-multiselect__data-search"
  );

let resetClickListenerMultiselectDataSearchEles = () => {
  comboboxMultiselectDataSearchEles =
    comboboxMultiselectDataSearchContainer.querySelectorAll(
      ".combobox-multiselect__data-search"
    );

  //Sự kiện click chọn 1 phần tử
  comboboxMultiselectDataSearchEles.forEach((ele) => {
    let dataValue = ele.querySelector(
      ".combobox-multiselect__data-search__value"
    ).innerText;

    let selectedIcon = ele.querySelector(
      ".combobox-multiselect__data-search__select-icon"
    );

    if (!valueSelectedArr.includes(dataValue)) {
      ele.classList.remove("combobox-multiselect__data-selected");

      selectedIcon.style.display = "none";
    }

    ele.onclick = () => {
      //toggle add
      valueSelectedArr;
      comboboxMultiselectContainer.classList.remove(
        "combobox-multiselect--focus"
      );

      comboboxMultiselectDataSearchContainer.style.display = "none";

      inputMultiselectSearch.value = ele.innerText;

      ele.classList.add("combobox-multiselect__data-selected");
    };
  });
};

//Sự kiện nhấn vào drop down box
comboboxMultiselectDropdownContainer.addEventListener("click", () => {
  inputMultiselectSearch.focus();
});

//Sự kiện click vào ô input
inputMultiselectSearch.addEventListener("focusin", () => {
  comboboxMultiselectContainer.classList.add("combobox-multiselect--focus");

  comboboxMultiselectDataSearchContainer.style.display = "block";

  resetClickListenerMultiselectDataSearchEles();
});

//Sự kiện click outside comboboxMultiselect
window.addEventListener("click", (e) => {
  if (!comboboxMultiselectContainer.contains(e.target)) {
    comboboxMultiselectContainer.classList.remove(
      "combobox-multiselect--focus"
    );

    comboboxMultiselectDataSearchContainer.style.display = "none";
  }
});

//Sự kiện thay đổi input tìm kiếm
inputMultiselectSearch.addEventListener("keyup", (event) => {
  let valueTrim = event.target.value.trim();

  if (valueTrim === "") {
    comboboxMultiselectContainer.classList.remove(
      "combobox-multiselect--searching"
    );
    comboboxMultiselectContainer.classList.remove(
      "combobox-multiselect--result"
    );

    searchMultiselectData = provincesData;

    comboboxMultiselectDataSearchContainer.innerHTML = "";

    searchMultiselectData.forEach((province) => {
      comboboxMultiselectDataSearchContainer.innerHTML += `
      <div class="combobox-multiselect__data-search">
        <div class="combobox-multiselect__data-search__value">${province}</div>
  
        <div class="combobox-multiselect__data-search__select-icon">
          <i class="fa-solid fa-check"></i>
        </div>
      </div>
      `;
    });

    resetClickListenerMultiselectDataSearchEles();
  } else {
    comboboxMultiselectContainer.classList.add(
      "combobox-multiselect--searching"
    );

    comboboxMultiselectDataSearchContainer.innerHTML = `<i class="fa-solid fa-spinner loading-icon"></i>`;

    searchMultiselectData = provincesData.filter((province) => {
      return province.toLowerCase().includes(valueTrim.toLowerCase());
    });

    setTimeout(() => {
      if (searchMultiselectData.length !== 0) {
        comboboxMultiselectDataSearchContainer.innerHTML = "";

        searchMultiselectData.forEach((province) => {
          comboboxMultiselectDataSearchContainer.innerHTML += `
          <div class="combobox-multiselect__data-search">
            <div class="combobox-multiselect__data-search__value">${province}</div>
    
            <div class="combobox-multiselect__data-search__select-icon">
              <i class="fa-solid fa-check"></i>
            </div>
          </div>
          `;
        });

        resetClickListenerMultiselectDataSearchEles();
      } else {
        comboboxMultiselectDataSearchContainer.innerHTML = `<div class="combobox-multiselect__data-not-found">Thêm lựa chọn: ${event.target.value}</div>`;

        comboboxMultiselectDataSearchNotFoundEle =
          comboboxMultiselectDataSearchContainer.querySelector(
            ".combobox-multiselect__data-not-found"
          );

        //Sự kiện click ele not found chọn 1 phần tử
        comboboxMultiselectDataSearchNotFoundEle.onclick = () => {
          comboboxMultiselectPopupAddValue.style.display = "flex";

          inputCityAdd.value = valueTrim;
        };
      }
      comboboxMultiselectContainer.classList.remove(
        "combobox-multiselect--searching"
      );
      comboboxMultiselectContainer.classList.add(
        "combobox-multiselect--result"
      );
    }, 300);
  }
});
