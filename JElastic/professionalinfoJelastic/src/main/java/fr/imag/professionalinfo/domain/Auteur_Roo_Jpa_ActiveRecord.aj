// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.imag.professionalinfo.domain;

import fr.imag.professionalinfo.domain.Auteur;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Auteur_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Auteur.entityManager;
    
    public static final EntityManager Auteur.entityManager() {
        EntityManager em = new Auteur().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Auteur.countAuteurs() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Auteur o", Long.class).getSingleResult();
    }
    
    public static List<Auteur> Auteur.findAllAuteurs() {
        return entityManager().createQuery("SELECT o FROM Auteur o", Auteur.class).getResultList();
    }
    
    public static Auteur Auteur.findAuteur(Long id) {
        if (id == null) return null;
        return entityManager().find(Auteur.class, id);
    }
    
    public static List<Auteur> Auteur.findAuteurEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Auteur o", Auteur.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Auteur.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Auteur.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Auteur attached = Auteur.findAuteur(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Auteur.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Auteur.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Auteur Auteur.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Auteur merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}