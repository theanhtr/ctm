<template>
  <div class="step-2">
    <div class="header__step-2">
      <div class="header__step-2__left">
        <div class="step-2__title label-text">
          Ghép cột trên phần mềm với cột trên tệp dữ liệu
        </div>
      </div>
      <div class="header__step-2__right"></div>
    </div>
    <div class="content__step-2">
      <misa-table
        ref="headerMergeTable"
        :columnsInfo="headerMergeColumnsInfo"
        :rowsData="employeeHeadersInfo"
        :oneRowSelect="true"
        :comboboxRowData="headersInfoComboboxData"
        @checked-row="checkedRow"
        @unchecked-row="uncheckedRow"
      />
    </div>

    <misa-error-popup
      v-if="isShowDialogError"
      :errorText="errorText"
      @close-click="closeBtnDialogErrorClick"
    />

    <misa-loading-spinner size="large" v-if="isLoading" />
  </div>
</template>

<script>
import { headersInfo } from "./employeeHeadersInfo.js";
import { headerMergeColumnsInfo } from "./headerMergeColumnsInfo.js";
import { findIndexByAttribute } from "@/helper/common.js";
import EmployeeService from "@/service/EmployeeService.js";

export default {
  name: "EmployeeImportHeaderMerge",
  props: {
    headersInfoComboboxData: {
      required: true,
    },
  },
  data() {
    return {
      searchText: "",
      employeeHeadersInfo: [...headersInfo],
      headerMergeColumnsInfo: [...headerMergeColumnsInfo],

      isShowDialogError: false,
      isLoading: false,
      errorText: "",
    };
  },

  methods: {
    /**
     * xử lý khi chọn checkbox ở 1 row
     * @author: TTANH (23/07/2023)
     * @param {string} rowId: id của record được chọn
     */
    checkedRow(rowId) {
      try {
        var index = findIndexByAttribute(this.employeeHeadersInfo, "id", rowId);

        if (index != -1) {
          this.employeeHeadersInfo[index].isRequired = true;
          this.employeeHeadersInfo[index].isSelected = true;
        }
      } catch (error) {
        console.log(
          "🚀 ~ file: EmployeeImportHeaderMerge.vue:59 ~ checkedRow ~ error:",
          error
        );
      }
    },

    /**
     * xử lý khi bỏ chọn checkbox ở 1 row
     * @author: TTANH (23/07/2023)
     * @param {string} rowId: id của record được chọn
     */
    uncheckedRow(rowId) {
      try {
        var index = findIndexByAttribute(this.employeeHeadersInfo, "id", rowId);

        if (index != -1) {
          this.employeeHeadersInfo[index].isRequired = false;
          this.employeeHeadersInfo[index].isSelected = false;
        }
      } catch (error) {
        console.log(
          "🚀 ~ file: EmployeeImportHeaderMerge.vue:80 ~ uncheckedRow ~ error:",
          error
        );
      }
    },

    /**
     * Hàm validate các trường bắt buộc phải ánh xạ
     * @author: TTANH (24/07/2023)
     */
    headerIndexValidate() {
      for (var employeeHeaderInfo of this.employeeHeadersInfo) {
        if (
          employeeHeaderInfo.isRequired &&
          (employeeHeaderInfo.excelColumnIndex <= 0 ||
            employeeHeaderInfo.excelColumnIndex == "")
        ) {
          this.errorText =
            this.$_MISAResource[
              this.$store.state.langCode
            ].ImportHeaderMergeNoti.HeaderRequiredNotMap;

          this.isShowDialogError = true;

          return false;
        }
      }

      return true;
    },

    /**
     * Đóng thông báo lỗi
     * @author: TTANH (24/07/2023)
     */
    closeBtnDialogErrorClick() {
      this.isShowDialogError = false;
      this.errorText = "";
    },

    /**
     * Hàm thêm các cài đặt cho việc ánh xạ từ header trong excel
     * @author: TTANH (24/07/2023)
     */
    async headerMapColumnExcel() {
      try {
        if (this.headerIndexValidate()) {
          let dataSendApi = [];

          this.employeeHeadersInfo.forEach((employeeHeaderInfo) => {
            if (employeeHeaderInfo.excelColumnIndex > 0) {
              dataSendApi.push({
                HeaderColumnIndex: employeeHeaderInfo.excelColumnIndex,
                ServerColumnName: employeeHeaderInfo.serverName,
              });
            }
          });

          this.isLoading = true;

          const res = await EmployeeService.headerMapColumnExcel(dataSendApi);

          if (res.success) {
          } else {
            if (
              res.errorCode === this.$_MISAEnum.ERROR_CODE.WRONG_FORMAT_DATE
            ) {
              this.$store.commit("addToast", {
                type: "error",
                text: this.$_MISAResource[this.$store.state.langCode]
                  .ClientError.WrongFormatDate,
              });
            } else if (
              res.errorCode ===
              this.$_MISAEnum.ERROR_CODE.EXCEL_HEADER_REQUIRED_NOT_MAP
            ) {
              this.$store.commit("addToast", {
                type: "error",
                text: this.$_MISAResource[this.$store.state.langCode]
                  .ImportHeaderMergeNoti.HeaderRequiredNotMap,
              });
            }
          }

          this.isLoading = false;

          return res;
        } else {
          return {
            success: false,
          };
        }
      } catch (error) {
        console.log(
          "🚀 ~ file: EmployeeImportHeaderMerge.vue:144 ~ headerMapColumnExcel ~ error:",
          error
        );
      }
    },
  },
};
</script>

<style scoped>
@import url(./import-header-merge.css);
</style>
