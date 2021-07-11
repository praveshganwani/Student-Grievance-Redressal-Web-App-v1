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
import javax.persistence.CascadeType;
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
@Table(name = "students")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Students.findAll", query = "SELECT s FROM Students s")
    , @NamedQuery(name = "Students.findByStudentId", query = "SELECT s FROM Students s WHERE s.studentId = :studentId")
    , @NamedQuery(name = "Students.findByFirstName", query = "SELECT s FROM Students s WHERE s.firstName = :firstName")
    , @NamedQuery(name = "Students.findByMiddleName", query = "SELECT s FROM Students s WHERE s.middleName = :middleName")
    , @NamedQuery(name = "Students.findByLastName", query = "SELECT s FROM Students s WHERE s.lastName = :lastName")
    , @NamedQuery(name = "Students.findByEmailId", query = "SELECT s FROM Students s WHERE s.emailId = :emailId")
    , @NamedQuery(name = "Students.findByPassword", query = "SELECT s FROM Students s WHERE s.password = :password")
    , @NamedQuery(name = "Students.findByRegDatetime", query = "SELECT s FROM Students s WHERE s.regDatetime = :regDatetime")
    , @NamedQuery(name = "Students.findByIsverified", query = "SELECT s FROM Students s WHERE s.isverified = :isverified")
    , @NamedQuery(name = "Students.findByIsactive", query = "SELECT s FROM Students s WHERE s.isactive = :isactive")})
public class Students implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "student_id")
    private Integer studentId;
    @Basic(optional = false)
    @Column(name = "first_name")
    private String firstName;
    @Basic(optional = false)
    @Column(name = "middle_name")
    private String middleName;
    @Basic(optional = false)
    @Column(name = "last_name")
    private String lastName;
    @Column(name = "email_id")
    private String emailId;
    @Column(name = "password")
    private String password;
    @Lob
    @Column(name = "student_uid")
    private String studentUid;
    @Lob
    @Column(name = "course_name")
    private String courseName;
    @Column(name = "reg_datetime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date regDatetime;
    @Column(name = "isverified")
    private Integer isverified;
    @Column(name = "isactive")
    private Integer isactive;
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "studentId")
    private Collection<Grievances> grievancesCollection;
    @JoinColumn(name = "college_id", referencedColumnName = "id")
    @ManyToOne
    private Committees collegeId;

    public Students() {
    }

    public Students(Integer studentId) {
        this.studentId = studentId;
    }

    public Students(Integer studentId, String firstName, String middleName, String lastName) {
        this.studentId = studentId;
        this.firstName = firstName;
        this.middleName = middleName;
        this.lastName = lastName;
    }

    public Integer getStudentId() {
        return studentId;
    }

    public void setStudentId(Integer studentId) {
        this.studentId = studentId;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getMiddleName() {
        return middleName;
    }

    public void setMiddleName(String middleName) {
        this.middleName = middleName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmailId() {
        return emailId;
    }

    public void setEmailId(String emailId) {
        this.emailId = emailId;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getStudentUid() {
        return studentUid;
    }

    public void setStudentUid(String studentUid) {
        this.studentUid = studentUid;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public Date getRegDatetime() {
        return regDatetime;
    }

    public void setRegDatetime(Date regDatetime) {
        this.regDatetime = regDatetime;
    }

    public Integer getIsverified() {
        return isverified;
    }

    public void setIsverified(Integer isverified) {
        this.isverified = isverified;
    }

    public Integer getIsactive() {
        return isactive;
    }

    public void setIsactive(Integer isactive) {
        this.isactive = isactive;
    }

    @XmlTransient
    public Collection<Grievances> getGrievancesCollection() {
        return grievancesCollection;
    }

    public void setGrievancesCollection(Collection<Grievances> grievancesCollection) {
        this.grievancesCollection = grievancesCollection;
    }

    public Committees getCollegeId() {
        return collegeId;
    }

    public void setCollegeId(Committees collegeId) {
        this.collegeId = collegeId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (studentId != null ? studentId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Students)) {
            return false;
        }
        Students other = (Students) object;
        if ((this.studentId == null && other.studentId != null) || (this.studentId != null && !this.studentId.equals(other.studentId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.govt.webapi.Students[ studentId=" + studentId + " ]";
    }
    
}
