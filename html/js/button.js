//xử lý sự kiện ấn vào combo button sẽ chuyển màu
let comboBtn = document.querySelector(".combo-btn-container");
comboBtn.addEventListener("click", () => {
  comboBtn.classList.add("combo-btn--pressed");
  setTimeout(() => {
    comboBtn.classList.remove("combo-btn--pressed");
  }, 500);
});
