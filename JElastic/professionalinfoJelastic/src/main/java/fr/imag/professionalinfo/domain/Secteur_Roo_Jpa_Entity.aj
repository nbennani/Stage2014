// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.imag.professionalinfo.domain;

import fr.imag.professionalinfo.domain.Secteur;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Secteur_Roo_Jpa_Entity {
    
    declare @type: Secteur: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Secteur.id;
    
    @Version
    @Column(name = "version")
    private Integer Secteur.version;
    
    public Long Secteur.getId() {
        return this.id;
    }
    
    public void Secteur.setId(Long id) {
        this.id = id;
    }
    
    public Integer Secteur.getVersion() {
        return this.version;
    }
    
    public void Secteur.setVersion(Integer version) {
        this.version = version;
    }
    
}
