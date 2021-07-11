
package com.govt.model;

import java.util.Date;

public class CommitteeData {
    private String committeeName;
    private String committeeType;
    private String committeeEmail;
    private String committeePassword;
    private String committeeRegistrationDate;
    private int isVerified;
    private int isActive;
    private int parentId;

    public String getCommitteeName() {
        return committeeName;
    }

    public void setCommitteeName(String committeeName) {
        this.committeeName = committeeName;
    }

    public String getCommitteeType() {
        return committeeType;
    }

    public void setCommitteeType(String committeetype) {
        this.committeeType = committeetype;
    }

    public String getCommitteeEmail() {
        return committeeEmail;
    }

    public void setCommitteeEmail(String committeeEmail) {
        this.committeeEmail = committeeEmail;
    }

    public String getCommitteePassword() {
        return committeePassword;
    }

    public void setCommitteePassword(String committeePassword) {
        this.committeePassword = committeePassword;
    }

    public String getCommitteeRegistrationDate() {
        return committeeRegistrationDate;
    }

    public void setCommitteeRegistrationDate(String committeeRegistrationDate) {
        this.committeeRegistrationDate = committeeRegistrationDate;
    }

    public int getIsVerified() {
        return isVerified;
    }

    public void setIsVerified(int isVerified) {
        this.isVerified = isVerified;
    }

    public int getIsActive() {
        return isActive;
    }

    public void setIsActive(int isActive) {
        this.isActive = isActive;
    }

    public int getParentId() {
        return parentId;
    }

    public void setParentId(int parentId) {
        this.parentId = parentId;
    }
}
