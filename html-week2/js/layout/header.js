let headerMenu = document.querySelector("body .header__menu");

/**
 * bắt sự kiện ẩn hiện header chứa các app
 * @author: TTANH (20/06/2023)
 */
function showHideHeaderMenu() {
  try {
    if (headerMenu.style.visibility === "unset") {
      headerMenu.style.animation = "header-menu--hide 0.3s ease forwards";

      setTimeout(() => {
        headerMenu.style.visibility = "hidden";
      }, 300);
    } else {
      headerMenu.style.visibility = "unset";

      headerMenu.style.animation = "header-menu--show 0.3s ease forwards";
    }
  } catch (error) {
    console.log("🚀 ~ file: header.js:11 ~ showHideHeaderMenu ~ error:", error);
  }
}
