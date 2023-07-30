/**
 * bắt sự kiện click vào dropdown của combo button
 * @author: TTANH (20/06/2023)
 * @param {*} event event
 */
function clickDropdownCbBtn(event) {
  try {
    event.stopPropagation();

    let buttonDropdown;

    //xác định chính xác dropdown button container
    if (event.target.localName === "img") {
      buttonDropdown = event.target.parentElement;
    } else {
      buttonDropdown = event.target;
    }

    let dropdownContainer = buttonDropdown.parentElement.querySelector(
      ".cb-button__dropdown" // đây là container được hiện ra khi ấn vào buttonDropdown
    );

    if (buttonDropdown.classList.contains("cb-button__dropdown--pressed")) {
      buttonDropdown.classList.remove("cb-button__dropdown--pressed");
      dropdownContainer.style.visibility = "hidden";
    } else {
      buttonDropdown.classList.add("cb-button__dropdown--pressed");
      dropdownContainer.style.visibility = "unset";

      // sự kiện click bên ngoài dropdown data container
      window.addEventListener("click", (e) => {
        if (!dropdownContainer.contains(e.target)) {
          buttonDropdown.classList.remove("cb-button__dropdown--pressed");
          dropdownContainer.style.visibility = "hidden";
        }
      });
    }
  } catch (error) {
    console.log("🚀 ~ file: button.js:9 ~ clickDropdownCbBtn ~ error:", error);
  }
}
