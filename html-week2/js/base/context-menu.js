/**
 * lấy ra context menu custom
 */
let contextMenu = document.querySelector(".context-menu");

/**
 * bắt sự kiện khi ấn chuột phải trên màn hình
 * @author: TTANH (20/06/2023)
 * @param {*} event event
 */
window.oncontextmenu = (event) => {
  try {
    event.preventDefault();
    window.addEventListener("click", hideContextMenu);

    let contextMenuRect = contextMenu.getBoundingClientRect();

    contextMenu.style.visibility = "unset";

    if (event.clientX + contextMenuRect.width >= window.innerWidth) {
      contextMenu.style.left = "unset";
      contextMenu.style.right = window.innerWidth - event.clientX + "px";
    } else {
      contextMenu.style.right = "unset";
      contextMenu.style.left = event.clientX + "px";
    }

    if (event.clientY + contextMenuRect.height >= window.innerHeight) {
      contextMenu.style.bottom = window.innerHeight - event.clientY + "px";
      contextMenu.style.top = "unset";
    } else {
      contextMenu.style.top = event.clientY + "px";
      contextMenu.style.bottom = "unset";
    }
  } catch (error) {
    console.log("🚀 ~ file: context-menu.js:14 ~ error:", error);
  }
};

/**
 * hàm xử lý khi ẩn context menu bằng trái
 * @author: TTANH (20/06/2023)
 */
function hideContextMenu(event) {
  try {
    if (!contextMenu.contains(event.target)) {
      contextMenu.style.visibility = "hidden";
    }
  } catch (error) {
    console.log(
      "🚀 ~ file: context-menu.js:48 ~ hideContextMenu ~ error:",
      error
    );
  }
}
