import { createStore } from "vuex";
import { findIndexByAttribute, generateUuid } from "@/helper/common.js";

export default createStore({
  state: {
    isExpandSidebar: true,
    langCode: "VN",

    /**
     * mỗi 1 toast sẽ có định dạng
     * {
     *  id: "",
     *  type: "",
     *  text: ""
     * }
     */
    toasts: [],

    /**
     * có 2 định dạng:
     *  + dd/MM/yyyy
     *  + MM/dd/yyyy
     */
    formatDate: "dd/MM/yyyy",
  },
  getters: {},
  mutations: {
    /**
     * hàm thay đổi trạng thái ẩn hiện của sidebar
     * @author: TTANH (02/07/2023)
     * @param {*} state
     */
    toggleSidebar(state) {
      state.isExpandSidebar = !state.isExpandSidebar;
    },

    /**
     * hàm thay đổi ngôn ngữ của ứng dụng
     *  - VN: Tiếng Việt
     *  - EN: Tiếng Anh
     * @author: TTANH (02/07/2023)
     * @param {*} state
     */
    changeLangCode(state) {
      if (state.langCode === "VN") {
        state.langCode = "EN";
      } else {
        state.langCode = "VN";
      }
    },

    /**
     * thêm 1 toast mới
     * @author: TTANH (02/07/2023)
     * @param {*} state
     * @param {string} type loại toast
     * @param {string} text thông tin trong toast
     */
    addToast(state, { type, text }) {
      try {
        const id = generateUuid();

        state.toasts.push({
          id,
          type,
          text,
        });

        setTimeout(() => {
          let index = findIndexByAttribute(state.toasts, "id", id);

          if (index !== -1) {
            state.toasts.splice(index, 1);
          }
        }, 5000);
      } catch (error) {
        console.log("🚀 ~ file: index.js:40 ~ addToast ~ error:", error);
      }
    },

    /**
     * xóa 1 toast
     * @author: TTANH (02/07/2023)
     * @param {*} state
     * @param {*} id id của toast
     */
    removeToast(state, { id }) {
      try {
        let index = findIndexByAttribute(state.toasts, "id", id);

        if (index !== -1) {
          state.toasts.splice(index, 1);
        }
      } catch (error) {
        console.log("🚀 ~ file: index.js:65 ~ removeToast ~ error:", error);
      }
    },
  },
  actions: {},
  modules: {},
});
