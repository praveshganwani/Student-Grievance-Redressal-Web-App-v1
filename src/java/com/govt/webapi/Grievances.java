/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.govt.webapi;

import java.io.Serializable;
import java.util.Collection;
import java.util.Date;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.xml.bind.annotation.XmlRootElement;
import javax.xml.bind.annotation.XmlTransient;

/**
 *
 * @author Pravesh Ganwani
 */
@Entity
@Table(name = "grievances")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Grievances.findAll", query = "SELECT g FROM Grievances g")
    , @NamedQuery(name = "Grievances.findByComplaintId", query = "SELECT g FROM Grievances g WHERE g.complaintId = :complaintId")
    , @NamedQuery(name = "Grievances.findByComplaintTitle", query = "SELECT g FROM Grievances g WHERE g.complaintTitle = :complaintTitle")
    , @NamedQuery(name = "Grievances.findByComplaintDetail", query = "SELECT g FROM Grievances g WHERE g.complaintDetail = :complaintDetail")
    , @NamedQuery(name = "Grievances.findByCategory", query = "SELECT g FROM Grievances g WHERE g.category = :category")
    , @NamedQuery(name = "Grievances.findByComplaintDatetime", query = "SELECT g FROM Grievances g WHERE g.complaintDatetime = :complaintDatetime")
    , @NamedQuery(name = "Grievances.findByIssolved", query = "SELECT g FROM Grievances g WHERE g.issolved = :issolved")
    , @NamedQuery(name = "Grievances.findByIsanonymous", query = "SELECT g FROM Grievances g WHERE g.isanonymous = :isanonymous")})
public class Grievances implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "complaint_id")
    private Integer complaintId;
    @Column(name = "complaint_title")
    private String complaintTitle;
    @Column(name = "complaint_detail")
    private String complaintDetail;
    @Column(name = "category")
    private String category;
    @Column(name = "complaint_datetime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date complaintDatetime;
    @Column(name = "issolved")
    private Integer issolved;
    @Lob
    @Column(name = "attachment")
    private byte[] attachment;
    @Column(name = "isanonymous")
    private Integer isanonymous;
    @OneToMany(mappedBy = "complaintId")
    private Collection<Activity> activityCollection;
    @JoinColumn(name = "committee_id", referencedColumnName = "id")
    @ManyToOne
    private Committees committeeId;
    @JoinColumn(name = "student_id", referencedColumnName = "student_id")
    @ManyToOne(optional = false)
    private Students studentId;

    public Grievances() {
    }

    public Grievances(Integer complaintId) {
        this.complaintId = complaintId;
    }

    public Integer getComplaintId() {
        return complaintId;
    }

    public void setComplaintId(Integer complaintId) {
        this.complaintId = complaintId;
    }

    public String getComplaintTitle() {
        return complaintTitle;
    }

    public void setComplaintTitle(String complaintTitle) {
        this.complaintTitle = complaintTitle;
    }

    public String getComplaintDetail() {
        return complaintDetail;
    }

    public void setComplaintDetail(String complaintDetail) {
        this.complaintDetail = complaintDetail;
    }

    public String getCategory() {
        return category;
    }

    public void setCategory(String category) {
        this.category = category;
    }

    public Date getComplaintDatetime() {
        return complaintDatetime;
    }

    public void setComplaintDatetime(Date complaintDatetime) {
        this.complaintDatetime = complaintDatetime;
    }

    public Integer getIssolved() {
        return issolved;
    }

    public void setIssolved(Integer issolved) {
        this.issolved = issolved;
    }

    public byte[] getAttachment() {
        return attachment;
    }

    public void setAttachment(byte[] attachment) {
        this.attachment = attachment;
    }

    public Integer getIsanonymous() {
        return isanonymous;
    }

    public void setIsanonymous(Integer isanonymous) {
        this.isanonymous = isanonymous;
    }

    @XmlTransient
    public Collection<Activity> getActivityCollection() {
        return activityCollection;
    }

    public void setActivityCollection(Collection<Activity> activityCollection) {
        this.activityCollection = activityCollection;
    }

    public Committees getCommitteeId() {
        return committeeId;
    }

    public void setCommitteeId(Committees committeeId) {
        this.committeeId = committeeId;
    }

    public Students getStudentId() {
        return studentId;
    }

    public void setStudentId(Students studentId) {
        this.studentId = studentId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (complaintId != null ? complaintId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Grievances)) {
            return false;
        }
        Grievances other = (Grievances) object;
        if ((this.complaintId == null && other.complaintId != null) || (this.complaintId != null && !this.complaintId.equals(other.complaintId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.govt.webapi.Grievances[ complaintId=" + complaintId + " ]";
    }
    
}
