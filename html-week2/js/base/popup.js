/**
 * show popup khi ấn vào 1 button
 * @author: TTANH (20/06/2023)
 * @param {string} popupSelector chuỗi chứa css selector của popup, ex: ".class-a.class-b"
 */
function showPopup(popupSelector) {
  try {
    const popup = document.querySelector(popupSelector);

    const closeButton = popup.querySelector(".m__icon--close");

    popup.parentElement.style.visibility = "unset";

    popup.style.animation = "popup--in 0.25s ease forwards";

    closeButton.onclick = () => {
      popup.style.animation = "popup--out 0.1s ease forwards";

      setTimeout(() => {
        popup.parentElement.style.visibility = "hidden";
      }, 200);
    };
  } catch (error) {
    console.log("🚀 ~ file: popup.js:5 ~ showPopup ~ error:", error);
  }
}
