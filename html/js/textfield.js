//xử lý sự kiện ấn enter sẽ chuyển từ verifying đến validate để test
let textfield = document.querySelector(".textfield-container");
textfield.addEventListener("keydown", (e) => {
  if (e.key === "Enter") {
    let iconElement = textfield.querySelector(
      ".textfield__data-container__icon i"
    );

    textfield.classList.add("textfield--verifying");
    iconElement.classList.remove("fa-magnifying-glass");
    iconElement.classList.add("fa-spinner");

    setTimeout(() => {
      textfield.classList.remove("textfield--verifying");
      textfield.classList.add("textfield--validate");

      iconElement.classList.remove("fa-spinner");
      iconElement.classList.add("fa-circle-check");
    }, 1000);
  }
});
