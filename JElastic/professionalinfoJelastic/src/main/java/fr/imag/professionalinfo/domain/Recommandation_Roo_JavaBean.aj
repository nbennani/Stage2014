// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.imag.professionalinfo.domain;

import fr.imag.professionalinfo.domain.Personne;
import fr.imag.professionalinfo.domain.Recommandation;

privileged aspect Recommandation_Roo_JavaBean {
    
    public String Recommandation.getType() {
        return this.Type;
    }
    
    public void Recommandation.setType(String Type) {
        this.Type = Type;
    }
    
    public String Recommandation.getId2() {
        return this.Id2;
    }
    
    public void Recommandation.setId2(String Id2) {
        this.Id2 = Id2;
    }
    
    public String Recommandation.getRecommandationRecue() {
        return this.RecommandationRecue;
    }
    
    public void Recommandation.setRecommandationRecue(String RecommandationRecue) {
        this.RecommandationRecue = RecommandationRecue;
    }
    
    public Personne Recommandation.getRecommandeur() {
        return this.Recommandeur;
    }
    
    public void Recommandation.setRecommandeur(Personne Recommandeur) {
        this.Recommandeur = Recommandeur;
    }
    
}
