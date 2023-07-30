<template>
  <div class="toast" :class="'toast--' + type">
    <div class="toast__left">
      <misa-icon
        :icon="type + '--large'"
        scale="0.9"
        height="auto"
        width="auto"
      />
      <div class="toast__text">
        <span class="bold-text">{{ defaultTitle }} </span> <slot></slot>
      </div>
    </div>

    <misa-icon icon="close" @click="$emit('clickCloseToast')" />

    <div class="toast__count-down"></div>
  </div>
</template>

<script>
export default {
  name: "MISAToast",
  props: {
    type: {
      default: "info",
      validator: function (val) {
        return ["info", "error", "warning", "success"].includes(val);
      },
    },
  },
  computed: {
    defaultTitle() {
      switch (this.type) {
        case "info":
          return this.$_MISAResource[this.$store.state.langCode].ToastTitle
            .Info;

        case "warning":
          return this.$_MISAResource[this.$store.state.langCode].ToastTitle
            .Warning;

        case "error":
          return this.$_MISAResource[this.$store.state.langCode].ToastTitle
            .Error;

        case "success":
          return this.$_MISAResource[this.$store.state.langCode].ToastTitle
            .Success;

        default:
          break;
      }
    },
  },
};
</script>

<style scoped>
@import url(./toast.css);
</style>
