// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.imag.professionalinfo.domain;

import fr.imag.professionalinfo.domain.Certification;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Certification_Roo_Jpa_Entity {
    
    declare @type: Certification: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Certification.id;
    
    @Version
    @Column(name = "version")
    private Integer Certification.version;
    
    public Long Certification.getId() {
        return this.id;
    }
    
    public void Certification.setId(Long id) {
        this.id = id;
    }
    
    public Integer Certification.getVersion() {
        return this.version;
    }
    
    public void Certification.setVersion(Integer version) {
        this.version = version;
    }
    
}
