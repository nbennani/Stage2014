// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.imag.professionalinfo.domain;

import fr.imag.professionalinfo.domain.Langage;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Langage_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Langage.entityManager;
    
    public static final EntityManager Langage.entityManager() {
        EntityManager em = new Langage().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Langage.countLangages() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Langage o", Long.class).getSingleResult();
    }
    
    public static List<Langage> Langage.findAllLangages() {
        return entityManager().createQuery("SELECT o FROM Langage o", Langage.class).getResultList();
    }
    
    public static Langage Langage.findLangage(Long id) {
        if (id == null) return null;
        return entityManager().find(Langage.class, id);
    }
    
    public static List<Langage> Langage.findLangageEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Langage o", Langage.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Langage.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Langage.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Langage attached = Langage.findLangage(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Langage.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Langage.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Langage Langage.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Langage merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}