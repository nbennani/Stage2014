// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.imag.professionalinfo.domain;

import fr.imag.professionalinfo.domain.Auteur;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect Auteur_Roo_Jpa_Entity {
    
    declare @type: Auteur: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long Auteur.id;
    
    @Version
    @Column(name = "version")
    private Integer Auteur.version;
    
    public Long Auteur.getId() {
        return this.id;
    }
    
    public void Auteur.setId(Long id) {
        this.id = id;
    }
    
    public Integer Auteur.getVersion() {
        return this.version;
    }
    
    public void Auteur.setVersion(Integer version) {
        this.version = version;
    }
    
}
