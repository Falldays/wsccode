package com.qst.ssm.entity;

public class Admin {
    //管理员ID
    private Integer adminId;
    //管理员NO
    private String adminNo;
    //管理员姓名
    private String adminName;
    //管理员密码
    private String password;
    //管理员电话
    private String mobile;
    //管理员性别
    private int sex;

    public Admin() {
    }

    public Admin(Integer adminId, String adminNo, String adminName, String password, String mobile, int sex) {
        this.adminId = adminId;
        this.adminNo = adminNo;
        this.adminName = adminName;
        this.password = password;
        this.mobile = mobile;
        this.sex = sex;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getAdminNo() {
        return adminNo;
    }

    public void setAdminNo(String adminNo) {
        this.adminNo = adminNo;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public int getSex() {
        return sex;
    }

    public void setSex(int sex) {
        this.sex = sex;
    }

    @Override
    public String toString() {
        return "Admin{" +
                "adminId=" + adminId +
                ", adminNo='" + adminNo + '\'' +
                ", adminName='" + adminName + '\'' +
                ", password='" + password + '\'' +
                ", mobile=" + mobile +
                ", sex=" + sex +
                '}';
    }
}
