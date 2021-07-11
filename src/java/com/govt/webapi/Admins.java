/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.govt.webapi;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author Pravesh Ganwani
 */
@Entity
@Table(name = "admins")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "Admins.findAll", query = "SELECT a FROM Admins a")
    , @NamedQuery(name = "Admins.findByAdminId", query = "SELECT a FROM Admins a WHERE a.adminId = :adminId")
    , @NamedQuery(name = "Admins.findByName", query = "SELECT a FROM Admins a WHERE a.name = :name")
    , @NamedQuery(name = "Admins.findByEmailId", query = "SELECT a FROM Admins a WHERE a.emailId = :emailId")
    , @NamedQuery(name = "Admins.findByPassword", query = "SELECT a FROM Admins a WHERE a.password = :password")})
public class Admins implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "admin_id")
    private Integer adminId;
    @Basic(optional = false)
    @Column(name = "name")
    private String name;
    @Column(name = "email_id")
    private String emailId;
    @Column(name = "password")
    private String password;

    public Admins() {
    }

    public Admins(Integer adminId) {
        this.adminId = adminId;
    }

    public Admins(Integer adminId, String name) {
        this.adminId = adminId;
        this.name = name;
    }

    public Integer getAdminId() {
        return adminId;
    }

    public void setAdminId(Integer adminId) {
        this.adminId = adminId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
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

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (adminId != null ? adminId.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof Admins)) {
            return false;
        }
        Admins other = (Admins) object;
        if ((this.adminId == null && other.adminId != null) || (this.adminId != null && !this.adminId.equals(other.adminId))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "com.govt.webapi.Admins[ adminId=" + adminId + " ]";
    }
    
}
