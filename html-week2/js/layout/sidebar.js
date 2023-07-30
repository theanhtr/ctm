/**
 * bắt sự kiện thu gọn và mở rộng sidebar
 * @author: TTANH (20/06/2023)
 */
function expandCollapseSidebar() {
  try {
    if (sidebar.classList.contains("sidebar--collapse")) {
      sidebar.classList.remove("sidebar--collapse");

      sidebar.setAttribute("title", "");

      sidebar.style.animation = "sidebar--expand 0.25s ease forwards";
      mainContainer.style.animation =
        "main-container--expand 0.25s ease forwards";
    } else {
      sidebar.classList.add("sidebar--collapse");

      sidebar.setAttribute("title", "Mở rộng");

      sidebar.style.animation = "sidebar--collapse 0.25s ease forwards";
      mainContainer.style.animation =
        "main-container--collapse 0.25s ease forwards";
    }
  } catch (error) {
    console.log(
      "🚀 ~ file: sidebar.js:10 ~ expandCollapseSidebar ~ error:",
      error
    );
  }
}
