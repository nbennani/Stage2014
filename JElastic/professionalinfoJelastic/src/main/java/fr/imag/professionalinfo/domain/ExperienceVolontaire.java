package fr.imag.professionalinfo.domain;

import javax.validation.constraints.Size;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class ExperienceVolontaire {

    @Size(min = 0, max = 0)
    private String Organisation;

    @Size(min = 0, max = 0)
    private String Cause;

    private String Id2;

    @Size(min = 0, max = 0)
    private String Fonction;
}
