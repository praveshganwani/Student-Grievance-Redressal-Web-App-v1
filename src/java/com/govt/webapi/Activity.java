/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.govt.webapi;

import java.io.Serializable;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Pravesh Ganwani
 */
@Entity
@Table(name = "activity")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Activity.findAll", query = "SELECT a FROM Activity a")
    , @NamedQuery(name = "Activity.findByActivityId", query = "SELECT a FROM Activity a WHERE a.activityId = :activityId")
    , @NamedQuery(name = "Activity.findByActivityTime", query = "SELECT a FROM Activity a WHERE a.activityTime = :activityTime")
    , @NamedQuery(name = "Activity.findByActivityType", query = "SELECT a FROM Activity a WHERE a.activityType = :activityType")
    , @NamedQuery(name = "Activity.findByActivityFrom", query = "SELECT a FROM Activity a WHERE a.activityFrom = :activityFrom")
    , @NamedQuery(name = "Activity.findByActivityTo", query = "SELECT a FROM Activity a WHERE a.activityTo = :activityTo")})
public class Activity implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "activity_id")
    private Integer activityId;
    @Column(name = "activity_time")
    @Temporal(TemporalType.TIMESTAMP)
    private Date activityTime;
    @Column(name = "activity_type")
    private String activityType;
    @Column(name = "activity_from")
    private Integer activityFrom;
    @Column(name = "activity_to")
    private Integer activityTo;
    @JoinColumn(name = "complaint_id", referencedColumnName = "complaint_id")
    @ManyToOne
    private Grievances complaintId;

    public Activity() {
    }

    public Activity(Integer activityId) {
        this.activityId = activityId;
    }

    public Integer getActivityId() {
        return activityId;
    }

    public void setActivityId(Integer activityId) {
        this.activityId = activityId;
    }

    public Date getActivityTime() {
        return activityTime;
    }

    public void setActivityTime(Date activityTime) {
        this.activityTime = activityTime;
    }

    public String getActivityType() {
        return activityType;
    }

    public void setActivityType(String activityType) {
        this.activityType = activityType;
    }

    public Integer getActivityFrom() {
        return activityFrom;
    }

    public void setActivityFrom(Integer activityFrom) {
        this.activityFrom = activityFrom;
    }

    public Integer getActivityTo() {
        return activityTo;
    }

    public void setActivityTo(Integer activityTo) {
        this.activityTo = activityTo;
    }

    public Grievances getComplaintId() {
        return complaintId;
    }

    public void setComplaintId(Grievances complaintId) {
        this.complaintId = complaintId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (activityId != null ? activityId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Activity)) {
            return false;
        }
        Activity other = (Activity) object;
        if ((this.activityId == null && other.activityId != null) || (this.activityId != null && !this.activityId.equals(other.activityId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.govt.webapi.Activity[ activityId=" + activityId + " ]";
    }
    
}
