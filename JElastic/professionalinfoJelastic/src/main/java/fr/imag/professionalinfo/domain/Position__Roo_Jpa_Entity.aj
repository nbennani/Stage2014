// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.imag.professionalinfo.domain;

import fr.imag.professionalinfo.domain.Position_;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Position__Roo_Jpa_Entity {
    
    declare @type: Position_: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Position_.id;
    
    @Version
    @Column(name = "version")
    private Integer Position_.version;
    
    public Long Position_.getId() {
        return this.id;
    }
    
    public void Position_.setId(Long id) {
        this.id = id;
    }
    
    public Integer Position_.getVersion() {
        return this.version;
    }
    
    public void Position_.setVersion(Integer version) {
        this.version = version;
    }
    
}
