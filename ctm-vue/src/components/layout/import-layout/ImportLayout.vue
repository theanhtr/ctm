<template>
  <div class="import-layout">
    <div class="import-header">
      <div class="header-left">
        <p class="bold-text">Nhập dữ liệu từ Excel</p>
      </div>
      <div class="header-right">
        <misa-icon icon="help" title="Giúp (F1)" />
        <misa-icon
          @click="closeImport"
          icon="close"
          style="margin-left: 3px"
          title="Đóng (ESC)"
        />
      </div>
    </div>
    <div class="import-content">
      <router-view />
    </div>
  </div>
</template>

<script>
export default {
  name: "ImportLayout",

  mounted() {
    window.addEventListener("keydown", this.onKeydown);
  },

  unmounted() {
    window.removeEventListener("keydown", this.onKeydown);
  },

  methods: {
    /**
     * Hàm để xử lý khi ấn "Đóng"
     * @author: TTANH (23/07/2023)
     */
    closeImport() {
      this.$router.push("/");
    },

    /**
     * Hàm để xử lý khi người dùng sd phím
     * @param {*} event
     */
    onKeydown(event) {
      if (event.keyCode === this.$_MISAEnum.KEY_CODE.ESC) {
        event.preventDefault();
        this.closeImport();
      }
    },
  },
};
</script>

<style scoped>
@import url(./import-layout.css);
</style>
