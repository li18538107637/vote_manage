package com.cnstock.votemgt.dto;


import java.util.Date;

public class VoteMainDto {
    private Integer id;
   private String voteId;
   private String title;
   private String startTime;
   private String endTime;
   private int isValid;
   private int needCount;
   private String weixinShareTitle;
   private String weixinShareDescription;
   private String weixinShareLogo;
   private String updateBy;
   private String createBy;
   private Date createTime;
   private int type;

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getUpdateBy() {
        return updateBy;
    }

    public void setUpdateBy(String updateBy) {
        this.updateBy = updateBy;
    }

    public String getCreateBy() {
        return createBy;
    }

    public void setCreateBy(String createBy) {
        this.createBy = createBy;
    }

    public String getVoteId() {
        return voteId;
    }

    public void setVoteId(String voteId) {
        this.voteId = voteId;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getStartTime() {
        return startTime;
    }

    public void setStartTime(String startTime) {
        this.startTime = startTime;
    }

    public String getEndTime() {
        return endTime;
    }

    public void setEndTime(String endTime) {
        this.endTime = endTime;
    }

    public int getIsValid() {
        return isValid;
    }

    public void setIsValid(int isValid) {
        this.isValid = isValid;
    }

    public int getNeedCount() {
        return needCount;
    }

    public void setNeedCount(int needCount) {
        this.needCount = needCount;
    }

    public String getWeixinShareTitle() {
        return weixinShareTitle;
    }

    public void setWeixinShareTitle(String weixinShareTitle) {
        this.weixinShareTitle = weixinShareTitle;
    }

    public String getWeixinShareDescription() {
        return weixinShareDescription;
    }

    public void setWeixinShareDescription(String weixinShareDescription) {
        this.weixinShareDescription = weixinShareDescription;
    }

    public String getWeixinShareLogo() {
        return weixinShareLogo;
    }

    public void setWeixinShareLogo(String weixinShareLogo) {
        this.weixinShareLogo = weixinShareLogo;
    }

    public int getType() {
        return type;
    }

    public void setType(int type) {
        this.type = type;
    }
}
