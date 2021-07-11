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
@Table(name = "committees")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Committees.findAll", query = "SELECT c FROM Committees c")
    , @NamedQuery(name = "Committees.findById", query = "SELECT c FROM Committees c WHERE c.id = :id")
    , @NamedQuery(name = "Committees.findByName", query = "SELECT c FROM Committees c WHERE c.name = :name")
    , @NamedQuery(name = "Committees.findByType", query = "SELECT c FROM Committees c WHERE c.type = :type")
    , @NamedQuery(name = "Committees.findByEmailId", query = "SELECT c FROM Committees c WHERE c.emailId = :emailId")
    , @NamedQuery(name = "Committees.findByPassword", query = "SELECT c FROM Committees c WHERE c.password = :password")
    , @NamedQuery(name = "Committees.findByRegDatetime", query = "SELECT c FROM Committees c WHERE c.regDatetime = :regDatetime")
    , @NamedQuery(name = "Committees.findByIsverified", query = "SELECT c FROM Committees c WHERE c.isverified = :isverified")
    , @NamedQuery(name = "Committees.findByIsactive", query = "SELECT c FROM Committees c WHERE c.isactive = :isactive")
    , @NamedQuery(name = "Committees.findByParentId", query = "SELECT c FROM Committees c WHERE c.parentId = :parentId")})
public class Committees implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Column(name = "type")
    private String type;
    @Column(name = "email_id")
    private String emailId;
    @Column(name = "password")
    private String password;
    @Column(name = "reg_datetime")
    @Temporal(TemporalType.TIMESTAMP)
    private Date regDatetime;
    @Column(name = "isverified")
    private Integer isverified;
    @Column(name = "isactive")
    private Integer isactive;
    @Column(name = "parent_id")
    private Integer parentId;
    @OneToMany(mappedBy = "committeeId")
    private Collection<Grievances> grievancesCollection;
    @OneToMany(mappedBy = "collegeId")
    private Collection<Students> studentsCollection;

    public Committees() {
    }

    public Committees(Integer id) {
        this.id = id;
    }

    public Committees(Integer id, String name) {
        this.id = id;
        this.name = name;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
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

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    @XmlTransient
    public Collection<Grievances> getGrievancesCollection() {
        return grievancesCollection;
    }

    public void setGrievancesCollection(Collection<Grievances> grievancesCollection) {
        this.grievancesCollection = grievancesCollection;
    }

    @XmlTransient
    public Collection<Students> getStudentsCollection() {
        return studentsCollection;
    }

    public void setStudentsCollection(Collection<Students> studentsCollection) {
        this.studentsCollection = studentsCollection;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Committees)) {
            return false;
        }
        Committees other = (Committees) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.govt.webapi.Committees[ id=" + id + " ]";
    }
    
}
