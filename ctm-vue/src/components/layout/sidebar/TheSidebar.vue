<template>
  <div
    class="sidebar"
    :class="$store.state.isExpandSidebar ? '' : 'sidebar--collapse'"
  >
    <div class="sidebar__logo-container">
      <misa-icon
        icon="sidebar__control--white"
        tooltip="Mở rộng sidebar"
        @click="expandSidebar"
        v-if="!$store.state.isExpandSidebar"
        height="fit-content"
        width="fit-content"
      ></misa-icon>
      <a
        href="https://amisapp.misa.vn/home"
        class="toggle-icon"
        title="Misa App"
        v-else
      ></a>

      <router-link
        class="logo"
        to="/app/dashboard"
        title="Tổng quan"
        v-if="$store.state.isExpandSidebar"
      ></router-link>
    </div>

    <div class="sidebar__nav">
      <div class="sidebar__quick-add-button">
        <misa-button
          type="sub"
          icon="plus--green"
          width="124px"
          colorText="white"
          v-if="$store.state.isExpandSidebar"
          :border="'2px solid white'"
          >Thêm nhanh</misa-button
        >
        <misa-button type="sub" icon="plus--green" width="30px" v-else />
        >
      </div>
      <div class="sidebar__menu-item-container">
        <router-link
          to="/app/dashboard"
          class="menu-item"
          exact
          activeClass="menu-item--selected"
          title="Tổng quan"
        >
          <misa-icon icon="sidebar__overview"></misa-icon>
          <div class="sidebar__text">Tổng quan</div>
        </router-link>
        <router-link
          to="/app/employee"
          class="menu-item"
          exact
          activeClass="menu-item--selected"
          title="Tiền mặt"
        >
          <misa-icon icon="sidebar__cash"></misa-icon>
          <div class="sidebar__text">Tiền mặt</div>
        </router-link>
        <router-link
          to="/"
          activeClass="menu-item--selected"
          exact
          class="menu-item"
          title="Tiền gửi"
        >
          <misa-icon icon="sidebar__deposits"></misa-icon>
          <div class="sidebar__text">Tiền gửi</div>
        </router-link>
        <router-link
          to="/"
          activeClass="menu-item--selected"
          exact
          class="menu-item"
          title="Mua hàng"
        >
          <misa-icon icon="sidebar__purchase"></misa-icon>
          <div class="sidebar__text">Mua hàng</div>
        </router-link>
        <router-link
          to="/"
          activeClass="menu-item--selected"
          exact
          class="menu-item"
          title="Bán hàng"
        >
          <misa-icon icon="sidebar__sell"></misa-icon>
          <div class="sidebar__text">Bán hàng</div>
        </router-link>
        <router-link
          to="/"
          activeClass="menu-item--selected"
          exact
          class="menu-item"
          title="Quản lý hóa đơn"
        >
          <misa-icon icon="sidebar__invoice-management"></misa-icon>
          <div class="sidebar__text">Quản lý hóa đơn</div>
        </router-link>
        <router-link
          to="/"
          activeClass="menu-item--selected"
          exact
          class="menu-item"
          title="Kho"
        >
          <misa-icon icon="sidebar__warehouse"></misa-icon>
          <div class="sidebar__text">Kho</div>
        </router-link>
        <router-link
          to="/"
          activeClass="menu-item--selected"
          exact
          class="menu-item"
          title="Công cụ"
        >
          <misa-icon icon="sidebar__tool"></misa-icon>
          <div class="sidebar__text">Công cụ</div>
        </router-link>
        <router-link
          to="/"
          activeClass="menu-item--selected"
          exact
          class="menu-item"
          title="Tài sản cố định"
        >
          <misa-icon icon="sidebar__fixed-assets"></misa-icon>
          <div class="sidebar__text">Tài sản cố định</div>
        </router-link>
        <router-link
          to="/"
          activeClass="menu-item--selected"
          exact
          class="menu-item"
          title="Tiền lương"
        >
          <misa-icon icon="sidebar__salary"></misa-icon>
          <div class="sidebar__text">Tiền lương</div>
        </router-link>
        <router-link
          to="/"
          activeClass="menu-item--selected"
          exact
          class="menu-item"
          title="Thuế"
        >
          <misa-icon icon="sidebar__tax"></misa-icon>
          <div class="sidebar__text">Thuế</div>
        </router-link>
        <router-link
          to="/"
          activeClass="menu-item--selected"
          exact
          class="menu-item"
          title="Giá thành"
        >
          <misa-icon icon="sidebar__price"></misa-icon>
          <div class="sidebar__text">Giá thành</div>
        </router-link>
        <router-link
          to="/"
          activeClass="menu-item--selected"
          exact
          class="menu-item"
          title="Vay vốn"
        >
          <misa-icon icon="sidebar__loans"></misa-icon>
          <div class="sidebar__text">Vay vốn</div>
        </router-link>
        <router-link
          to="/"
          activeClass="menu-item--selected"
          exact
          class="menu-item"
          title="Tổng hợp"
        >
          <misa-icon icon="sidebar__synthetic"></misa-icon>
          <div class="sidebar__text">Tổng hợp</div>
        </router-link>
        <router-link
          to="/"
          activeClass="menu-item--selected"
          exact
          class="menu-item"
          title="Ngân sách"
        >
          <misa-icon icon="sidebar__budget"></misa-icon>
          <div class="sidebar__text">Ngân sách</div>
        </router-link>
        <router-link
          to="/"
          activeClass="menu-item--selected"
          exact
          class="menu-item"
          title="Báo cáo"
        >
          <misa-icon icon="sidebar__report"></misa-icon>
          <div class="sidebar__text">Báo cáo</div>
        </router-link>
        <router-link
          to="/"
          activeClass="menu-item--selected"
          exact
          class="menu-item"
          title="Phân tích tài chính"
        >
          <misa-icon icon="sidebar__financial-analysis"></misa-icon>
          <div class="sidebar__text">Phân tích tài chính</div>
        </router-link>
        <misa-separation-line></misa-separation-line>
        <router-link
          to="/"
          activeClass="menu-item--selected"
          exact
          class="menu-item"
          title="Danh mục"
        >
          <misa-icon icon="sidebar__category"></misa-icon>
          <div class="sidebar__text">Danh mục</div>
        </router-link>
        <router-link
          to="/"
          activeClass="menu-item--selected"
          exact
          class="menu-item"
          title="Số dư ban đầu"
        >
          <misa-icon icon="sidebar__initial-balance"></misa-icon>
          <div class="sidebar__text">Số dư ban đầu</div>
        </router-link>
        <router-link
          to="/"
          activeClass="menu-item--selected"
          exact
          class="menu-item"
          title="Kiến thức"
        >
          <misa-icon icon="sidebar__knowledge"></misa-icon>
          <div class="sidebar__text">Kiến thức</div>
        </router-link>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "TheSidebar",
  methods: {
    /**
     * bắt sự kiện mở rộng sidebar
     * @author: TTANH (25/06/2023)
     */
    expandSidebar() {
      try {
        this.$store.commit("toggleSidebar");
      } catch (error) {
        console.log(
          "🚀 ~ file: TheSidebar.vue:129 ~ expandSidebar ~ error:",
          error
        );
      }
    },
  },
};
</script>

<style>
@import url(./sidebar.css);
</style>
