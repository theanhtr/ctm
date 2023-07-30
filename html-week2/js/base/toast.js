/**
 * các kiểu của toast message
 * @author: TTANH (20/06/2023)
 */
let toastTypeTest = [
  "toast--error",
  "toast--success",
  "toast--info",
  "toast--warning",
];

/**
 * nơi chứa tất cả các toast
 * @author: TTANH (20/06/2023)
 */
let toastGroupContainer = document.querySelector(".toast-group");

/**
 * tạo toast message mới tùy loại status
 * @author: TTANH (20/06/2023)
 * @param {string} status loại toast message
 */
function createToast(status) {
  try {
    let toast = document.createElement("div");
    toast.classList.add("toast");
    toast.classList.add(status);

    toast.innerHTML = `<div class="toast__left">
            <div class="toast__icon"></div>
            <div class="toast__text">
              <span class="bold-text">Thành công! </span>Công việc đã bị xóa.
            </div>
          </div>
          <div class="toast__right">
            <div class="toast__action">Hoàn tác</div>
            <div class="toast__close">
              <img
                height="16px"
                width="16px"
                src="../../assets/icon/x.svg"
                alt="close"
              />
            </div>
          </div>
          <div class="toast__count-down"></div>`;

    let closeIcon = toast.querySelector(".toast__close");

    closeIcon.onclick = () => {
      toast.style.animation = "opacity--out 0.25s ease forwards";

      setTimeout(() => {
        toast.remove();
      }, 250);

      return;
    };

    //sử dụng để tạo chuyển động trượt xuống khi thêm toast
    let toastOld = toastGroupContainer.childNodes;

    toastOld.forEach((e) => {
      e.style.animation = "none";
    });

    setTimeout(() => {
      toastOld.forEach((e) => {
        e.style.animation = "y-bottom--out 0.25s ease backwards";
      });
    }, 100);

    setTimeout(() => {
      toastGroupContainer.appendChild(toast);
    }, 350);

    //sau 5s thì tự động xóa toast
    setTimeout(() => {
      toast.style.animation = "opacity--out 0.25s ease forwards";
    }, 5100);

    setTimeout(() => {
      toast.remove();
    }, 5250);
  } catch (error) {
    console.log("🚀 ~ file: toast.js:26 ~ createToast ~ error:", error);
  }
}

/**
 * tạo toast message ngẫu nhiên trong 4 loại toast
 * @author: TTANH (20/06/2023)
 */
function createFakeToast() {
  try {
    createToast(toastTypeTest[Math.floor(Math.random() * 4)]);
  } catch (error) {
    console.log("🚀 ~ file: toast.js:93 ~ createFakeToast ~ error:", error);
  }
}
