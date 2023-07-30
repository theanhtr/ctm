/**
 * toggle khi nhấn vào icon dropdown bên cạnh tiêu đề
 * @author: TTANH (20/06/2023)
 * @param {*} event event
 */
function showPageTitleFilter(event) {
  try {
    let employeeTitleFilter = document.getElementById("employee__title-filter");

    if (event.target.classList.contains("employee__title-filter--open")) {
      event.target.classList.remove("employee__title-filter--open");
      employeeTitleFilter.style.visibility = "hidden";
      employeeTitleFilter.style.animation = "opacity--out 0.25s ease";
    } else {
      event.target.classList.add("employee__title-filter--open");
      employeeTitleFilter.style.visibility = "unset";
      employeeTitleFilter.style.animation = "opacity--in 0.25s ease";
    }
  } catch (error) {
    console.log("🚀 ~ file: page.js:20 ~ showPageTitleFilter ~ error:", error);
  }
}
