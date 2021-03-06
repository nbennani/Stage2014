// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.imag.professionalinfo.domain;

import fr.imag.professionalinfo.domain.Secteur;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Secteur_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Secteur.entityManager;
    
    public static final EntityManager Secteur.entityManager() {
        EntityManager em = new Secteur().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Secteur.countSecteurs() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Secteur o", Long.class).getSingleResult();
    }
    
    public static List<Secteur> Secteur.findAllSecteurs() {
        return entityManager().createQuery("SELECT o FROM Secteur o", Secteur.class).getResultList();
    }
    
    public static Secteur Secteur.findSecteur(Long id) {
        if (id == null) return null;
        return entityManager().find(Secteur.class, id);
    }
    
    public static List<Secteur> Secteur.findSecteurEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Secteur o", Secteur.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Secteur.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Secteur.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Secteur attached = Secteur.findSecteur(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Secteur.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Secteur.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Secteur Secteur.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Secteur merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
