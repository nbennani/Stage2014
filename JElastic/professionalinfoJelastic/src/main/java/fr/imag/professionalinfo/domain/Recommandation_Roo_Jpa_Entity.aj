// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.imag.professionalinfo.domain;

import fr.imag.professionalinfo.domain.Recommandation;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Recommandation_Roo_Jpa_Entity {
    
    declare @type: Recommandation: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Recommandation.id;
    
    @Version
    @Column(name = "version")
    private Integer Recommandation.version;
    
    public Long Recommandation.getId() {
        return this.id;
    }
    
    public void Recommandation.setId(Long id) {
        this.id = id;
    }
    
    public Integer Recommandation.getVersion() {
        return this.version;
    }
    
    public void Recommandation.setVersion(Integer version) {
        this.version = version;
    }
    
}
