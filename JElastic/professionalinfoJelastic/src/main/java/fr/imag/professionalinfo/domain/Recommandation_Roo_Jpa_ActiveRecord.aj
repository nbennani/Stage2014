// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.imag.professionalinfo.domain;

import fr.imag.professionalinfo.domain.Recommandation;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Recommandation_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Recommandation.entityManager;
    
    public static final EntityManager Recommandation.entityManager() {
        EntityManager em = new Recommandation().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Recommandation.countRecommandations() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Recommandation o", Long.class).getSingleResult();
    }
    
    public static List<Recommandation> Recommandation.findAllRecommandations() {
        return entityManager().createQuery("SELECT o FROM Recommandation o", Recommandation.class).getResultList();
    }
    
    public static Recommandation Recommandation.findRecommandation(Long id) {
        if (id == null) return null;
        return entityManager().find(Recommandation.class, id);
    }
    
    public static List<Recommandation> Recommandation.findRecommandationEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Recommandation o", Recommandation.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Recommandation.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Recommandation.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Recommandation attached = Recommandation.findRecommandation(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Recommandation.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Recommandation.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Recommandation Recommandation.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Recommandation merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
