<template>
  <div class="step-4">
    <div class="header__step-4 flex-column">
      <div class="step-4__title--success">
        {{ recordSuccess }}/{{ totalRecord }} dòng dữ liệu nhập thành công
      </div>
      <div class="step-4__title--fail">
        {{ recordFail }}/{{ totalRecord }} dòng dữ liệu nhập không thành công
      </div>
    </div>

    <misa-loading-spinner size="large" v-if="isLoading" />
  </div>
</template>

<script>
export default {
  name: "EmployeeImportResult",

  props: {
    recordSuccess: {
      default: 0,
    },
    recordFail: {
      default: 0,
    },
    totalRecord: {
      default: 0,
    },
  },
};
</script>

<style scoped>
@import url(./import-result.css);
</style>
