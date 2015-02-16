// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.imag.professionalinfo.web;

import fr.imag.professionalinfo.domain.Entreprise;
import fr.imag.professionalinfo.domain.Secteur;
import fr.imag.professionalinfo.web.EntrepriseController;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect EntrepriseController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String EntrepriseController.create(@Valid Entreprise entreprise, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, entreprise);
            return "entreprises/create";
        }
        uiModel.asMap().clear();
        entreprise.persist();
        return "redirect:/entreprises/" + encodeUrlPathSegment(entreprise.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String EntrepriseController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Entreprise());
        return "entreprises/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String EntrepriseController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("entreprise", Entreprise.findEntreprise(id));
        uiModel.addAttribute("itemId", id);
        return "entreprises/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String EntrepriseController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("entreprises", Entreprise.findEntrepriseEntries(firstResult, sizeNo));
            float nrOfPages = (float) Entreprise.countEntreprises() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("entreprises", Entreprise.findAllEntreprises());
        }
        return "entreprises/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String EntrepriseController.update(@Valid Entreprise entreprise, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, entreprise);
            return "entreprises/update";
        }
        uiModel.asMap().clear();
        entreprise.merge();
        return "redirect:/entreprises/" + encodeUrlPathSegment(entreprise.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String EntrepriseController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Entreprise.findEntreprise(id));
        return "entreprises/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String EntrepriseController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Entreprise entreprise = Entreprise.findEntreprise(id);
        entreprise.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/entreprises";
    }
    
    void EntrepriseController.populateEditForm(Model uiModel, Entreprise entreprise) {
        uiModel.addAttribute("entreprise", entreprise);
        uiModel.addAttribute("secteurs", Secteur.findAllSecteurs());
    }
    
    String EntrepriseController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}