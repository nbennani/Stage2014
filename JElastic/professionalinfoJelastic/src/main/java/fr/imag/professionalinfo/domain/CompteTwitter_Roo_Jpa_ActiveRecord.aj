// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.imag.professionalinfo.domain;

import fr.imag.professionalinfo.domain.CompteTwitter;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect CompteTwitter_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager CompteTwitter.entityManager;
    
    public static final EntityManager CompteTwitter.entityManager() {
        EntityManager em = new CompteTwitter().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long CompteTwitter.countCompteTwitters() {
        return entityManager().createQuery("SELECT COUNT(o) FROM CompteTwitter o", Long.class).getSingleResult();
    }
    
    public static List<CompteTwitter> CompteTwitter.findAllCompteTwitters() {
        return entityManager().createQuery("SELECT o FROM CompteTwitter o", CompteTwitter.class).getResultList();
    }
    
    public static CompteTwitter CompteTwitter.findCompteTwitter(Long id) {
        if (id == null) return null;
        return entityManager().find(CompteTwitter.class, id);
    }
    
    public static List<CompteTwitter> CompteTwitter.findCompteTwitterEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM CompteTwitter o", CompteTwitter.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void CompteTwitter.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void CompteTwitter.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            CompteTwitter attached = CompteTwitter.findCompteTwitter(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void CompteTwitter.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void CompteTwitter.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public CompteTwitter CompteTwitter.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        CompteTwitter merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}