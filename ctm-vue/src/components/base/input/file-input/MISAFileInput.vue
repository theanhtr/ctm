<template>
  <div class="file-input-container" :style="styleInputContainer">
    <label v-if="labelText !== ''" class="label-input">
      <slot name="label"></slot>
      <div v-if="inputRequired" style="color: red; padding-left: 3px">*</div>
    </label>
    <input
      :id="idInput"
      type="file"
      ref="input"
      @mouseenter="hoverInput = true"
      @mouseleave="hoverInput = false"
      @change="$emit('insert-file')"
      class="file-input__input"
      :style="styleInput"
      accept=".xlsx"
    />

    <misa-tooltip v-if="errorText !== '' && hoverInput">{{
      errorText
    }}</misa-tooltip>
  </div>
</template>

<script>
export default {
  name: "MISAFileInput",

  data() {
    return {
      hoverInput: false,
    };
  },

  props: {
    idInput: {
      required: true,
      type: String,
    },
    height: {
      default: "auto",
    },
    width: {
      default: "460px",
    },
    placeholder: {
      default: "Kéo/ thả tệp vào đây hoặc bấm vào đây",
    },
    inputRequired: {
      default: true,
    },
    errorText: {
      default: "",
    },
    file: {
      default: "",
    },
  },

  mounted() {
    if (this.file) {
      //this.$refs.input.value = this.file;
    }
  },

  methods: {
    /**
     * hàm để lấy file được insert trong input chính
     * @author: TTANH (23/07/2023)
     */
    getFile() {
      return this.$refs.input.files[0];
    },

    /**
     * Xử lý khi file lỗi thì không thêm vào
     */
    setInputToEmpty() {
      this.$refs.input.value = "";
    },
  },

  computed: {
    styleInputContainer() {
      return {
        position: "relative",
        height: this.height,
        width: this.width,
        minWidth: this.width,
        maxWidth: this.width,
      };
    },

    styleInput() {
      return {
        border: `1px solid ${this.borderInputColor}`,
      };
    },

    borderInputColor() {
      if (this.errorText !== "") {
        return "red";
      } else if (this.hoverInput) {
        return "var(--primary-btn--hover-background-color)";
      } else {
        return "var(--border-color-default)";
      }
    },
  },
};
</script>

<style scoped>
@import url(./file-input.css);
</style>
