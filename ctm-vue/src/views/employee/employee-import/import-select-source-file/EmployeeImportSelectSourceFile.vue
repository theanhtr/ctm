<template>
  <div class="content flex-row h1">
    <div class="content__left flex-column w1/2 h1">
      <misa-file-input
        ref="excelFile"
        :errorText="errorText.excelFile"
        idInput="excel-file-import"
        width="460px"
        :file="excelFile"
        @insert-file="onInsertFile"
      >
        <template #label>
          <div
            class="flex-row excel-file__input-label"
            style="margin-bottom: 4px"
          >
            <misa-icon icon="file-icon" width="19px" height="19px" />
            <div
              class="label-text flex-row"
              style="margin: 0px 4px 2px 6px; height: 16px; white-space: nowrap"
            >
              Chọn tệp Excel
              <span
                class="regular-text"
                style="font-size: 12px; margin-left: 8px; color: #9a9a9a"
                >Dung lượng tối đa 2MB</span
              >
            </div>
          </div>
        </template>
      </misa-file-input>

      <div class="content__left-download-template flex-row">
        <span class="download" @click="downloadBasicTemplate"
          ><span class="flex-row"
            >Tải tệp mẫu cơ bản
            <misa-icon
              icon="download-icon"
              height="13px"
              width="16px"
              tooltip="Tải tệp mẫu cơ bản" /></span
        ></span>
        <span class="download" @click="downloadFullTemplate"
          ><span class="flex-row"
            >Tải tệp mẫu đầy đủ
            <misa-icon
              icon="download-icon"
              height="13px"
              width="16px"
              tooltip="Tải tệp mẫu đầy đủ" /></span
        ></span>
      </div>

      <div class="file__add-setting flex-row" style="width: 460px">
        <misa-combobox
          :errorText="errorText.sheetContainsData"
          v-model="sheetContainsData"
          ref="sheetContainsData"
          type="single-row"
          labelText="Sheet chứa dữ liệu"
          :inputRequired="true"
          :rowsData="sheetsFormat"
          class="w1/2"
        />
        <misa-textfield
          :errorText="errorText.headerRowIndex"
          v-model="headerRowIndex"
          type="number_no_dot"
          idInput="header-row-index"
          labelText="Dòng tiêu đề là dòng số"
          :inputRequired="true"
          style="padding-left: 6px"
          class="w1/2"
          ref="headerRowIndex"
        />
      </div>

      <div class="file__import-mode">
        <misa-radio-input
          :errorText="errorText.importMode"
          v-model="importMode"
          :values="importModeOptions"
          nameRadioGroup="import-mode"
          :align="'column'"
          type="text"
          labelText="Phương thức nhập"
          class="w1"
          marginLabel="24px 0px 16px"
        />
      </div>
    </div>
    <div class="content__right w1/2 h1">
      <misa-separation-line
        style="
          height: 100%;
          width: 1px;
          border-right: 1px solid #000;
          margin: 0px;
        "
      />

      <div class="suggestion">
        <div class="inner-suggestion">
          <div class="flex items-center">
            <misa-icon icon="suggestion-icon" width="46px" height="46px" />
            <div class="label-text suggestion-label">Gợi ý</div>
          </div>
          <div class="suggestion-content download-template">
            <ul class="suggest-list">
              <li>
                <div>
                  <span @click="downloadBasicTemplate" class="download"
                    >Tải tệp mẫu cơ bản</span
                  >
                  để nhập những thông tin cơ bản.
                </div>
              </li>
              <li>
                <span @click="downloadFullTemplate" class="download"
                  >Tải tệp mẫu đầy đủ</span
                >
                để nhập tất cả các thông tin.
              </li>
              <li>
                Các thiết lập trong quá trình nhập sẽ được lưu để sử dụng trong
                các lần tiếp sau.
              </li>
              <li>
                <b>Thêm mới:</b> Dữ liệu trên tệp mà chưa có trong hệ thống sẽ
                được thêm mới vào. Dữ liệu mà đã có trên hệ thống sẽ không được
                cập nhật vào.
              </li>
              <li>
                <b>Cập nhật:</b> Dữ liệu trên tệp mà chưa có trong hệ thống sẽ
                được thêm mới vào. Dữ liệu mà đã có trên hệ thống sẽ được cập
                nhật vào.
              </li>
            </ul>
          </div>
        </div>
      </div>
    </div>
    <misa-error-popup
      v-if="isShowDialogError"
      :errorText="getFirstError.errorText"
      @close-click="closeBtnDialogErrorClick"
    />

    <misa-loading-spinner size="large" v-if="isLoading" />
  </div>
</template>

<script>
import EmployeeService from "@/service/EmployeeService.js";
import { ValidateConfig } from "@/config/config.js";

export default {
  name: "EmployeeImportSelectSourceFile",

  props: {
    excelFile: {
      required: true,
    },
  },

  data() {
    return {
      isLoading: false,

      isShowDialogError: false,

      sheetContainsData: "",
      headerRowIndex: 1,
      importMode: this.$_MISAEnum.IMPORT_MODE.ADD,

      sheets: [],

      importModeOptions: [
        {
          id: this.$_MISAEnum.IMPORT_MODE.ADD,
          name: "Thêm mới",
        },
        {
          id: this.$_MISAEnum.IMPORT_MODE.UPDATE,
          name: "Cập nhật",
        },
      ],

      errorText: {
        excelFile: "",
        sheetContainsData: "",
        headerRowIndex: "",
        importMode: "",
      },
    };
  },

  methods: {
    /**
     * kiểm tra file là đuôi xlsx và size <= 2mb
     * @author: TTANH (23/07/2023)
     * @param {File} file file muốn kiểm tra
     */
    fileValidate(file) {
      try {
        if (!file) {
          this.errorText.excelFile =
            this.$_MISAResource[
              this.$store.state.langCode
            ].ImportSelectSourceFileNoti.FileNotFound;

          this.isShowDialogError = true;
          this.$refs.excelFile.setInputToEmpty();
          return false;
        }

        if (file.size > ValidateConfig.MaxSizeFileUpload) {
          this.errorText.excelFile =
            this.$_MISAResource[
              this.$store.state.langCode
            ].ImportSelectSourceFileNoti.MaxSizeError;

          this.isShowDialogError = true;
          this.$refs.excelFile.setInputToEmpty();
          return false;
        }

        let fileExtention = file.name.split(".").pop();

        if (fileExtention !== "xlsx") {
          this.errorText.excelFile =
            this.$_MISAResource[
              this.$store.state.langCode
            ].ImportSelectSourceFileNoti.FormatError;

          this.isShowDialogError = true;
          this.$refs.excelFile.setInputToEmpty();
          return false;
        }

        this.errorText.excelFile = "";

        return true;
      } catch (error) {
        console.log(
          "🚀 ~ file: EmployeeImportSelectSourceFile.vue:203 ~ fileValidate ~ error:",
          error
        );
      }
    },

    /**
     * kiểm tra sheet được chọn và số thứ tự dòng tiêu đề
     * @author: TTANH (23/07/2023)
     */
    settingValidate() {
      try {
        if (this.headerRowIndex <= 0) {
          this.errorText.headerRowIndex =
            this.$_MISAResource[
              this.$store.state.langCode
            ].ImportSelectSourceFileNoti.HeaderIndexGreaterThanZero;

          this.isShowDialogError = true;
          return false;
        }

        if (!this.sheetContainsData) {
          this.errorText.sheetContainsData =
            this.$_MISAResource[
              this.$store.state.langCode
            ].ImportSelectSourceFileNoti.SheetNotFound;

          this.isShowDialogError = true;
          return false;
        }

        return true;
      } catch (error) {
        console.log(
          "🚀 ~ file: EmployeeImportSelectSourceFile.vue:240 ~ settingValidate ~ error:",
          error
        );
      }
    },

    /**
     * hàm xử lý khi người dùng thay đổi file thêm
     * @author: TTANH (23/07/2023)
     */
    async onInsertFile() {
      try {
        let file = this.$refs.excelFile.getFile();

        this.$emit("update:excelFile", file);

        if (this.fileValidate(file)) {
          this.isLoading = true;

          const res = await EmployeeService.postExcel(file);

          this.isLoading = false;

          if (res.success) {
            this.sheets = res.data.Sheets;
            this.headerRowIndex = res.data.HeaderRowIndex;

            if (this.sheetsFormat.length !== 0) {
              this.$refs.sheetContainsData.selectValue(this.sheetsFormat[0].id);
            }
          } else {
            if (
              res.errorCode === this.$_MISAEnum.ERROR_CODE.MAX_SIZE_FILE_ERROR
            ) {
              this.$store.commit("addToast", {
                type: "error",
                text: this.$_MISAResource[this.$store.state.langCode]
                  .ImportSelectSourceFileNoti.MaxSizeError,
              });

              this.$refs.excelFile.setInputToEmpty();
            } else if (
              res.errorCode === this.$_MISAEnum.ERROR_CODE.FORMAT_EXCEL_ERROR
            ) {
              this.$store.commit("addToast", {
                type: "error",
                text: this.$_MISAResource[this.$store.state.langCode]
                  .ImportSelectSourceFileNoti.FormatError,
              });

              this.$refs.excelFile.setInputToEmpty();
            } else {
              this.$store.commit("addToast", {
                type: "error",
                text: this.$_MISAResource[this.$store.state.langCode]
                  .ServerError.ConnectError,
              });

              this.$refs.excelFile.setInputToEmpty();
            }
          }
        }
      } catch (error) {
        console.log(
          "🚀 ~ file: EmployeeImportSelectSourceFile.vue:203 ~ onInsertFile ~ error:",
          error
        );
      }
    },

    /**
     * hàm gọi api để thêm các cài đặt cho file excel
     * @author: TTANH (23/07/2023)
     */
    async addExcelSetting() {
      try {
        let file = this.$refs.excelFile.getFile();

        if (this.fileValidate(file) && this.settingValidate()) {
          const dataSendApi = {
            headerRowIndex: this.headerRowIndex,
            sheetContainsData: this.sheetContainsData,
            importMode: this.importMode,
          };

          this.isLoading = true;

          const res = await EmployeeService.addSettingExcel(dataSendApi);

          this.isLoading = false;

          if (res.success) {
          } else {
            if (
              res.errorCode ===
              this.$_MISAEnum.ERROR_CODE.EXCEL_HEADER_DUPLICATE
            ) {
              this.$store.commit("addToast", {
                type: "error",
                text: this.$_MISAResource[this.$store.state.langCode]
                  .ImportSelectSourceFileNoti.HeaderDuplicate,
              });
            } else if (
              res.errorCode === this.$_MISAEnum.ERROR_CODE.EXCEL_HEADER_EMPTY
            ) {
              this.$store.commit("addToast", {
                type: "error",
                text: this.$_MISAResource[this.$store.state.langCode]
                  .ImportSelectSourceFileNoti.HeaderEmpty,
              });
            } else if (
              res.errorCode === this.$_MISAEnum.ERROR_CODE.SHEET_IS_EMPTY
            ) {
              this.$store.commit("addToast", {
                type: "error",
                text: this.$_MISAResource[this.$store.state.langCode]
                  .ImportSelectSourceFileNoti.SheetIsEmpty,
              });
            }
          }

          return res;
        } else {
          return {
            success: false,
          };
        }
      } catch (error) {
        console.log(
          "🚀 ~ file: EmployeeImportSelectSourceFile.vue:263 ~ addExcelSetting ~ error:",
          error
        );
      }
    },

    /**
     * Tải mẫu cơ bản excel cơ bản của nhân viên
     * @author: TTANH (26/07/2023)
     */
    async downloadBasicTemplate() {
      this.isLoading = true;

      await EmployeeService.downloadBasicTemplate();

      this.isLoading = false;
    },

    /**
     * Tải mẫu excel đầy đủ của nhân viên
     * @author: TTANH (26/07/2023)
     */
    async downloadFullTemplate() {
      this.isLoading = true;

      await EmployeeService.downloadFullTemplate();

      this.isLoading = false;
    },

    /**
     * xử lý khi ấn ẩn dialog thông báo lỗi
     * @author: TTANH (23/07/2023)
     */
    closeBtnDialogErrorClick() {
      try {
        this.isShowDialogError = false;

        if (this.$refs[this.getFirstError.errorAttr].focus) {
          this.$refs[this.getFirstError.errorAttr].focus();
        }
      } catch (error) {
        console.log(
          "🚀 ~ file: EmployeeImportSelectSourceFile.vue:218 ~ closeBtnDialogErrorClick ~ error:",
          error
        );
      }
    },
  },

  computed: {
    getFirstError() {
      let errorAttr = "";
      let errorText = "";

      for (let attr in this.errorText) {
        if (this.errorText[attr] !== "") {
          errorText = this.errorText[attr];
          errorAttr = attr;
          break;
        }
      }

      return {
        errorAttr,
        errorText,
      };
    },

    /**
     * format lại sheet để truyền vào combobox
     * @author: TTANH (23/07/2023)
     */
    sheetsFormat() {
      let sheetsFormated = [];

      this.sheets.forEach((sheet) => {
        var sheetFormat = {};

        sheetFormat.id = sheet;
        sheetFormat.code = sheet;
        sheetFormat.name = sheet;

        sheetsFormated.push(sheetFormat);
      });

      return sheetsFormated;
    },
  },

  watch: {
    headerRowIndex() {
      this.errorText.headerRowIndex = "";
    },
    sheetContainsData() {
      this.errorText.sheetContainsData = "";
    },
  },
};
</script>

<style scoped>
@import url(./import-select-source-file.css);
</style>
