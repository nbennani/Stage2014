// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package fr.imag.professionalinfo.web;

import fr.imag.professionalinfo.domain.Auteur;
import fr.imag.professionalinfo.domain.Personne;
import fr.imag.professionalinfo.web.AuteurController;
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

privileged aspect AuteurController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AuteurController.create(@Valid Auteur auteur, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, auteur);
            return "auteurs/create";
        }
        uiModel.asMap().clear();
        auteur.persist();
        return "redirect:/auteurs/" + encodeUrlPathSegment(auteur.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AuteurController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Auteur());
        return "auteurs/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AuteurController.show(@PathVariable("id") Long id, Model uiModel) {
        uiModel.addAttribute("auteur", Auteur.findAuteur(id));
        uiModel.addAttribute("itemId", id);
        return "auteurs/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AuteurController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("auteurs", Auteur.findAuteurEntries(firstResult, sizeNo));
            float nrOfPages = (float) Auteur.countAuteurs() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("auteurs", Auteur.findAllAuteurs());
        }
        return "auteurs/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AuteurController.update(@Valid Auteur auteur, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, auteur);
            return "auteurs/update";
        }
        uiModel.asMap().clear();
        auteur.merge();
        return "redirect:/auteurs/" + encodeUrlPathSegment(auteur.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AuteurController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Auteur.findAuteur(id));
        return "auteurs/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AuteurController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Auteur auteur = Auteur.findAuteur(id);
        auteur.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/auteurs";
    }
    
    void AuteurController.populateEditForm(Model uiModel, Auteur auteur) {
        uiModel.addAttribute("auteur", auteur);
        uiModel.addAttribute("personnes", Personne.findAllPersonnes());
    }
    
    String AuteurController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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