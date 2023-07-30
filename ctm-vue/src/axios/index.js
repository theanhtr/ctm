import axios from "axios";
import { ProjectConfig } from "../config/config.js";
import { success, failure } from "../service/HttpResponse.js";

const MISAAxios = axios.create({
  baseURL: ProjectConfig.ApiConnection,
  headers: { Accept: "application/json", "Content-Type": "application/json" },
  withCredentials: true, // gửi cookie, session lên server
});

MISAAxios.interceptors.response.use(
  function (response) {
    return success(response);
  },
  function (error) {
    return failure(error.response);
  }
);

export default MISAAxios;
